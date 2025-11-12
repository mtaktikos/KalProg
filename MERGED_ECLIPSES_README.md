# Merged Solar Eclipses Data

## Overview

This document describes the merged and converted solar eclipse data from Shonobu Takesako's ec*.prn files (based on JPL data).

## Source Files

The original data comes from 7 .prn files:
- `ecm13000m08000.prn` - BCE years -13000 to -8000 (11,876 eclipses)
- `ecm07999m03000.prn` - BCE years -7999 to -3000 (11,884 eclipses)
- `ecm02999m00000.prn` - BCE years -2999 to 0 (7,138 eclipses)
- `ecp00001p03000.prn` - CE years 1 to 3000 (7,124 eclipses)
- `ecp03001p08000.prn` - CE years 3001 to 8000 (11,845 eclipses)
- `ecp08001p13000.prn` - CE years 8001 to 13000 (11,895 eclipses)
- `ecp13001p16999.prn` - CE years 13001 to 16999 (9,491 eclipses)

**Total**: 71,253 solar eclipses covering 30,000 years (-13000 to 16999)

## Output File

**File**: `merged_solar_eclipses.txt`

### Format

The output file is a tab-separated text file with the following columns:

| Column | Name | Description |
|--------|------|-------------|
| 1 | Year | Calendar year (negative for BCE) |
| 2 | Month | Month (1-12) |
| 3 | Day | Day of month (1-31) |
| 4 | Hour | Hour of maximum eclipse (0-23, UT) |
| 5 | Minute | Minute of maximum eclipse (0-59) |
| 6 | Second | Second of maximum eclipse (0-59) |
| 7 | Catalog | Eclipse catalog number |
| 8 | Saros | Saros series number |
| 9 | Type | Eclipse type (P=Partial, T=Total, A=Annular, H=Hybrid) |
| 10 | Gamma | Gamma value (distance of shadow axis from Earth's center) |

### Example

```
Year	Month	Day	Hour	Minute	Second	Catalog	Saros	Type	Gamma
1999	2	16	06	34	37	-11	140	A	-0.4728
1999	8	11	11	04	08	-5	145	T	0.5061
```

## Eclipse Type Distribution

| Type | Count | Percentage |
|------|-------|------------|
| P (Partial) | 25,192 | 35.36% |
| A (Annular) | 23,336 | 32.75% |
| T (Total) | 19,017 | 26.69% |
| H (Hybrid) | 3,153 | 4.43% |

## Original .prn Format

The original .prn files use a 3-line format for each eclipse:
1. **Line 1**: Besselian elements (first set) - numerical data for shadow calculations
2. **Line 2**: Main eclipse data - year, month, day, type code, gamma, Julian Day, catalog, Saros, etc.
3. **Line 3**: Besselian elements (second set) - additional numerical data

### Type Code Mapping

The type codes in the .prn files are mapped as follows:
- 1 → P (Partial)
- 2 → T (Total)
- 3 → A (Annular)
- 4 → H (Hybrid)

## Conversion Process

The conversion script (`merge_and_convert_eclipses.py`) performs the following steps:

1. **Discover files**: Find all ec*.prn files in the current directory
2. **Sort chronologically**: Order files from BCE to CE based on filename patterns
3. **Parse data**: Extract the main eclipse line from each 3-line entry
4. **Convert time**: Calculate hours, minutes, seconds from Julian Day numbers
   - Accounts for JD starting at noon (not midnight)
   - Handles negative JD values for BCE dates correctly
5. **Map types**: Convert numeric type codes to letter codes
6. **Merge and sort**: Combine all eclipses and ensure chronological order
7. **Write output**: Generate tab-separated file with column headers

## Time Calculation

Julian Day (JD) numbers start at noon (12:00 UT), not midnight. The conversion accounts for this:
- JD integer part = date
- JD fractional part 0.0 = previous day at noon
- JD fractional part 0.5 = current day at midnight
- JD fractional part 1.0 = current day at noon

For example:
- JD 2451401.96121 = 1999-08-11 at 11:04:08 UT

## Verification

The converted data has been verified against the existing `SolarEclipses.txt` file:
- Times match within 1 second (rounding differences)
- Eclipse types match
- Gamma values match
- Saros series match

Sample verification (1999 eclipses):
```
Converted: 1999-02-16 06:34:37, Type A, Gamma -0.4728
Original:  1999-02-16 06:34:38, Type A, Gamma -0.4726

Converted: 1999-08-11 11:04:08, Type T, Gamma 0.5061
Original:  1999-08-11 11:04:09, Type T, Gamma 0.5062
```

## Data Limitations

The converted file includes only the data that can be reliably extracted from the .prn main eclipse line:
- Date and time
- Eclipse type
- Gamma value
- Catalog and Saros numbers

The following data from `SolarEclipses.txt` are **not included** because they require complex Besselian element calculations:
- Geographic coordinates (latitude/longitude) with N/S/E/W indicators
- Eclipse magnitudes
- Path width
- Duration of totality/annularity

This simplified format focuses on the essential eclipse identification and timing data that can be directly extracted from the .prn files.

## Source Attribution

Original data source: Shonobu Takesako (http://www.kotenmon.com/cal/emapwin_eng.htm)
Based on: JPL (Jet Propulsion Laboratory) data

## Usage

To regenerate the merged file:
```bash
python3 merge_and_convert_eclipses.py
```

This will create/overwrite `merged_solar_eclipses.txt` with data from all ec*.prn files in the current directory.
