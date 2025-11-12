#!/usr/bin/env python3
"""
Convert Takesako's ecp*.prn solar eclipse files to SolarEclipses.txt format.

Takesako format (middle line of 3-line eclipse entry):
  YYYY MM DD TYPE GAMMA1 GAMMA2 JD DELTAT SAROS NUM

Where:
  - YYYY, MM, DD: Date
  - TYPE: Eclipse type code (1=P, 2=T, 3=A, 4=H, 5=T edge, 6=A edge)
  - GAMMA1, GAMMA2: Gamma values (use GAMMA2)
  - JD: Julian Date at maximum eclipse
  - DELTAT: Delta T in seconds
  - SAROS: Saros series number
  - NUM: Saros member number

NASA format (tab-separated):
  Year Month Day Hour Minute Second CatalogNum DeltaT Saros Type Gamma Mag Lat Lon ...
  
This script extracts the available fields from Takesako format.
Fields not available in Takesako data are left empty or marked with placeholders.
"""

import re
import sys
import glob
from datetime import datetime, timedelta


def jd_to_datetime(jd):
    """Convert Julian Date to datetime.
    
    Args:
        jd: Julian Date (float)
        
    Returns:
        datetime object or None if out of range
    """
    try:
        # JD 2451545.0 is January 1, 2000, 12:00 TT
        jd_2000 = 2451545.0
        days_from_2000 = jd - jd_2000
        date_2000 = datetime(2000, 1, 1, 12, 0, 0)
        eclipse_datetime = date_2000 + timedelta(days=days_from_2000)
        return eclipse_datetime
    except (OverflowError, ValueError):
        # Date out of range for Python datetime
        return None


def determine_eclipse_type(type_code, gamma):
    """Determine NASA eclipse type from Takesako type code and gamma.
    
    Args:
        type_code: Takesako type code (1-6)
        gamma: Gamma value (float)
        
    Returns:
        str: Eclipse type (T, A, P, H, etc.)
    """
    type_code = int(type_code)
    gamma = float(gamma)
    
    # Based on analysis:
    # Type 1 = P (Partial)
    # Type 2 = T (Total), rarely H for |gamma| > 0.7
    # Type 3 = A (Annular), rarely H for |gamma| > 0.7
    # Type 4 = H (Hybrid)
    # Type 5 = T (Total at edge, |gamma| ≈ 1)
    # Type 6 = A (Annular at edge, |gamma| ≈ 1)
    
    if type_code == 1:
        return 'P'
    elif type_code == 2:
        # Total, possibly Hybrid if gamma is high
        if abs(gamma) > 0.75:
            return 'H'
        return 'T'
    elif type_code == 3:
        # Annular, possibly Hybrid if gamma is high
        if abs(gamma) > 0.75:
            return 'H'
        return 'A'
    elif type_code == 4:
        return 'H'
    elif type_code == 5:
        return 'T'
    elif type_code == 6:
        return 'A'
    else:
        return 'P'  # Default to partial


def process_ecp_file(filename):
    """Process a single ecp*.prn file and extract eclipse data.
    
    Args:
        filename: Path to ecp*.prn file
        
    Returns:
        list: List of eclipse records (dicts)
    """
    eclipses = []
    
    with open(filename, 'r') as f:
        for line in f:
            # Match lines that start with whitespace followed by date pattern
            # Format: "     YYYY MM DD TYPE ..." or " YYYYY MM DD TYPE ..."
            # The year can be 1-5 digits (e.g., 1, 999, 1999, 13001)
            if re.match(r'^\s*\d{1,5}\s+\d{1,2}\s+\d{1,2}\s+\d+', line):
                parts = line.split()
                if len(parts) >= 10:
                    year = int(parts[0])
                    month = int(parts[1])
                    day = int(parts[2])
                    type_code = parts[3]
                    gamma1 = parts[4]  # Not used
                    gamma = parts[5]
                    jd = float(parts[6])
                    delta_t = int(parts[7])
                    saros = int(parts[8])
                    saros_num = int(parts[9])
                    
                    # Calculate time from Julian Date
                    dt = jd_to_datetime(jd)
                    
                    if dt is None:
                        # Skip eclipses with dates out of Python datetime range
                        continue
                    
                    # Determine eclipse type
                    eclipse_type = determine_eclipse_type(type_code, gamma)
                    
                    eclipse = {
                        'year': year,
                        'month': month,
                        'day': day,
                        'hour': dt.hour,
                        'minute': dt.minute,
                        'second': dt.second,
                        'catalog_num': '',  # Not available in Takesako format
                        'delta_t': delta_t,
                        'saros': saros,
                        'type': eclipse_type,
                        'gamma': gamma,
                        'magnitude': '',  # Not available (or needs calculation)
                        'latitude': '',  # Not available
                        'longitude': '',  # Not available
                        'path_width': '',  # Not available
                        'central_duration': ''  # Not available
                    }
                    
                    eclipses.append(eclipse)
    
    return eclipses


def format_eclipse_line(eclipse):
    """Format an eclipse record as a tab-separated line.
    
    Args:
        eclipse: Eclipse record (dict)
        
    Returns:
        str: Formatted line
    """
    # Format with consistent field widths
    fields = [
        str(eclipse['year']),
        str(eclipse['month']),
        str(eclipse['day']),
        f"{eclipse['hour']:02d}",
        f"{eclipse['minute']:02d}",
        f"{eclipse['second']:02d}",
        str(eclipse['catalog_num']),  # Empty for now
        str(eclipse['delta_t']),
        str(eclipse['saros']),
        eclipse['type'],
        eclipse['gamma'],
        eclipse['magnitude'],  # Empty for now
        eclipse['latitude'],  # Empty for now
        eclipse['longitude'],  # Empty for now
        eclipse['path_width'],  # Empty for now
        eclipse['central_duration']  # Empty for now
    ]
    
    return '\t'.join(fields)


def main():
    """Main function to process all ecp*.prn files."""
    if len(sys.argv) > 1:
        # Process specific files provided as arguments
        ecp_files = sys.argv[1:]
    else:
        # Find all ecp*.prn files in current directory
        ecp_files = sorted(glob.glob('ecp*.prn'))
    
    if not ecp_files:
        print("No ecp*.prn files found!", file=sys.stderr)
        sys.exit(1)
    
    print(f"Found {len(ecp_files)} file(s) to process", file=sys.stderr)
    
    all_eclipses = []
    
    for filename in ecp_files:
        print(f"Processing {filename}...", file=sys.stderr)
        eclipses = process_ecp_file(filename)
        all_eclipses.extend(eclipses)
        print(f"  Extracted {len(eclipses)} eclipses", file=sys.stderr)
    
    # Sort by date
    all_eclipses.sort(key=lambda e: (e['year'], e['month'], e['day'], 
                                     e['hour'], e['minute'], e['second']))
    
    # Write to output
    output_file = 'SolarEclipses_from_Takesako.txt'
    with open(output_file, 'w') as f:
        for eclipse in all_eclipses:
            f.write(format_eclipse_line(eclipse) + '\n')
    
    print(f"\nTotal eclipses processed: {len(all_eclipses)}", file=sys.stderr)
    print(f"Output written to: {output_file}", file=sys.stderr)


if __name__ == '__main__':
    main()
