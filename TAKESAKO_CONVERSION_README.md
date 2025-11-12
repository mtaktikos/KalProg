# Takesako Lunar Eclipse Data Conversion

## Overview

This document describes the conversion of Shinobu Takesako's lunar eclipse data files (mc*.prn) from http://www.kotenmon.com/cal/lmapwin_eng.htm to a format similar to LunarEclipses.txt.

## Source Files

The Takesako data is contained in 7 files:

### BCE (Before Common Era) Files - mcm*.prn:
- `mcm13000m08000.prn`: Years -13000 to -8000 (12,135 eclipses)
- `mcm07999m03000.prn`: Years -7999 to -3000 (12,141 eclipses)
- `mcm02999m00000.prn`: Years -2999 to 0 (7,270 eclipses)

### CE (Common Era) Files - mcp*.prn:
- `mcp00001p03000.prn`: Years 1 to 3000 (7,312 eclipses)
- `mcp03001p08000.prn`: Years 3001 to 8000 (12,119 eclipses)
- `mcp08001p13000.prn`: Years 8001 to 13000 (12,155 eclipses)
- `mcp13001p16999.prn`: Years 13001 to 16999 (9,705 eclipses)

**Total: 72,837 lunar eclipses spanning 30,000 years (-13000 to +16999)**

## Input Format (Takesako .prn files)

Each lunar eclipse in the source files is represented by **3 consecutive lines**:

### Line 1: Main eclipse data
```
 YYYY MM DD Type Param1 Param2 Param3 JulianDay DT1 DT2 Hour
```
- `YYYY`: Year (negative for BCE)
- `MM`: Month (1-12)
- `DD`: Day (1-31)
- `Type`: Eclipse type code (1=Total, 2=Partial, 3=Penumbral)
- `Param1-3`: Numerical parameters (gamma, magnitude, etc.)
- `JulianDay`: Julian Day Number (with fractional part)
- `DT1, DT2`: Delta-T related values
- `Hour`: Hour of maximum eclipse (approximate)

### Line 2: Additional numerical data
Contains orbital and geometric parameters.

### Line 3: Coordinate data
```
... ... ... ... ... ... Value1 Value2 Latitude Value3
```
- Second-to-last value: **Latitude** in decimal degrees (accurate)
- Fourth-from-last value: Longitude-related value (requires conversion)

## Output Format (takesako_lunar_eclipses.txt)

The converted file uses a tab-separated format with the following columns:

```
Year	Month	Day	Hour	Minute	Second	Catalog	EclipseType	Magnitude1	Magnitude2	Latitude	Longitude
```

### Column Descriptions:

1. **Year**: Integer year (negative for BCE, e.g., -2999)
2. **Month**: Month number (1-12)
3. **Day**: Day of month (1-31)
4. **Hour**: Hour of maximum eclipse (0-23)
5. **Minute**: Minute of maximum eclipse (0-59)
6. **Second**: Second of maximum eclipse (0-59)
7. **Catalog**: Catalog number (set to 0 in this conversion)
8. **EclipseType**: 
   - `T` = Total eclipse
   - `P` = Partial eclipse
   - `Pen` = Penumbral eclipse
9. **Magnitude1**: Penumbral magnitude (not available, marked as `—`)
10. **Magnitude2**: Umbral magnitude (not available, marked as `—`)
11. **Latitude**: Geographic latitude of maximum eclipse (e.g., `12N`, `14S`)
12. **Longitude**: Geographic longitude of maximum eclipse (e.g., `146W`, `30E`)

## Conversion Details

### Accurate Conversions:
- ✓ **Date** (Year, Month, Day): Directly from Line 1, fields 1-3
- ✓ **Eclipse Type**: Mapped from Line 1, field 4 (1→T, 2→P, 3→Pen)
- ✓ **Latitude**: From Line 3, second-to-last column, converted to degrees with N/S indicator

### Approximate Conversions:
- ⚠ **Time** (Hour, Minute, Second): Calculated from Julian Day
  - May differ from actual by ~10-15 minutes due to ΔT (Delta-T) corrections
  - Julian Day represents Terrestrial Time (TT) while typical eclipse times use Universal Time (UT)
  
- ⚠ **Longitude**: Extracted from Line 3, fourth-from-last column
  - The exact coordinate system used in Takesako's files is not documented
  - Direct conversion from 0-360° range to -180°/+180° (E/W) is used
  - May be approximate; appears to represent subsolar or similar reference point

### Not Available:
- ✗ **Catalog Number**: Original Takesako files don't include NASA catalog numbers
- ✗ **Magnitudes**: Penumbral and umbral magnitudes not directly extractable from available data

## Statistics

- **Total eclipses**: 72,837
- **Date range**: Year -13000 to +16999 (30,000 years)
- **Eclipse type distribution**:
  - Total (T): 21,212 (29.1%)
  - Partial (P): 25,001 (34.3%)
  - Penumbral (Pen): 26,624 (36.5%)

## Usage

### Running the Conversion Script:

```bash
python3 merge_takesako_lunar_eclipses.py
```

This will:
1. Read all 7 mc*.prn files
2. Process each 3-line eclipse record
3. Merge in chronological order
4. Output to `takesako_lunar_eclipses.txt`

### Output File:

The output file contains:
- 1 header line with column names
- 72,837 data lines (one per eclipse)
- Tab-separated values
- Chronologically ordered from -13000 to +16999

## Limitations and Notes

1. **Time Accuracy**: Times are approximate due to:
   - ΔT (Delta-T) corrections between TT and UT
   - Possible rounding in the source data
   - Typical accuracy: ±10-15 minutes

2. **Longitude Accuracy**: Longitude values are approximate:
   - The exact coordinate system in Takesako's files is undocumented
   - Values may represent subsolar point, hour angle, or other astronomical reference
   - Recommend verifying critical eclipses against other sources

3. **Magnitude Values**: The source format does not clearly provide:
   - Penumbral magnitude
   - Umbral magnitude
   - These are marked as `—` in the output

4. **Catalog Numbers**: Set to 0 as the Takesako format doesn't include NASA catalog numbers

## Comparison with LunarEclipses.txt

The existing `LunarEclipses.txt` file covers years -3999 to +3000 (16,872 eclipses) from NASA data.

The converted Takesako data (`takesako_lunar_eclipses.txt`) covers:
- **Extended range**: -13000 to +16999 (30,000 years vs 7,000 years)
- **More eclipses**: 72,837 vs 16,872
- **Trade-offs**: Less precise times and longitudes, no magnitude data

## References

- Source: Shinobu Takesako's Lunar Eclipse Data
- Website: http://www.kotenmon.com/cal/lmapwin_eng.htm
- Based on: JPL (Jet Propulsion Laboratory) data
- Conversion script: `merge_takesako_lunar_eclipses.py`

## Version History

- Initial conversion: 2025
- Format documentation: Complete
- Known limitations: Documented above

---

For questions or corrections regarding this conversion, please refer to the original Takesako website or NASA eclipse data sources for verification of critical eclipse parameters.
