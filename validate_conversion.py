#!/usr/bin/env python3
"""
Validation script for Takesako lunar eclipse conversion.

This script performs basic validation checks on the output file.
"""

def validate_takesako_conversion():
    """Validate the converted Takesako lunar eclipse data."""
    
    print("Validating takesako_lunar_eclipses.txt...")
    print("=" * 60)
    
    with open('takesako_lunar_eclipses.txt', 'r') as f:
        lines = f.readlines()
    
    # Check 1: File exists and has content
    print(f"\n✓ File exists with {len(lines)} lines")
    
    # Check 2: Header line
    header = lines[0].strip().split('\t')
    expected_columns = ['Year', 'Month', 'Day', 'Hour', 'Minute', 'Second', 
                        'Catalog', 'EclipseType', 'Magnitude1', 'Magnitude2', 
                        'Latitude', 'Longitude']
    
    if header == expected_columns:
        print(f"✓ Header has correct {len(header)} columns")
    else:
        print(f"✗ Header mismatch!")
        print(f"  Expected: {expected_columns}")
        print(f"  Got: {header}")
        return False
    
    # Check 3: All data lines have correct number of columns
    col_errors = 0
    for i, line in enumerate(lines[1:], 2):
        parts = line.strip().split('\t')
        if len(parts) != len(header):
            col_errors += 1
            if col_errors <= 3:  # Only print first 3 errors
                print(f"✗ Line {i}: {len(parts)} columns (expected {len(header)})")
    
    if col_errors == 0:
        print(f"✓ All {len(lines)-1} data lines have {len(header)} columns")
    else:
        print(f"✗ Found {col_errors} lines with incorrect column count")
        return False
    
    # Check 4: Chronological ordering
    prev_year = -999999
    ordering_ok = True
    for i, line in enumerate(lines[1:], 2):
        parts = line.strip().split('\t')
        year = int(parts[0])
        if year < prev_year:
            print(f"✗ Line {i}: Year {year} comes after {prev_year} (not chronological)")
            ordering_ok = False
            break
        prev_year = year
    
    if ordering_ok:
        first_year = int(lines[1].split('\t')[0])
        last_year = int(lines[-1].split('\t')[0])
        print(f"✓ Data is in chronological order (year {first_year} to {last_year})")
    
    # Check 5: Valid eclipse types
    valid_types = {'T', 'P', 'Pen'}
    type_counts = {}
    invalid_types = []
    
    for i, line in enumerate(lines[1:], 2):
        parts = line.strip().split('\t')
        if len(parts) >= 8:
            etype = parts[7]
            type_counts[etype] = type_counts.get(etype, 0) + 1
            if etype not in valid_types:
                invalid_types.append((i, etype))
    
    if not invalid_types:
        print(f"✓ All eclipse types are valid (T, P, or Pen)")
        for etype, count in sorted(type_counts.items()):
            print(f"    {etype}: {count:,} eclipses")
    else:
        print(f"✗ Found {len(invalid_types)} invalid eclipse types")
        for i, etype in invalid_types[:3]:
            print(f"    Line {i}: '{etype}'")
        return False
    
    # Check 6: Valid date ranges
    date_errors = []
    for i, line in enumerate(lines[1:], 2):
        parts = line.strip().split('\t')
        year = int(parts[0])
        month = int(parts[1])
        day = int(parts[2])
        
        if not (1 <= month <= 12):
            date_errors.append(f"Line {i}: Invalid month {month}")
        if not (1 <= day <= 31):
            date_errors.append(f"Line {i}: Invalid day {day}")
        
        if len(date_errors) > 3:
            break
    
    if not date_errors:
        print(f"✓ All dates have valid month (1-12) and day (1-31) values")
    else:
        print(f"✗ Found date validation errors:")
        for err in date_errors[:3]:
            print(f"    {err}")
        return False
    
    # Check 7: Valid time ranges
    time_errors = []
    for i, line in enumerate(lines[1:], 2):
        parts = line.strip().split('\t')
        hour = int(parts[3])
        minute = int(parts[4])
        second = int(parts[5])
        
        if not (0 <= hour <= 23):
            time_errors.append(f"Line {i}: Invalid hour {hour}")
        if not (0 <= minute <= 59):
            time_errors.append(f"Line {i}: Invalid minute {minute}")
        if not (0 <= second <= 59):
            time_errors.append(f"Line {i}: Invalid second {second}")
        
        if len(time_errors) > 3:
            break
    
    if not time_errors:
        print(f"✓ All times have valid hour (0-23), minute (0-59), second (0-59)")
    else:
        print(f"✗ Found time validation errors:")
        for err in time_errors[:3]:
            print(f"    {err}")
        return False
    
    # Check 8: Valid latitude/longitude format
    coord_errors = []
    for i, line in enumerate(lines[1:], 2):
        parts = line.strip().split('\t')
        lat = parts[10]
        lon = parts[11]
        
        # Latitude should end with N or S
        if not (lat.endswith('N') or lat.endswith('S')):
            coord_errors.append(f"Line {i}: Invalid latitude format '{lat}'")
        
        # Longitude should end with E or W
        if not (lon.endswith('E') or lon.endswith('W')):
            coord_errors.append(f"Line {i}: Invalid longitude format '{lon}'")
        
        if len(coord_errors) > 3:
            break
    
    if not coord_errors:
        print(f"✓ All coordinates have valid format (e.g., 12N, 146W)")
    else:
        print(f"✗ Found coordinate format errors:")
        for err in coord_errors[:3]:
            print(f"    {err}")
        return False
    
    # Summary
    print("\n" + "=" * 60)
    print("✓ VALIDATION PASSED")
    print(f"  Total eclipses: {len(lines)-1:,}")
    print(f"  Date range: {first_year} to {last_year}")
    print(f"  Eclipse types: T={type_counts.get('T', 0):,}, P={type_counts.get('P', 0):,}, Pen={type_counts.get('Pen', 0):,}")
    
    return True


if __name__ == '__main__':
    import sys
    success = validate_takesako_conversion()
    sys.exit(0 if success else 1)
