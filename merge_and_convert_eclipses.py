#!/usr/bin/env python3
"""
Script to merge all ec*.prn files chronologically and convert to SolarEclipses.txt format.

The ec*.prn files from Shonobu Takesako contain solar eclipse data in a format with 3 lines per eclipse:
- Line 1: Besselian elements (first set)
- Line 2: Main eclipse data (year, month, day, type, gamma, JD, catalog, Saros, etc.)
- Line 3: Besselian elements (second set)

This script:
1. Merges ecm*.prn (BCE) and ecp*.prn (CE) files in chronological order
2. Extracts the main eclipse data from each 3-line entry
3. Converts to a simplified format with column headers
"""

import os
import re
import glob
from datetime import datetime, timedelta


def jd_to_time(jd):
    """
    Convert Julian Day to hours, minutes, seconds.
    
    Julian Day starts at noon (12:00), not midnight.
    So JD .0 = previous day at noon, JD .5 = current day at midnight.
    
    Args:
        jd: Julian Day number (float)
    
    Returns:
        tuple: (hour, minute, second)
    """
    # Get the fractional part of the day from midnight (not noon)
    # JD starts at noon, so we need to subtract 0.5 to get time from midnight
    frac_day = jd - int(jd) - 0.5
    
    # If the result is negative, it means the time is before noon of the previous day
    # which means it's actually the current day after midnight
    if frac_day < 0:
        frac_day += 1.0
    
    # Convert to hours, minutes, seconds
    total_seconds = frac_day * 86400  # 24 * 60 * 60
    hour = int(total_seconds // 3600)
    minute = int((total_seconds % 3600) // 60)
    second = int(total_seconds % 60)
    
    return hour, minute, second


def parse_eclipse_type(type_code):
    """
    Convert eclipse type code to letter.
    
    Args:
        type_code: Integer code (1-4)
    
    Returns:
        str: Eclipse type letter (P, T, A, H)
    """
    type_map = {
        1: 'P',  # Partial
        2: 'T',  # Total
        3: 'A',  # Annular
        4: 'H',  # Hybrid
    }
    return type_map.get(int(type_code), '?')


def parse_prn_eclipse_line(line):
    """
    Parse the main eclipse data line from a .prn file.
    
    Format: year month day type param gamma JD catalog saros other
    
    Args:
        line: The main eclipse data line
    
    Returns:
        dict: Parsed eclipse data or None if parsing fails
    """
    parts = line.strip().split()
    
    if len(parts) < 10:
        return None
    
    try:
        year = int(parts[0])
        month = int(parts[1])
        day = int(parts[2])
        type_code = int(parts[3])
        # parts[4] is an unknown parameter
        gamma = float(parts[5])
        jd = float(parts[6])
        catalog = int(parts[7])
        saros = int(parts[8])
        # parts[9] is another parameter we don't use
        
        # Calculate time from Julian Day
        hour, minute, second = jd_to_time(jd)
        
        # Get eclipse type letter
        eclipse_type = parse_eclipse_type(type_code)
        
        return {
            'year': year,
            'month': month,
            'day': day,
            'hour': hour,
            'minute': minute,
            'second': second,
            'catalog': catalog,
            'saros': saros,
            'type': eclipse_type,
            'gamma': gamma,
            'jd': jd
        }
    except (ValueError, IndexError) as e:
        return None


def read_prn_file(filename):
    """
    Read a .prn file and extract eclipse data.
    
    Args:
        filename: Path to the .prn file
    
    Returns:
        list: List of eclipse data dictionaries
    """
    eclipses = []
    
    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    # Process every 3rd line (the main eclipse data line)
    # The pattern is: Besselian1, MainData, Besselian2
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        
        # Check if this looks like a main eclipse data line
        # It should start with year month day type_code
        if re.match(r'^\s*-?\d+\s+\d+\s+\d+\s+\d+', line):
            eclipse = parse_prn_eclipse_line(line)
            if eclipse:
                eclipses.append(eclipse)
            # Skip the next 2 lines (Besselian elements)
            i += 3
        else:
            i += 1
    
    return eclipses


def format_eclipse_line(eclipse):
    """
    Format an eclipse data dictionary as a tab-separated line.
    
    Args:
        eclipse: Eclipse data dictionary
    
    Returns:
        str: Formatted line
    """
    # Format: year month day hour minute second catalog saros type gamma
    return '\t'.join([
        str(eclipse['year']),
        str(eclipse['month']),
        str(eclipse['day']),
        f"{eclipse['hour']:02d}",
        f"{eclipse['minute']:02d}",
        f"{eclipse['second']:02d}",
        str(eclipse['catalog']),
        str(eclipse['saros']),
        eclipse['type'],
        f"{eclipse['gamma']:.4f}"
    ])


def get_file_year_range(filename):
    """
    Extract year range from filename.
    
    Args:
        filename: Filename like 'ecm13000m08000.prn' or 'ecp00001p03000.prn'
    
    Returns:
        tuple: (start_year, end_year, is_bce)
    """
    basename = os.path.basename(filename)
    
    # Parse BCE files (ecm...)
    if basename.startswith('ecm'):
        # ecm13000m08000.prn means -13000 to -8000
        match = re.match(r'ecm(\d+)m(\d+)\.prn', basename)
        if match:
            end_year = -int(match.group(1))  # More negative year is earlier
            start_year = -int(match.group(2))  # Less negative year is later
            return (end_year, start_year, True)
    
    # Parse CE files (ecp...)
    elif basename.startswith('ecp'):
        # ecp00001p03000.prn means 1 to 3000
        match = re.match(r'ecp(\d+)p(\d+)\.prn', basename)
        if match:
            start_year = int(match.group(1))
            end_year = int(match.group(2))
            return (start_year, end_year, False)
    
    return (None, None, None)


def merge_and_convert():
    """
    Main function to merge all ec*.prn files and convert to output format.
    """
    # Find all ec*.prn files
    prn_files = glob.glob('ec*.prn')
    
    if not prn_files:
        print("No ec*.prn files found!")
        return
    
    # Sort files by year range
    def sort_key(filename):
        start_year, end_year, is_bce = get_file_year_range(filename)
        if start_year is None:
            return (0, 0)
        # BCE files should come first, then CE files
        return (start_year, end_year)
    
    prn_files.sort(key=sort_key)
    
    print(f"Found {len(prn_files)} .prn files to process:")
    for f in prn_files:
        start, end, is_bce = get_file_year_range(f)
        era = "BCE" if is_bce else "CE"
        print(f"  {f}: years {start} to {end} {era}")
    
    # Process all files and collect eclipses
    all_eclipses = []
    
    for prn_file in prn_files:
        print(f"\nProcessing {prn_file}...")
        eclipses = read_prn_file(prn_file)
        print(f"  Found {len(eclipses)} eclipses")
        all_eclipses.extend(eclipses)
    
    print(f"\nTotal eclipses collected: {len(all_eclipses)}")
    
    # Sort by year, month, day (should already be in order, but ensure it)
    all_eclipses.sort(key=lambda e: (e['year'], e['month'], e['day']))
    
    # Write output file
    output_file = 'merged_solar_eclipses.txt'
    print(f"\nWriting to {output_file}...")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        # Write header line
        f.write('Year\tMonth\tDay\tHour\tMinute\tSecond\tCatalog\tSaros\tType\tGamma\n')
        
        # Write eclipse data
        for eclipse in all_eclipses:
            f.write(format_eclipse_line(eclipse) + '\n')
    
    print(f"\nConversion complete!")
    print(f"  Total eclipses written: {len(all_eclipses)}")
    print(f"  Output file: {output_file}")
    print(f"  Year range: {all_eclipses[0]['year']} to {all_eclipses[-1]['year']}")


if __name__ == '__main__':
    merge_and_convert()
