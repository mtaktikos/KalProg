#!/usr/bin/env python3
"""
Script to extract eclipse data for specific years and calculate Modified Julian Days.

From Takesako_solar_eclipses.txt, extracts the first occurrence of years at 1000-year intervals
(-13000, -12000, -11000, ..., 0, 1000, ..., 16000) and calculates the Modified Julian Day
(midnight-based) for each.

Output format: MJD, year, month, day, hour, minute, second
"""


def calculate_julian_day(year, month, day):
    """
    Calculate the Julian Day Number for a given date.
    
    Uses the algorithm for the proleptic Gregorian calendar.
    This gives the JD at noon (12:00) of the given date.
    
    Args:
        year: Year (can be negative for BCE)
        month: Month (1-12)
        day: Day (1-31)
    
    Returns:
        Julian Day Number (at noon)
    """
    a = (14 - month) // 12
    y = year + 4800 - a
    m = month + 12 * a - 3
    
    jd = day + (153 * m + 2) // 5 + 365 * y + y // 4 - y // 100 + y // 400 - 32045
    
    return jd


def calculate_time_fraction(hour, minute, second):
    """
    Calculate the fraction of a day from time components.
    
    Args:
        hour: Hour (0-23)
        minute: Minute (0-59)
        second: Second (0-59)
    
    Returns:
        Fraction of day as a float
    """
    return hour / 24.0 + minute / (24.0 * 60.0) + second / (24.0 * 3600.0)


def extract_millennium_years(input_file):
    """
    Extract the first occurrence of each millennium year from the input file.
    
    Args:
        input_file: Path to Takesako_solar_eclipses.txt
    
    Returns:
        List of tuples (year, month, day, hour, minute, second)
    """
    # Generate the list of target years: -13000, -12000, ..., 0, 1000, ..., 16000
    target_years = []
    for y in range(-13000, 17000, 1000):
        target_years.append(y)
    
    target_years_set = set(target_years)
    found_years = set()
    results = []
    
    with open(input_file, 'r', encoding='utf-8') as f:
        # Skip header line
        header = f.readline()
        
        for line in f:
            parts = line.strip().split('\t')
            if len(parts) < 6:
                continue
            
            try:
                year = int(parts[0])
                
                # Check if this is a target year we haven't found yet
                if year in target_years_set and year not in found_years:
                    month = int(parts[1])
                    day = int(parts[2])
                    hour = int(parts[3])
                    minute = int(parts[4])
                    second = int(parts[5])
                    
                    results.append((year, month, day, hour, minute, second))
                    found_years.add(year)
                    
                    # Stop if we've found all target years
                    if len(found_years) == len(target_years):
                        break
            except (ValueError, IndexError):
                continue
    
    # Sort by year to ensure chronological order
    results.sort(key=lambda x: x[0])
    
    return results


def main():
    input_file = 'Takesako_solar_eclipses.txt'
    output_file = 'JulianDayResults.txt'
    
    print("Extracting millennium year eclipses...")
    eclipse_data = extract_millennium_years(input_file)
    
    print(f"Found {len(eclipse_data)} millennium year entries")
    
    # Calculate Julian Days and write to output
    results = []
    for year, month, day, hour, minute, second in eclipse_data:
        # Calculate Julian Day at noon
        jd_noon = calculate_julian_day(year, month, day)
        
        # Calculate Modified Julian Day (midnight-based)
        # JD is calculated for noon of the date
        # MJD = JD - 2400000.5 (standard definition)
        # At midnight of the date: JD_midnight = JD_noon - 0.5
        # So MJD_midnight = JD_noon - 0.5 - 2400000.5 = JD_noon - 2400001
        mjd_midnight = jd_noon - 2400001
        
        # Calculate time fraction from midnight
        time_fraction = calculate_time_fraction(hour, minute, second)
        
        # Add time fraction to get the exact MJD
        mjd_final = mjd_midnight + time_fraction
        
        results.append((mjd_final, year, month, day, hour, minute, second))
    
    # Write results to file
    with open(output_file, 'w', encoding='utf-8') as f:
        for mjd, year, month, day, hour, minute, second in results:
            # Format: MJD (with precision), year, month, day, hour, minute, second
            f.write(f"{mjd:.10f}\t{year}\t{month}\t{day}\t{hour}\t{minute}\t{second}\n")
    
    print(f"\nResults written to {output_file}")
    print(f"Total entries: {len(results)}")
    
    # Print first and last few entries for verification
    print("\nFirst 3 entries:")
    for mjd, year, month, day, hour, minute, second in results[:3]:
        print(f"  MJD: {mjd:.10f}  Date: {year:6d}-{month:02d}-{day:02d} {hour:02d}:{minute:02d}:{second:02d}")
    
    print("\nLast 3 entries:")
    for mjd, year, month, day, hour, minute, second in results[-3:]:
        print(f"  MJD: {mjd:.10f}  Date: {year:6d}-{month:02d}-{day:02d} {hour:02d}:{minute:02d}:{second:02d}")


if __name__ == '__main__':
    main()
