#!/usr/bin/env python3
"""
Python implementation of Calendrica4.m
Calendar calculation functions based on "Calendrical Calculations" by
Dershowitz and Reingold.

This file is converted from the MATLAB file Calendrica4.m
"""

import math
from datetime import datetime, timedelta


# Week day constants
SUNDAY = 0
MONDAY = 1
TUESDAY = 2
WEDNESDAY = 3
THURSDAY = 4
FRIDAY = 5
SATURDAY = 6

# Calendar-specific constants
GREGORIAN_EPOCH = 1  # Fixed date of January 1, 1 CE in Gregorian calendar
JULIAN_EPOCH = 1     # Fixed date of January 1, 1 CE in Julian calendar
UNIX_EPOCH = 719163  # Unix epoch (Jan 1, 1970) as fixed date from Gregorian epoch


def adjusted_mod(x, y):
    """
    Adjusted modulo that returns values in range 1..y instead of 0..y-1.
    
    Args:
        x: Value to take modulo of
        y: Modulo value
        
    Returns:
        Result in range 1..y
    """
    result = x % y
    return result if result != 0 else y


def m_next(initial, condition):
    """
    Return the first integer >= initial such that condition holds.
    
    Args:
        initial: Starting value
        condition: Function that returns True when condition is met
        
    Returns:
        First value where condition is True
    """
    i = initial
    while not condition(i):
        i += 1
    return i


def m_final(initial, condition):
    """
    Return the last integer >= initial such that condition holds.
    
    Args:
        initial: Starting value
        condition: Function that returns True when condition is met
        
    Returns:
        Last value where condition is True
    """
    i = initial
    while condition(i + 1):
        i += 1
    return i


def m_sum(expression, initial, condition):
    """
    Return sum of expression for index starting at initial while condition holds.
    
    Args:
        expression: Function to evaluate for each index
        initial: Starting index
        condition: Function that returns True to continue
        
    Returns:
        Sum of expression values
    """
    total = 0
    i = initial
    while condition(i):
        total += expression(i)
        i += 1
    return total


def binary_search(lo, hi, test, end):
    """
    Binary search in range [lo, hi] where test determines direction.
    
    Args:
        lo: Lower bound
        hi: Upper bound
        test: Function that returns True to go left, False to go right
        end: Function that returns True when done
        
    Returns:
        Result of binary search
    """
    while not end(lo, hi):
        mid = (lo + hi) / 2.0
        if test(mid):
            hi = mid
        else:
            lo = mid
    return (lo + hi) / 2.0


def poly_c4(x, coefficients):
    """
    Evaluate polynomial with given coefficients.
    
    Args:
        x: Value to evaluate at
        coefficients: List of coefficients from order 0 up
        
    Returns:
        Polynomial value
    """
    result = 0
    power = 1
    for coef in coefficients:
        result += coef * power
        power *= x
    return result


# Time and moment functions
def moment_from_unix(seconds):
    """
    Convert Unix timestamp to moment.
    
    Args:
        seconds: Seconds since Unix epoch
        
    Returns:
        Moment value
    """
    return UNIX_EPOCH + seconds / (24 * 3600)


def unix_from_moment(t):
    """
    Convert moment to Unix timestamp.
    
    Args:
        t: Moment value
        
    Returns:
        Seconds since Unix epoch
    """
    return 24 * 3600 * (t - UNIX_EPOCH)


def fixed_from_moment(t):
    """
    Get integer part of moment (the fixed date).
    
    Args:
        t: Moment value
        
    Returns:
        Fixed date (integer part)
    """
    return math.floor(t)


def time_from_moment(t):
    """
    Get fractional part of moment (the time of day).
    
    Args:
        t: Moment value
        
    Returns:
        Time of day as fraction
    """
    return t - math.floor(t)


def time_from_clock(h, m, s):
    """
    Convert clock time to fraction of day.
    
    Args:
        h: Hour (0-23)
        m: Minute (0-59)
        s: Second (0-59)
        
    Returns:
        Fraction of day
    """
    return (h + m / 60.0 + s / 3600.0) / 24.0


def clock_from_moment(t):
    """
    Convert moment to clock time.
    
    Args:
        t: Moment value
        
    Returns:
        Tuple of (hour, minute, second)
    """
    time_frac = time_from_moment(t)
    hours = time_frac * 24
    h = int(hours)
    
    minutes = (hours - h) * 60
    m = int(minutes)
    
    seconds = (minutes - m) * 60
    s = int(seconds)
    
    return (h, m, s)


def angle_from_degrees(alpha):
    """
    Convert decimal degrees to degrees, minutes, seconds.
    
    Args:
        alpha: Decimal degrees
        
    Returns:
        Tuple of (degrees, minutes, seconds)
    """
    d = abs(alpha)
    deg = int(d)
    
    minutes = (d - deg) * 60
    m = int(minutes)
    
    seconds = (minutes - m) * 60
    s = int(seconds)
    
    if alpha < 0:
        deg = -deg
    
    return (deg, m, s)


# Day of week functions
def day_of_week_c_from_fixed(date):
    """
    Return day of week (0=Sunday) from fixed date.
    
    Args:
        date: Fixed date (integer)
        
    Returns:
        Day of week (0-6, 0=Sunday)
    """
    return date % 7


def name_from_number(number, name_list):
    """
    Return the number-th entry in name_list, wrapping around.
    
    Args:
        number: Index (1-based)
        name_list: List of names
        
    Returns:
        Name at that position
    """
    return name_list[adjusted_mod(number, len(name_list)) - 1]


# JD (Julian Day) functions
JD_EPOCH = -1721424.5  # Epoch for Julian Day numbers


def moment_from_jd(jd):
    """
    Convert Julian Day number to moment.
    
    Args:
        jd: Julian Day number
        
    Returns:
        Moment value
    """
    return jd + JD_EPOCH


def jd_from_moment(tee):
    """
    Convert moment to Julian Day number.
    
    Args:
        tee: Moment value
        
    Returns:
        Julian Day number
    """
    return tee - JD_EPOCH


def fixed_from_jd(jd):
    """
    Convert Julian Day number to fixed date.
    
    Args:
        jd: Julian Day number
        
    Returns:
        Fixed date (integer)
    """
    return int(math.floor(moment_from_jd(jd)))


def jd_from_fixed(date):
    """
    Convert fixed date to Julian Day number.
    
    Args:
        date: Fixed date (integer)
        
    Returns:
        Julian Day number
    """
    return jd_from_moment(date)


# Modified Julian Day functions
MJD_EPOCH = 678576  # Modified Julian Day epoch (Nov 17, 1858)


def fixed_from_mjd(mjd):
    """
    Convert Modified Julian Day number to fixed date.
    
    Args:
        mjd: Modified Julian Day number
        
    Returns:
        Fixed date (integer)
    """
    return mjd + MJD_EPOCH


def mjd_from_fixed(date):
    """
    Convert fixed date to Modified Julian Day number.
    
    Args:
        date: Fixed date (integer)
        
    Returns:
        Modified Julian Day number
    """
    return date - MJD_EPOCH


# Date conversion and manipulation
def in_range_q(tee, date_range):
    """
    Check if tee is in the given range.
    
    Args:
        tee: Value to check
        date_range: Tuple of (start, end)
        
    Returns:
        True if tee is in range
    """
    return date_range[0] <= tee <= date_range[1]


def list_range(ell, date_range):
    """
    Return elements of ell that fall in date_range.
    
    Args:
        ell: List of values
        date_range: Tuple of (start, end)
        
    Returns:
        Filtered list
    """
    return [x for x in ell if in_range_q(x, date_range)]


def current_date_c():
    """
    Return current fixed date.
    
    Returns:
        Fixed date of current date
    """
    now = datetime.now()
    # This would need proper Gregorian conversion
    # Placeholder implementation
    epoch = datetime(1, 1, 1)
    delta = now - epoch
    return delta.days + 1


def current_moment():
    """
    Return current moment.
    
    Returns:
        Current moment value
    """
    now = datetime.now()
    epoch = datetime(1, 1, 1)
    delta = now - epoch
    days = delta.days + 1
    seconds = now.hour * 3600 + now.minute * 60 + now.second
    return days + seconds / (24 * 3600.0)


# Additional utility functions for calendar systems
# These are placeholders for the full implementation

def gregorian_year_from_fixed(date):
    """Convert fixed date to Gregorian year (placeholder)."""
    # Full implementation would go here
    pass


def fixed_from_gregorian(year, month, day):
    """Convert Gregorian date to fixed date (placeholder)."""
    # Full implementation would go here
    pass


def julian_year_from_fixed(date):
    """Convert fixed date to Julian year (placeholder)."""
    # Full implementation would go here
    pass


def fixed_from_julian(year, month, day):
    """Convert Julian date to fixed date (placeholder)."""
    # Full implementation would go here
    pass


# Note: This is a partial implementation of Calendrica4.m
# The full implementation would include:
# - Complete Gregorian calendar functions
# - Complete Julian calendar functions
# - Hebrew calendar functions
# - Islamic calendar functions
# - Persian calendar functions
# - Hindu calendar functions
# - Chinese calendar functions
# - And many other calendar systems and astronomical calculations
