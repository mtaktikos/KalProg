# Julian Day Calculation for Takesako Solar Eclipses

## Overview

This document describes the process of extracting eclipse data for specific years and calculating Modified Julian Days (MJD) from the Takesako solar eclipse dataset.

## Task Description

From the file `Takesako_solar_eclipses.txt`, extract the first occurrence of eclipses for years at 1000-year intervals (-13000, -12000, -11000, ..., 0, 1000, ..., 16000) and calculate the Modified Julian Day (midnight-based) for each event.

## Implementation

### Script: `calculate_julian_days.py`

The script performs the following steps:

1. **Data Extraction**: Reads `Takesako_solar_eclipses.txt` and extracts the first occurrence of each millennium year
   - Target years: -13000, -12000, -11000, ..., -1000, 0, 1000, ..., 16000
   - Extracts: year, month, day, hour, minute, second

2. **Julian Day Calculation**: Uses the standard algorithm for the proleptic Gregorian calendar
   ```
   a = (14 - month) / 12
   y = year + 4800 - a
   m = month + 12*a - 3
   JD = day + (153*m + 2)/5 + 365*y + y/4 - y/100 + y/400 - 32045
   ```
   This gives the Julian Day Number at noon of the specified date.

3. **Modified Julian Day Conversion**: Converts to MJD (midnight-based)
   ```
   MJD_midnight = JD_noon - 2400001
   ```
   Note: The constant 2400001 is used because:
   - Standard MJD = JD - 2400000.5 (MJD epoch is midnight of Nov 17, 1858)
   - JD calculated above is for noon, so we need to subtract an additional 0.5
   - Therefore: MJD_midnight = JD_noon - 2400000.5 - 0.5 = JD_noon - 2400001

4. **Time Fraction Addition**: Adds the fraction of the day from midnight
   ```
   time_fraction = hour/24.0 + minute/(24.0*60.0) + second/(24.0*3600.0)
   MJD_final = MJD_midnight + time_fraction
   ```

### Output: `JulianDayResults.txt`

The output file contains 30 lines (one for each millennium year) with the following format:

```
MJD   year    month   day   hour   minute   second
```

Each line is tab-separated with:
- **Column 1**: Modified Julian Day (midnight-based, with time fraction) - floating point with 10 decimal places
- **Columns 2-7**: Original date/time components (year, month, day, hour, minute, second) as integers

### Example Entries

```
-5426980.1105671292    -13000    4    23    21    20    47
-5061841.8258217592    -12000    1    10    4     10    49
...
4799775.4475578703     15000     3    20    10    44    29
5164951.3978240741     16000     1    13    9     32    52
```

## Verification

The calculations have been verified against known reference values:
- Jan 1, 2000 at midnight: MJD = 51544.0 ✓
- Nov 17, 1858 at 21:20:47: MJD = 0.8894328704 ✓

All 30 target years from -13000 to 16000 (in 1000-year increments) are present in the output.

## Usage

To regenerate the results:

```bash
python3 calculate_julian_days.py
```

This will:
1. Read from `Takesako_solar_eclipses.txt`
2. Extract the required data
3. Calculate Modified Julian Days
4. Write results to `JulianDayResults.txt`

## References

- Modified Julian Day: https://en.wikipedia.org/wiki/Julian_day#Variants
- Julian Day calculation algorithm: Standard proleptic Gregorian calendar formula
- MJD epoch: Midnight of November 17, 1858 (MJD 0 = JD 2400000.5)
