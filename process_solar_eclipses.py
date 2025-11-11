#!/usr/bin/env python3
"""
Script to clean and restructure SolarEclipses.txt file.

Transformations:
1. Remove empty lines
2. For entries before year -2000:
   - Split date column (e.g., "-2001-Feb-07") into year, month number, day
3. For entries after year -2000:
   - Remove first 2 obsolete columns
   - Convert month name to month number
4. Split time column (e.g., "03:44:34") into hour, minute, second for all entries
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
    Format: -2001-Feb-07	03:44:34	45857	T	...
    """
    # Strip the line to remove trailing newline
    line = line.rstrip('\n\r')
    parts = line.split('\t')
    if len(parts) < 2:
        return None
    
    # Split the date column (first column)
    date_match = re.match(r'^(\d+\.)?(-?\d+)-([A-Za-z]+)-(\d+)$', parts[0])
    if not date_match:
        return None
    
    line_num = date_match.group(1) if date_match.group(1) else ''
    year = date_match.group(2)
    month_name = date_match.group(3)
    day = date_match.group(4)
    
    # Convert month name to number
    month = MONTH_MAP.get(month_name, month_name)
    
    # Split time (second column)
    hour, minute, second = split_time(parts[1])
    
    # Reconstruct the line
    new_parts = []
    if line_num:
        new_parts.append(line_num.rstrip('.'))
    new_parts.extend([year, month, day, hour, minute, second])
    new_parts.extend(parts[2:])  # Add remaining columns
    
    return '\t'.join(new_parts)


def process_new_format(line):
    """
    Process lines after year -2000.
    Format: 1  001  -1999 Jun 12  03:14:51  46438 ...
    Remove first 2 columns and convert month name to number.
    """
    # Strip the line to remove trailing newline
    line = line.rstrip('\n\r')
    parts = line.split()
    if len(parts) < 7:
        return None
    
    # Skip first 2 columns, then extract year, month name, day
    year = parts[2]
    month_name = parts[3]
    day = parts[4]
    
    # Convert month name to number
    month = MONTH_MAP.get(month_name, month_name)
    
    # Split time (5th element after skipping first 2)
    time_str = parts[5]
    hour, minute, second = split_time(time_str)
    
    # Reconstruct the line with remaining columns
    new_parts = [year, month, day, hour, minute, second]
    new_parts.extend(parts[6:])  # Add remaining columns
    
    return '\t'.join(new_parts)


def process_line(line):
    """Determine format and process the line accordingly."""
    # Skip empty lines (check before stripping to preserve detection)
    if not line.strip():
        return None
    
    # Check if it's old format (starts with optional number then negative year and dash)
    # or new format (starts with optional spaces, then numbers)
    # Note: Check BEFORE stripping to preserve format detection
    if re.match(r'^\s*\d+\s+\d+\s+-?\d{3,4}\s+[A-Za-z]{3}', line):
        # New format (after -2000) - has two number columns before the date
        return process_new_format(line)
    elif re.match(r'^(\d+\.)?-\d{4}-[A-Za-z]{3}-\d{2}', line):
        # Old format (before -2000) - date with dashes
        return process_old_format(line)
    else:
        # Unknown format, return as-is (stripped)
        return line.strip()


def main():
    input_file = 'SolarEclipses.txt'
    output_file = 'SolarEclipses_processed.txt'
    
    processed_lines = []
    skipped_empty = 0
    
    with open(input_file, 'r', encoding='utf-8') as f:
        for line_num, line in enumerate(f, 1):
            if not line.strip():
                skipped_empty += 1
                continue
                
            processed = process_line(line)
            if processed:
                processed_lines.append(processed)
    
    # Write processed lines to output file
    with open(output_file, 'w', encoding='utf-8') as f:
        for line in processed_lines:
            f.write(line + '\n')
    
    print(f"Processing complete!")
    print(f"  Lines processed: {len(processed_lines)}")
    print(f"  Empty lines removed: {skipped_empty}")
    print(f"  Output written to: {output_file}")


if __name__ == '__main__':
    main()
