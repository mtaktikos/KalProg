# Python Implementation of MATLAB Calendar and Astronomy Functions

This document describes the Python implementations of the MATLAB files in this repository.

## Overview

Three main MATLAB files have been converted to Python:

1. **finsternisse.py** - Eclipse data and query functions
2. **Calendrica4.py** - Calendar calculation and conversion functions
3. **PlanetariumOpen.py** - Astronomy and planetarium functions

## File Descriptions

### finsternisse.py

Converted from `finsternisse.m` (144,167 lines of MATLAB code)

**Purpose**: Eclipse catalog and query functions for solar and lunar eclipses.

**Key Features**:
- Eclipse data structures for solar eclipses (seC) and lunar eclipses (leC)
- Query functions for finding eclipses by year
- Support for both positive and negative years
- Functions to filter by eclipse type (Total, Partial, Annular, etc.)

**Main Functions**:
- `AllSolE(year)` - Get all solar eclipses in a year
- `TotalSolE(year)` - Get total solar eclipses in a year
- `AllLunE(year)` - Get all lunar eclipses in a year
- `TotalLunE(year)` - Get total lunar eclipses in a year
- `SonnenfinsternisAlternate(year)` - Solar eclipses with year adjustment
- `TotaleSonnenfinsternisAlternate(year)` - Total solar eclipses with year adjustment
- `MondfinsternisAlternate(year)` - Lunar eclipses with year adjustment
- `TotaleMondfinsternisAlternate(year)` - Total lunar eclipses with year adjustment

**Data Format**:
Each eclipse entry is a list: `[year, month, day, hour, minute, second, type, ...]`
- Types: "T"=Total, "P"=Partial, "A"=Annular, "H"=Hybrid, "Pen"=Penumbral

**Note**: The full eclipse data catalog (144,000+ entries) would need to be populated from the original MATLAB file for complete functionality.

### Calendrica4.py

Converted from `Calendrica4.m` (8,558 lines of MATLAB code)

**Purpose**: Calendar conversion and calculation functions based on "Calendrical Calculations" by Dershowitz and Reingold.

**Key Features**:
- Calendar arithmetic and modulo functions
- Time and moment conversions
- Julian Day (JD) and Modified Julian Day (MJD) calculations
- Date range and filtering utilities
- Week day calculations

**Main Functions**:

*Utility Functions*:
- `adjusted_mod(x, y)` - Modulo returning values 1..y instead of 0..y-1
- `m_next(initial, condition)` - Find first value where condition holds
- `m_final(initial, condition)` - Find last value where condition holds
- `binary_search(lo, hi, test, end)` - Binary search with custom test function
- `poly_c4(x, coefficients)` - Polynomial evaluation

*Time and Moment Functions*:
- `moment_from_unix(seconds)` - Convert Unix timestamp to moment
- `unix_from_moment(t)` - Convert moment to Unix timestamp
- `fixed_from_moment(t)` - Extract integer date from moment
- `time_from_moment(t)` - Extract fractional time from moment
- `time_from_clock(h, m, s)` - Convert clock time to fraction of day
- `clock_from_moment(t)` - Convert moment to (hour, minute, second)
- `angle_from_degrees(alpha)` - Convert decimal degrees to DMS

*Julian Day Functions*:
- `moment_from_jd(jd)` - Convert Julian Day to moment
- `jd_from_moment(tee)` - Convert moment to Julian Day
- `fixed_from_jd(jd)` - Convert Julian Day to fixed date
- `jd_from_fixed(date)` - Convert fixed date to Julian Day

*Modified Julian Day Functions*:
- `fixed_from_mjd(mjd)` - Convert MJD to fixed date
- `mjd_from_fixed(date)` - Convert fixed date to MJD

*Date Utilities*:
- `day_of_week_c_from_fixed(date)` - Get day of week (0=Sunday)
- `in_range_q(tee, range)` - Check if value is in range
- `list_range(ell, range)` - Filter list by range
- `current_date_c()` - Get current fixed date
- `current_moment()` - Get current moment

**Constants**:
- `SUNDAY` through `SATURDAY` (0-6)
- `GREGORIAN_EPOCH`, `JULIAN_EPOCH`, `UNIX_EPOCH`
- `JD_EPOCH`, `MJD_EPOCH`

### PlanetariumOpen.py

Converted from `PlanetariumOpen.m` (6,368 lines of MATLAB code)

**Purpose**: Astronomical calculations for planetary positions, coordinates, and ephemeris.

**Key Features**:
- Geographic location management
- Coordinate system conversions (equatorial, horizon, ecliptic)
- Planetary data and orbital parameters
- Solar and lunar position calculations
- Modified Julian Day calculations
- Rise/set time calculations (framework)

**Main Functions**:

*Location Functions*:
- `set_location(longitude, latitude, altitude, timezone)` - Set observation location
- `get_location()` - Get current location settings

*Coordinate Functions*:
- `equator_coordinates(obj, date, viewpoint, epoch)` - Equatorial coordinates
- `horizon_coordinates(obj, date)` - Horizon coordinates (azimuth/altitude)
- `ecliptic_coordinates(obj, date)` - Ecliptic coordinates

*Time Functions*:
- `modified_julian_day(date)` - Calculate MJD for a date
- `solar_longitude(date)` - Sun's ecliptic longitude
- `lunar_longitude(date)` - Moon's ecliptic longitude
- `earth_tilt(date)` - Obliquity of the ecliptic

*Ephemeris Functions*:
- `ephemeris(obj, date, viewpoint)` - Calculate ephemeris data
- `sunrise(date, location)` - Calculate sunrise time
- `sunset(date, location)` - Calculate sunset time
- `moonrise(date, location)` - Calculate moonrise time
- `moonset(date, location)` - Calculate moonset time
- `new_moon(near_date)` - Find nearest new moon
- `full_moon(near_date)` - Find nearest full moon

**Classes**:
- `Location` - Geographic location with lat/lon/altitude/timezone
- `Planet` - Planetary object with orbital parameters

**Planetary Objects**:
- `Sun`, `Mercury`, `Venus`, `Earth`, `Mars`, `Jupiter`, `Saturn`, `Uranus`, `Neptune`, `Pluto`, `Moon`

**Constants**:
- `DEGREE` = π/180 (degrees to radians)
- `HOUR` = π/12 (hours to radians)
- `AU` = 149,597,900 km (Astronomical Unit)

## Usage Examples

### Eclipse Queries

```python
import finsternisse

# Get all solar eclipses in year 2024
eclipses = finsternisse.AllSolE(2024)

# Get only total solar eclipses in 2024
total_eclipses = finsternisse.TotalSolE(2024)

# Get all lunar eclipses in 2024
lunar_eclipses = finsternisse.AllLunE(2024)
```

### Calendar Calculations

```python
import Calendrica4

# Convert between time representations
frac_day = Calendrica4.time_from_clock(15, 30, 0)  # 3:30 PM
hour, min, sec = Calendrica4.clock_from_moment(100.5)

# Julian Day conversions
jd = Calendrica4.jd_from_fixed(0)
fixed = Calendrica4.fixed_from_jd(jd)

# Modified Julian Day
mjd = Calendrica4.mjd_from_fixed(738000)
fixed = Calendrica4.fixed_from_mjd(mjd)

# Day of week
dow = Calendrica4.day_of_week_c_from_fixed(738000)  # 0=Sunday
```

### Astronomical Calculations

```python
import PlanetariumOpen

# Set observation location (Melbourne, Australia)
PlanetariumOpen.set_location(
    longitude=145.0,
    latitude=-37.8,
    altitude=0.0,
    timezone=11
)

# Calculate Modified Julian Day
mjd = PlanetariumOpen.modified_julian_day((2024, 1, 1, 12, 0, 0))

# Get Sun's position
sol_lon = PlanetariumOpen.solar_longitude((2024, 1, 1))

# Get Moon's position
lunar_lon = PlanetariumOpen.lunar_longitude((2024, 1, 1))

# Get coordinates
coords = PlanetariumOpen.equator_coordinates("Mars", (2024, 1, 1))

# Access planetary data
print(f"Earth's radius: {PlanetariumOpen.Earth.radius} km")
print(f"Jupiter's orbital period: {PlanetariumOpen.Jupiter.orbital_period} years")
```

## Testing

Run the test suite to verify the implementations:

```bash
python3 test_python_implementations.py
```

The test suite validates:
- Core calendar arithmetic functions
- Time and moment conversions
- Julian Day calculations
- Eclipse query functions
- Astronomical coordinate calculations
- Location management
- Planetary data access

## Implementation Status

### Fully Implemented
- ✅ Basic calendar arithmetic (adjusted_mod, m_next, m_final, etc.)
- ✅ Time and moment conversions
- ✅ Julian Day and Modified Julian Day conversions
- ✅ Eclipse query functions (interface and sample data)
- ✅ Location management for astronomical observations
- ✅ Basic astronomical calculations (solar/lunar longitude, MJD)
- ✅ Planetary object definitions and data
- ✅ Coordinate system function interfaces

### Partial Implementation
- 🔶 Eclipse data catalogs (sample data only, full catalogs need to be added)
- 🔶 Calendar system conversions (framework in place, need full implementations)
- 🔶 Rise/set time calculations (interface defined, algorithms need completion)
- 🔶 Ephemeris calculations (framework in place, need detailed implementations)

### Not Yet Implemented
- ⏳ Complete Gregorian/Julian calendar conversions
- ⏳ Hebrew, Islamic, Persian, Chinese calendar systems
- ⏳ Detailed planetary position calculations
- ⏳ Star catalog and constellation data
- ⏳ Eclipse circumstances calculations
- ⏳ Precession and nutation corrections

## Differences from MATLAB Implementation

1. **Data Structures**: Python lists and dictionaries replace MATLAB cell arrays and structures
2. **Indexing**: Python uses 0-based indexing vs MATLAB's 1-based
3. **Functions**: Python functions vs MATLAB modules
4. **Object Model**: Python classes for Planet and Location vs MATLAB structures
5. **Module System**: Python imports vs MATLAB packages

## Future Enhancements

To achieve full parity with the MATLAB implementation, the following would need to be added:

1. **Complete Eclipse Data**: Load all 144,000+ eclipse entries from the original MATLAB file
2. **Calendar Systems**: Implement full conversion algorithms for all calendar systems
3. **Astronomical Algorithms**: Add complete VSOP87/ELP2000 planetary and lunar theories
4. **Star Catalogs**: Add star position data for planetarium features
5. **Rise/Set Calculations**: Complete iterative algorithms for rise/set times
6. **Eclipse Circumstances**: Add detailed eclipse path and timing calculations

## Dependencies

The Python implementations use only standard library modules:
- `math` - Mathematical functions
- `datetime` - Date and time operations (minimal use)

No external dependencies are required for the core functionality.

## Performance Considerations

- Python is generally slower than compiled MATLAB code
- For performance-critical applications, consider:
  - Using NumPy for array operations
  - Caching frequently-used calculations
  - Profiling and optimizing hot paths
  - Consider Cython or numba for acceleration

## References

1. Dershowitz, N. and Reingold, E.M. "Calendrical Calculations", Cambridge University Press
2. Meeus, J. "Astronomical Algorithms", Willmann-Bell
3. Original MATLAB implementation by M.T.

## License

These Python implementations maintain compatibility with the original MATLAB code licensing terms. Please refer to the license headers in the original MATLAB files.
