#!/usr/bin/env python3
"""
Script to clean and restructure LunarEclipses.txt file.

Transformations:
1. Remove empty lines and lines without date/time
2. For entries before year -1999 (old format):
   - Split date column into year, month number, day
   - Split time column into hour, minute, second
   - Keep DT column
   - Keep eclipse type
   - Delete middle columns between eclipse type and last 4 columns
   - Keep last 4 columns
3. For entries after year -2000 (new format):
   - Remove first obsolete column (Cat Num)
   - Split date into year, month number, day
   - Split time into hour, minute, second
   - Keep DT column
   - Remove two obsolete columns after DT (Luna Num, Saros Num)
   - Keep eclipse type
   - Delete columns between eclipse type and last 4 columns
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
    Process lines before year -1999 (old format).
    Format: -2000-Jan-12	01:49:00	45834	T	0.2645	2.3729	1.3723	329.7	209.8	82.7	24N	166E
    
    Output: Year	Month	Day	Hour	Min	Sec	DT	Type	Last4Col1	Last4Col2	Last4Col3	Last4Col4
    """
    # Strip the line
    line = line.rstrip('\n\r')
    parts = line.split('\t')
    
    # Need at least date, time, DT, type, and 4 last columns = 8 fields minimum
    if len(parts) < 8:
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
    
    # Get DT (third column)
    dt = parts[2]
    
    # Get eclipse type (fourth column)
    eclipse_type = parts[3]
    
    # Get last 4 columns
    last_4 = parts[-4:]
    
    # Reconstruct the line
    new_parts = [year, month, day, hour, minute, second, dt, eclipse_type] + last_4
    
    return '\t'.join(new_parts)


def process_new_format(line):
    """
    Process lines after year -2000 (new format).
    Format: 00001  -1999 Jun 26  14:13:28  46437 -49456  017   N   t-  -1.0981  0.8791 -0.1922  268.8    -      -     24S   22W
    
    Columns:
    1. Cat Num (remove)
    2. Year
    3. Month name
    4. Day
    5. Time
    6. DT
    7. Luna Num (remove)
    8. Saros Num (remove)
    9. Eclipse Type (keep)
    10-14. Middle columns (remove)
    15-18. Last 4 columns (keep)
    
    Output: Year	Month	Day	Hour	Min	Sec	DT	Type	Last4Col1	Last4Col2	Last4Col3	Last4Col4
    """
    # Strip the line
    line = line.rstrip('\n\r')
    parts = line.split()
    
    # Need at least 18 fields
    if len(parts) < 18:
        return None
    
    # Skip first column (Cat Num), extract year, month name, day
    year = parts[1]
    month_name = parts[2]
    day = parts[3]
    
    # Convert month name to number
    month = MONTH_MAP.get(month_name, month_name)
    
    # Split time
    time_str = parts[4]
    hour, minute, second = split_time(time_str)
    
    # Get DT (column 5)
    dt = parts[5]
    
    # Skip columns 6-7 (Luna Num, Saros Num)
    # Get eclipse type (column 8 in 0-indexed, which is column 9 in 1-indexed)
    eclipse_type = parts[8]
    
    # Get last 4 columns
    last_4 = parts[-4:]
    
    # Reconstruct the line
    new_parts = [year, month, day, hour, minute, second, dt, eclipse_type] + last_4
    
    return '\t'.join(new_parts)


def process_line(line):
    """Determine format and process the line accordingly."""
    # Skip empty lines
    if not line.strip():
        return None
    
    # Check if line contains a date pattern
    # Old format: starts with -YYYY-MMM-DD (tab-separated)
    if re.match(r'^-?\d{4}-[A-Za-z]{3}-\d{2}\t', line):
        return process_old_format(line)
    # New format: starts with spaces and numbers, then year month day
    elif re.match(r'^\s*\d+\s+-?\d{3,4}\s+[A-Za-z]{3}\s+\d{1,2}\s+\d{2}:\d{2}:\d{2}', line):
        return process_new_format(line)
    else:
        # Line without date/time (header, empty, etc.) - skip
        return None


def main():
    input_file = 'LunarEclipses.txt'
    output_file = 'LunarEclipses_processed.txt'
    
    processed_lines = []
    skipped_lines = 0
    
    with open(input_file, 'r', encoding='utf-8') as f:
        for line_num, line in enumerate(f, 1):
            if not line.strip():
                skipped_lines += 1
                continue
                
            processed = process_line(line)
            if processed:
                processed_lines.append(processed)
            else:
                skipped_lines += 1
    
    # Write processed lines to output file
    with open(output_file, 'w', encoding='utf-8') as f:
        for line in processed_lines:
            f.write(line + '\n')
    
    print(f"Processing complete!")
    print(f"  Lines processed: {len(processed_lines)}")
    print(f"  Lines skipped (empty/header/etc.): {skipped_lines}")
    print(f"  Output written to: {output_file}")


if __name__ == '__main__':
    main()
