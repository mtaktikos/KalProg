# LunarEclipses.txt Processing Summary

## Changes Made

The `LunarEclipses.txt` file has been cleaned and restructured according to the following requirements:

### 1. Empty Lines and Header Lines Removed ✓
- **Before**: 22,399 total lines
- **After**: 16,872 data lines
- All empty lines and lines without date/time information have been removed

### 2. Old Format (Before Year -1999) ✓
**Original format:**
```
-2000-Jan-12	01:49:00	45834	T	0.2645	2.3729	1.3723	329.7	209.8	82.7	24N	166E
```

**New format:**
```
-2000	1	12	01	49	00	45834	T	209.8	82.7	24N	166E
```

Changes:
- Date column split into 3 separate columns: `year`, `month number`, `day`
- Month name (e.g., "Jan") converted to month number (e.g., "1")
- Time column split into 3 separate columns: `hour`, `minute`, `second`
- DT column preserved
- Eclipse type preserved
- Middle columns between eclipse type and last 4 columns removed
- Last 4 columns preserved

### 3. New Format (After Year -2000) ✓
**Original format:**
```
00001  -1999 Jun 26  14:13:28  46437 -49456  017   N   t-  -1.0981  0.8791 -0.1922  268.8    -      -     24S   22W
```

**New format:**
```
-1999	6	26	14	13	28	46437	N	-	-	24S	22W
```

Changes:
- First obsolete column (Cat Num) removed
- Month name (e.g., "Jun") converted to month number (e.g., "6")
- Time column split into 3 separate columns: `hour`, `minute`, `second`
- DT column preserved
- Two obsolete columns after DT (Luna Num and Saros Num) removed
- Eclipse type preserved
- Columns between eclipse type and last 4 columns (QSE, Gamma, magnitudes, intermediate durations) removed
- Last 4 columns preserved

### 4. Consistent Column Structure ✓
All entries now follow a consistent tab-separated format with 12 columns:
- Column 1: Year (e.g., `-3999`, `-1999`, `2000`)
- Column 2: Month number (1-12)
- Column 3: Day (1-31)
- Column 4: Hour (00-23)
- Column 5: Minute (00-59)
- Column 6: Second (00-59)
- Column 7: DT (Delta T in seconds)
- Column 8: Eclipse Type (e.g., Pen, P, T, N, T+, T-)
- Columns 9-12: Last 4 data columns (durations and zenith coordinates)

## Processing Script

The Python script `process_lunar_eclipses.py` was created to automate these transformations. The script:
- Detects the format of each line automatically (old vs new format)
- Converts month names to numbers using a mapping
- Splits date and time columns appropriately
- Removes empty lines and header lines
- Removes obsolete columns based on the format
- Maintains consistent column structure with last 4 columns preserved

## Verification

All requirements have been verified:
- ✓ No empty lines or header lines remain
- ✓ Old format dates are split into 3 columns with numeric months
- ✓ New format has obsolete columns removed and numeric months
- ✓ All time values are split into hour, minute, second columns
- ✓ DT column preserved in all entries
- ✓ Eclipse type preserved in all entries
- ✓ Middle columns between eclipse type and last 4 columns removed
- ✓ Last 4 columns preserved in all entries
- ✓ All 16,872 lines have exactly 12 columns

## Statistics

- **Total data lines processed**: 16,872
  - Old format lines (before -1999): 4,808
  - New format lines (after -2000): 12,064
- **Lines removed**: 5,527 (empty lines and headers)
- **File size reduction**: From 1.8M to 720K (60% reduction)
