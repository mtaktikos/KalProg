#!/usr/bin/env python3
"""
Script to clean and restructure LunarEclipses.txt file.

Transformations:
1. Remove empty lines and header lines
2. For entries before year -2000:
   - Split date column (e.g., "-3999-Jan-02") into year, month number, day
   - Split time column (e.g., "17:35:11") into hour, minute, second
   - Keep DT column
   - Keep eclipse type column
   - Delete middle numeric columns, keep last 4 columns
3. For entries after year -2000:
   - Remove first obsolete column (catalog number)
   - Convert month name to month number
   - Split time column into hour, minute, second
   - Keep DT column
   - Remove two obsolete columns after DT
   - Keep eclipse type column (field 9 with T+, T-, N, P variants)
   - Delete qualifier column (field 10 with pp, -a, etc.)
   - Delete numeric columns between eclipse type and last 4 columns
   - Keep last 4 columns
"""

import re
import sys

# Month name to number mapping
MONTH_MAP = {
    'Jan': '1', 'Feb': '2', 'Mar': '3', 'Apr': '4',
    'May': '5', 'Jun': '6', 'Jul': '7', 'Aug': '8',
    'Sep': '9', 'Oct': '10', 'Nov': '11', 'Dec': '12'
}


def split_time(time_str):
    """Split time string HH:MM:SS into three separate values."""
    parts = time_str.split(':')
    if len(parts) == 3:
        return parts[0], parts[1], parts[2]
    return time_str, '', ''


def process_old_format(line):
    """
    Process lines before year -2000.
    Format: -3999-Jan-02	17:35:11	106769	Pen	-1.0712	0.8804	-0.0958	235.1	—	—	22N	178W
    
    Output format:
    year	month	day	hour	min	sec	DT	EclType	Last4Columns
    """
    line = line.rstrip('\n\r')
    parts = line.split('\t')
    if len(parts) < 12:
        return None
    
    # Split the date column (first column)
    date_match = re.match(r'^(-?\d+)-([A-Za-z]+)-(\d+)$', parts[0])
    if not date_match:
        return None
    
    year = date_match.group(1)
    month_name = date_match.group(2)
    day = date_match.group(3)
    
    # Convert month name to number
    month = MONTH_MAP.get(month_name, month_name)
    
    # Split time (second column)
    hour, minute, second = split_time(parts[1])
    
    # Columns: 0=date, 1=time, 2=DT, 3=EclType, 4-7=middle data, 8-11=last 4
    # Keep: year, month, day, hour, min, sec, DT, EclType, last 4 columns
    new_parts = [year, month, day, hour, minute, second]
    new_parts.append(parts[2])  # DT
    new_parts.append(parts[3])  # Eclipse Type
    new_parts.extend(parts[8:12])  # Last 4 columns
    
    return '\t'.join(new_parts)


def process_new_format(line):
    """
    Process lines after year -2000.
    Format: 00001  -1999 Jun 26  14:13:28  46437 -49456  017   N   t-  -1.0981  0.8791 -0.1922  268.8    -      -     24S   22W
    
    Fields (space-separated):
    0: Catalog (DELETE)
    1: Year
    2: Month name
    3: Day
    4: Time
    5: DT
    6-7: Obsolete columns (DELETE)
    8: Eclipse type (KEEP - has T+, T-, N, P)
    9: Qualifier (DELETE - has pp, -a, t-, etc.)
    10-13: Middle numeric data (DELETE)
    14-17: Last 4 columns (KEEP)
    
    Output format:
    year	month	day	hour	min	sec	DT	EclType	Last4Columns
    """
    line = line.rstrip('\n\r')
    parts = line.split()
    if len(parts) < 18:
        return None
    
    # Extract year, month name, day (fields 1-3, skip field 0)
    year = parts[1]
    month_name = parts[2]
    day = parts[3]
    
    # Convert month name to number
    month = MONTH_MAP.get(month_name, month_name)
    
    # Split time (field 4)
    time_str = parts[4]
    hour, minute, second = split_time(time_str)
    
    # Reconstruct the line
    new_parts = [year, month, day, hour, minute, second]
    new_parts.append(parts[5])  # DT (field 5)
    new_parts.append(parts[8])  # Eclipse type (field 8 - has T+, T-, N, P)
    new_parts.extend(parts[14:18])  # Last 4 columns (fields 14-17)
    
    return '\t'.join(new_parts)


def is_data_line(line):
    """Check if line contains actual eclipse data."""
    stripped = line.strip()
    if not stripped:
        return False
    
    # Check if it's a header/descriptive line (contains only text, no date pattern)
    if re.match(r'^\d+\.$', stripped):  # Just a number with period
        return False
    if re.match(r'^[A-Za-z\s\(\)°]+$', stripped):  # Only letters, spaces, and symbols
        return False
    if 'Calendar' in stripped or 'Date' in stripped or 'Eclipse' in stripped:
        return False
    if 'Greatest' in stripped or 'Gamma' in stripped or 'Type' in stripped:
        return False
    
    return True


def process_line(line):
    """Determine format and process the line accordingly."""
    if not is_data_line(line):
        return None
    
    # Check if it's old format (starts with negative year and dash)
    if re.match(r'^-\d{4}-[A-Za-z]{3}-\d{2}', line):
        return process_old_format(line)
    # Check if it's new format (starts with 5-digit catalog number)
    elif re.match(r'^\d{5}\s', line):
        return process_new_format(line)
    else:
        # Unknown format
        return None


def main():
    input_file = 'LunarEclipses.txt'
    output_file = 'LunarEclipses_processed.txt'
    
    processed_lines = []
    skipped_empty = 0
    skipped_header = 0
    
    with open(input_file, 'r', encoding='utf-8') as f:
        for line_num, line in enumerate(f, 1):
            if not line.strip():
                skipped_empty += 1
                continue
            
            if not is_data_line(line):
                skipped_header += 1
                continue
            
            processed = process_line(line)
            if processed:
                processed_lines.append(processed)
            else:
                # Debug: print lines that couldn't be processed
                if line.strip():
                    print(f"Warning: Could not process line {line_num}: {line[:80]}")
    
    # Write processed lines to output file
    with open(output_file, 'w', encoding='utf-8') as f:
        for line in processed_lines:
            f.write(line + '\n')
    
    print(f"Processing complete!")
    print(f"  Lines processed: {len(processed_lines)}")
    print(f"  Empty lines removed: {skipped_empty}")
    print(f"  Header lines removed: {skipped_header}")
    print(f"  Output written to: {output_file}")


if __name__ == '__main__':
    main()
