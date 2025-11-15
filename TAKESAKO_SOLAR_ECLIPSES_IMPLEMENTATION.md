# TakesakoSolarEclipses Function Implementation

## Overview

The `TakesakoSolarEclipses[year]` function has been implemented to reproduce solar eclipses from Shinobu Takesako's comprehensive solar eclipse database by reading directly from the `Takesako_solar_eclipses.txt` file.

## Problem Statement

The previous implementation (`TakesakoSolarEclipse`) used Meeus algorithms which are known to be imprecise for ancient years like 13001 BCE. The user reported that:

- `TakesakoSolarEclipse[-13001]` returned only 1 eclipse (on April 2nd)
- That date didn't even appear in `NeumondAlternate[-13001]`
- The Takesako file shows 2 eclipses for year -13000:
  - April 23, 21:20:47
  - October 18, 23:12:40

## Solution

Instead of trying to compute eclipses using Meeus or other algorithms (which may be imprecise for ancient dates), the new `TakesakoSolarEclipses` function reads directly from Takesako's pre-computed data file.

### Why This Approach Works

1. **Accuracy**: Takesako's data is based on JPL (Jet Propulsion Laboratory) ephemeris data and uses Besselian elements, which are the standard method for representing solar eclipses.

2. **Completeness**: The database covers 30,000 years (-13000 to +16999) with 71,253 solar eclipses.

3. **Reliability**: By reading directly from the file, we eliminate computational errors and ensure exact reproduction of Takesako's results.

## Implementation Details

### Function Signature

```mathematica
TakesakoSolarEclipses[year_]
```

### Input

- `year`: Integer in astronomical year numbering (e.g., -13001 for 13001 BCE)

### Output

A list of eclipses, where each eclipse is represented as:

```mathematica
{dateObject, {hour, minute, second}, eclipseType, catalog, saros, gamma}
```

Where:
- `dateObject`: Julian[year, month, day] for years < 1582, Gregorian[year, month, day] for years ≥ 1582
- `{hour, minute, second}`: Time of maximum eclipse (integers)
- `eclipseType`: String - "T" (Total), "A" (Annular), "P" (Partial), or "H" (Hybrid)
- `catalog`: Integer - Eclipse catalog number
- `saros`: Integer - Saros series number
- `gamma`: Real - Distance of eclipse center from Earth's center (in Earth radii)

### Year Conversion

The function handles the difference between astronomical year numbering systems:

- **Takesako format**: Uses year 0 (e.g., year -13000 = 13001 BCE)
- **Mathematica/Astronomical format**: No year 0 (e.g., year -13001 = 13001 BCE)

Conversion formula:
```
If year <= 0:
    takesako_year = mathematica_year + 1
Else:
    takesako_year = mathematica_year
```

### Calendar Selection

The function automatically selects the appropriate calendar:

- **Julian calendar**: For years < 1582
- **Gregorian calendar**: For years ≥ 1582

This matches the historical transition from Julian to Gregorian calendar in October 1582.

### File Path Resolution

The function attempts to find the `Takesako_solar_eclipses.txt` file in multiple locations:

1. Current directory
2. `/home/runner/work/KalProg/KalProg/Takesako_solar_eclipses.txt` (absolute path)
3. Notebook directory (using `NotebookDirectory[]`)

## Usage Examples

### Example 1: Ancient Year (13001 BCE)

```mathematica
(* Load Calendrica4.m *)
Get["Calendrica4.m"]

(* Get eclipses for year -13001 (13001 BCE) *)
eclipses = TakesakoSolarEclipses[-13001]

(* Output: 2 eclipses *)
(* {{Julian[-13001, 4, 23], {21, 20, 47}, "A", -185524, -324, 0.1237},
    {Julian[-13001, 10, 18], {23, 12, 40}, "T", -185518, -319, 0.7340}} *)
```

### Example 2: Modern Year (2024 CE)

```mathematica
(* Get eclipses for 2024 *)
eclipses = TakesakoSolarEclipses[2024]

(* Output: 2 eclipses *)
(* {{Gregorian[2024, 4, 8], {18, 18, 29}, "T", 300, 139, 0.343},
    {Gregorian[2024, 10, 2], {18, 46, 12}, "A", 306, 144, -0.351}} *)
```

### Example 3: Historical Year (Julian Calendar)

```mathematica
(* Get eclipses for 1500 CE (Julian calendar) *)
eclipses = TakesakoSolarEclipses[1500]

(* Output: 2 eclipses *)
(* {{Julian[1500, 5, 27], {23, 48, 27}, "A", -6179, 129, 0.7831},
    {Julian[1500, 11, 21], {11, 30, 27}, "T", -6173, 134, -0.9395}} *)
```

## Testing

### Automated Testing

A test script `test_takesako_solar_eclipses.m` is provided:

```bash
wolframscript -file test_takesako_solar_eclipses.m
```

### Verification Script

A Python verification script `verify_takesako_function.py` is also provided to test the logic:

```bash
python3 verify_takesako_function.py
```

This script simulates the Mathematica function and verifies that:
- Year conversion works correctly
- File reading and parsing works correctly
- Expected eclipses are found for test years

## Verification Results

The implementation has been verified to correctly return:

### Year -13001 (13001 BCE)
✓ 2 eclipses found
✓ April 23, 21:20:47 (Annular)
✓ October 18, 23:12:40 (Total)

### Year 2024 CE
✓ 2 eclipses found
✓ April 8, 18:18:29 (Total)
✓ October 2, 18:46:12 (Annular)

### Year 1500 CE
✓ 2 eclipses found
✓ May 27, 23:48:27 (Annular)
✓ November 21, 11:30:27 (Total)

## Advantages Over Previous Implementation

1. **Accuracy**: Directly uses Takesako's data instead of computing with potentially imprecise algorithms
2. **Ancient dates**: Works reliably for very ancient dates (up to -13000)
3. **Simplicity**: No complex astronomical calculations needed
4. **Maintenance**: Easy to update by simply replacing the data file
5. **Verifiability**: Results can be directly compared with Takesako's published data

## Data Source

- **File**: `Takesako_solar_eclipses.txt`
- **Source**: Shinobu Takesako's solar eclipse data (ec*.prn files)
- **Website**: http://www.kotenmon.com/
- **Coverage**: Years -13000 to +16999 (30,000 years)
- **Total eclipses**: 71,253 solar eclipses
- **Basis**: JPL ephemeris data with Besselian elements

## Related Functions

- **TakesakoSolarEclipse**: Previous implementation using Meeus algorithm (still available)
- **NeumondAlternate**: Returns new moons for a year
- **SonnenfinsternisTD**: Returns solar eclipses using Meeus algorithm with NeumondGregorian

## File Format

The `Takesako_solar_eclipses.txt` file has the following tab-separated format:

```
Year    Month   Day Hour    Minute  Second  Catalog Saros   Type    Gamma
-13000  4       23  21      20      47      -185524 -324    A       0.1237
-13000  10      18  23      12      40      -185518 -319    T       0.7340
...
```

Columns:
1. **Year**: Astronomical year with year 0 (negative for BCE)
2. **Month**: 1-12
3. **Day**: 1-31
4. **Hour**: 0-23 (UTC)
5. **Minute**: 0-59
6. **Second**: 0-59
7. **Catalog**: Eclipse catalog number
8. **Saros**: Saros series number
9. **Type**: T (Total), A (Annular), P (Partial), H (Hybrid)
10. **Gamma**: Eclipse parameter (distance from Earth's center)

## Notes

1. **Time Zone**: All times are in UTC (Universal Time Coordinated)
2. **Calendar**: The function automatically handles Julian/Gregorian calendar conversion
3. **Precision**: Times are accurate to the second
4. **Coverage**: Limited to years -13000 to +16999 as per Takesako's data

## Version History

- **2025-11-15**: Initial implementation
  - Created `TakesakoSolarEclipses[year]` function
  - Added year conversion (Takesako ↔ Mathematica format)
  - Added calendar selection (Julian/Gregorian)
  - Created test scripts and verification tools

## Author

Implementation created for the KalProg repository to accurately reproduce Takesako's solar eclipse data.

## License

This function is an addition to the Calendrica4.m file, which is subject to the license terms specified in that file.
