#!/usr/bin/env python3
"""
Script to merge and convert Takesako mc*.prn files to LunarEclipses.txt format.

The mc*.prn files contain lunar eclipse data from Shinobu Takesako based on JPL data.
Each eclipse is represented by 3 lines:
- Line 1: Year Month Day Type ... JulianDay ...
- Line 2: Additional numeric data including longitude info
- Line 3: Additional numeric data including latitude info

This script:
1. Merges all mcm*.prn files (BCE dates) in chronological order
2. Merges all mcp*.prn files (CE dates) in chronological order  
3. Converts to LunarEclipses.txt format with column headers
"""

import sys
import re
import glob
from pathlib import Path
from datetime import datetime, timedelta


def julian_day_to_datetime(jd):
    """
    Convert Julian Day to datetime.
    Using a standard algorithm for Julian Day conversion.
    JD is defined with 0.5 representing noon.
    """
    # Separate integer and fractional parts properly for negative JDs
    if jd >= 0:
        z = int(jd + 0.5)
        f = jd + 0.5 - z
    else:
        z = int(jd + 0.5)
        if jd + 0.5 != z:  # If there's a fractional part
            z -= 1  # Adjust for negative numbers
            f = jd + 0.5 - z
        else:
            f = 0
    
    if z < 2299161:
        a = z
    else:
        alpha = int((z - 1867216.25) / 36524.25)
        a = z + 1 + alpha - alpha // 4
    
    b = a + 1524
    c = int((b - 122.1) / 365.25)
    d = int(365.25 * c)
    e = int((b - d) / 30.6001)
    
    day = b - d - int(30.6001 * e) + f
    
    if e < 14:
        month = e - 1
    else:
        month = e - 13
    
    if month > 2:
        year = c - 4716
    else:
        year = c - 4715
    
    # Extract time from the fractional day
    day_int = int(day)
    day_frac = day - day_int
    
    # Ensure fraction is positive
    if day_frac < 0:
        day_int -= 1
        day_frac += 1.0
    
    hours = day_frac * 24
    hour = int(hours)
    minutes = (hours - hour) * 60
    minute = int(minutes)
    seconds = (minutes - minute) * 60
    second = int(seconds)
    
    return year, month, day_int, hour, minute, second


def format_latitude(lat_deg):
    """Convert latitude from decimal degrees to format like '22N' or '14S'."""
    if lat_deg >= 0:
        return f"{int(round(abs(lat_deg)))}N"
    else:
        return f"{int(round(abs(lat_deg)))}S"


def format_longitude(lon_deg):
    """Convert longitude from decimal degrees to format like '178W' or '117E'."""
    # Normalize to -180 to 180 range
    while lon_deg > 180:
        lon_deg -= 360
    while lon_deg < -180:
        lon_deg += 360
    
    if lon_deg >= 0:
        return f"{int(round(abs(lon_deg)))}E"
    else:
        return f"{int(round(abs(lon_deg)))}W"


def parse_eclipse_record(line1, line2, line3):
    """
    Parse a 3-line eclipse record from a .prn file.
    
    Returns a tuple with the eclipse data, or None if parsing fails.
    """
    try:
        # Parse line 1
        parts1 = line1.split()
        if len(parts1) < 11:
            return None
        
        year = int(parts1[0])
        month = int(parts1[1])
        day = int(parts1[2])
        eclipse_type_code = int(parts1[3])
        
        # Map eclipse type code to letter
        # Based on observation: 1=Total, 2=Partial, 3=Penumbral
        eclipse_type_map = {
            1: 'T',
            2: 'P',
            3: 'Pen'
        }
        eclipse_type = eclipse_type_map.get(eclipse_type_code, '?')
        
        # Julian day is typically around position 7
        jd_str = parts1[7]
        julian_day = float(jd_str)
        
        # Get time from Julian day
        jd_year, jd_month, jd_day, hour, minute, second = julian_day_to_datetime(julian_day)
        
        # Parse line 2 - contains longitude information
        parts2 = line2.split()
        if len(parts2) < 9:
            return None
        # Second to last column often contains longitude-related value
        lon_value = float(parts2[-2])  # This appears to be in degrees (0-360 range)
        
        # Parse line 3 - contains latitude information  
        parts3 = line3.split()
        if len(parts3) < 10:
            return None
        # Second to last column contains latitude
        lat_deg = float(parts3[-2])
        
        # Convert longitude from 0-360 to -180 to 180
        lon_deg = lon_value
        if lon_deg > 180:
            lon_deg = lon_deg - 360
        
        # Format lat/long
        lat_str = format_latitude(lat_deg)
        lon_str = format_longitude(lon_deg)
        
        # Get magnitude values from line 2 or use placeholders
        # Columns 9-10 or similar often contain magnitude data
        # Using '—' as placeholder for now if not available
        mag1 = '—'
        mag2 = '—'
        
        # Try to extract magnitude values if eclipse is not penumbral
        if eclipse_type != 'Pen' and len(parts2) >= 10:
            # These might be in specific positions - needs verification
            # For now, use placeholders
            mag1 = '—'
            mag2 = '—'
        
        # Create catalog number - use a simple sequential approach or placeholder
        # The original files don't seem to have the same catalog system
        catalog = 0
        
        return {
            'year': year,
            'month': month,
            'day': day,
            'hour': hour,
            'minute': minute,
            'second': second,
            'catalog': catalog,
            'eclipse_type': eclipse_type,
            'mag1': mag1,
            'mag2': mag2,
            'latitude': lat_str,
            'longitude': lon_str,
            'jd': julian_day
        }
    
    except (ValueError, IndexError) as e:
        print(f"Error parsing record: {e}", file=sys.stderr)
        print(f"Line 1: {line1[:80]}", file=sys.stderr)
        return None


def process_prn_file(filename):
    """
    Process a single .prn file and return list of eclipse records.
    
    Each eclipse consists of 3 lines in the file.
    """
    eclipses = []
    
    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    # Process in groups of 3 lines
    i = 0
    while i < len(lines) - 2:
        line1 = lines[i].strip()
        line2 = lines[i + 1].strip()
        line3 = lines[i + 2].strip()
        
        # Skip empty lines
        if not line1 or not line2 or not line3:
            i += 1
            continue
        
        # Check if line1 looks like an eclipse date line (starts with year)
        if not re.match(r'^\s*-?\d+\s+\d+\s+\d+\s+\d+', line1):
            i += 1
            continue
        
        eclipse = parse_eclipse_record(line1, line2, line3)
        if eclipse:
            eclipses.append(eclipse)
        
        i += 3
    
    return eclipses


def merge_and_convert_files():
    """
    Merge all mc*.prn files and convert to LunarEclipses.txt format.
    """
    # Get all mcm and mcp files
    mcm_files = sorted(glob.glob('mcm*.prn'))
    mcp_files = sorted(glob.glob('mcp*.prn'))
    
    print(f"Found {len(mcm_files)} mcm files (BCE dates)")
    print(f"Found {len(mcp_files)} mcp files (CE dates)")
    
    all_eclipses = []
    
    # Process mcm files (oldest to newest)
    for filename in mcm_files:
        print(f"Processing {filename}...")
        eclipses = process_prn_file(filename)
        all_eclipses.extend(eclipses)
        print(f"  Found {len(eclipses)} eclipses")
    
    # Process mcp files
    for filename in mcp_files:
        print(f"Processing {filename}...")
        eclipses = process_prn_file(filename)
        all_eclipses.extend(eclipses)
        print(f"  Found {len(eclipses)} eclipses")
    
    # Sort by Julian Day to ensure chronological order
    all_eclipses.sort(key=lambda e: e['jd'])
    
    print(f"\nTotal eclipses: {len(all_eclipses)}")
    
    # Write output file
    output_file = 'takesako_lunar_eclipses.txt'
    with open(output_file, 'w', encoding='utf-8') as f:
        # Write header
        f.write("Year\tMonth\tDay\tHour\tMinute\tSecond\tCatalog\tEclipseType\tMagnitude1\tMagnitude2\tLatitude\tLongitude\n")
        
        # Write data
        for eclipse in all_eclipses:
            f.write(f"{eclipse['year']}\t")
            f.write(f"{eclipse['month']}\t")
            f.write(f"{eclipse['day']:02d}\t")
            f.write(f"{eclipse['hour']:02d}\t")
            f.write(f"{eclipse['minute']:02d}\t")
            f.write(f"{eclipse['second']:02d}\t")
            f.write(f"{eclipse['catalog']}\t")
            f.write(f"{eclipse['eclipse_type']}\t")
            f.write(f"{eclipse['mag1']}\t")
            f.write(f"{eclipse['mag2']}\t")
            f.write(f"{eclipse['latitude']}\t")
            f.write(f"{eclipse['longitude']}\n")
    
    print(f"\nOutput written to: {output_file}")
    print(f"First eclipse: {all_eclipses[0]['year']}/{all_eclipses[0]['month']}/{all_eclipses[0]['day']}")
    print(f"Last eclipse: {all_eclipses[-1]['year']}/{all_eclipses[-1]['month']}/{all_eclipses[-1]['day']}")


if __name__ == '__main__':
    merge_and_convert_files()
