# Takesako Eclipse Data Conversion

## Overview

This document describes the conversion of Takesako's ecp*.prn solar eclipse files to the SolarEclipses.txt format (similar to NASA's "Five Millennia of Eclipses" format).

## Source Data

The ecp*.prn files are from Shonobu Takesako's website:
http://www.kotenmon.com/cal/emapwin_eng.htm

These files are based on JPL data and cover eclipses from year 1 to 16999:
- `ecp00001p03000.prn`: Years 1-3000 (7,124 eclipses)
- `ecp03001p08000.prn`: Years 3001-8000 (11,845 eclipses)
- `ecp08001p13000.prn`: Years 8001-13000 (4,763 eclipses)
- `ecp13001p16999.prn`: Years 13001-16999 (not converted - beyond Python datetime range)

## Takesako Format

Each eclipse in the ecp*.prn files consists of 3 lines:
1. First line: Numerical calculation parameters (not used in conversion)
2. **Middle line**: Eclipse data (used for conversion)
3. Third line: Additional numerical parameters (not used in conversion)

### Middle Line Format (Eclipse Data)

```
YYYY MM DD TYPE GAMMA1 GAMMA2 JD DELTAT SAROS NUM
```

Where:
- **YYYY**: Year (1-16999)
- **MM**: Month (1-12)
- **DD**: Day (1-31)
- **TYPE**: Eclipse type code (see mapping below)
- **GAMMA1**: Gamma value (not used, use GAMMA2 instead)
- **GAMMA2**: Gamma value at maximum eclipse
- **JD**: Julian Date at maximum eclipse
- **DELTAT**: Delta T in seconds
- **SAROS**: Saros series number
- **NUM**: Saros member number

### Eclipse Type Mapping

Based on analysis of overlapping eclipses with NASA data:

| Takesako Type | NASA Type | Description | Gamma Range |
|--------------|-----------|-------------|-------------|
| 1 | P | Partial eclipse | Any |
| 2 | T (or H) | Total eclipse (Hybrid if \|gamma\| > 0.75) | \|gamma\| < 1.0 |
| 3 | A (or H) | Annular eclipse (Hybrid if \|gamma\| > 0.75) | \|gamma\| < 1.0 |
| 4 | H | Hybrid eclipse | \|gamma\| < 1.0 |
| 5 | T | Total eclipse at edge | \|gamma\| ≈ 1.0 |
| 6 | A | Annular eclipse at edge | \|gamma\| ≈ 1.0 |

## NASA Format (Target)

Tab-separated format:
```
Year Month Day Hour Minute Second CatalogNum DeltaT Saros Type Gamma Mag Lat Lon PathWidth Duration
```

## Conversion Process

The `convert_takesako_eclipses.py` script performs the following:

1. **Extract date**: Year, Month, Day from the middle line
2. **Calculate time**: Convert Julian Date to Hour, Minute, Second using:
   - Reference: JD 2451545.0 = January 1, 2000, 12:00 TT
   - Formula: `datetime = 2000-01-01 12:00 + (JD - 2451545.0) days`
3. **Map eclipse type**: Convert Takesako type code to NASA type letter
4. **Copy available fields**: DeltaT, Saros, Gamma

### Fields Available in Converted Data

✓ Year, Month, Day
✓ Hour, Minute, Second (calculated from Julian Date)
✓ Delta T
✓ Saros series number
✓ Eclipse type (T, A, P, H)
✓ Gamma value

### Fields Not Available

The following fields from the NASA format are not available in Takesako's format:
- Catalog number
- Eclipse magnitude
- Latitude of maximum eclipse
- Longitude of maximum eclipse
- Path width
- Central duration

These fields are left empty in the converted output.

## Output File

The script generates `SolarEclipses_from_Takesako.txt` with 23,732 eclipses from years 1-13000.

## Verification

Comparison with NASA SolarEclipses.txt for August 11, 1999:

**NASA data:**
```
1999	8	11	11	04	09	64	-5	145	T	0.5062	1.0286	45.1N	24.3E	59	197	112	02m23s
```

**Converted from Takesako:**
```
1999	8	11	11	04	08		-5	145	T	0.50609					
```

The time differs by 1 second (due to rounding in datetime conversion), and empty fields represent data not available in the Takesako format. The key eclipse parameters (date, time, type, gamma, Delta T, Saros) match accurately.

## Usage

```bash
# Convert all ecp*.prn files
python3 convert_takesako_eclipses.py

# Convert specific files
python3 convert_takesako_eclipses.py ecp00001p03000.prn ecp03001p08000.prn
```

## Limitations

1. **Date range**: Years 13001-16999 cannot be processed due to Python datetime limitations
2. **Missing fields**: Magnitude, coordinates, path width, and duration are not available
3. **Time precision**: Times may differ by ~1 second from NASA data due to rounding
4. **Eclipse type**: Hybrid eclipse detection is approximate based on gamma thresholds

## References

- Takesako website: http://www.kotenmon.com/cal/emapwin_eng.htm
- NASA Five Millennium Canon of Solar Eclipses
- JPL Ephemerides
