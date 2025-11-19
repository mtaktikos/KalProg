#!/usr/bin/env python3
"""
Python implementation of finsternisse.m
Eclipse data and functions for solar and lunar eclipses.

This file is converted from the MATLAB file finsternisse.m
"""

# Solar Eclipse Data (seC)
# Format: {year, month, day, hour, minute, second, type, lat, lon, magnitude}
# Type: A=Annular, T=Total, P=Partial, H=Hybrid
seC = [
    [-13000, 4, 23, 21, 20, 47, "A", "", "", ""],
    [-13000, 10, 18, 23, 12, 40, "T", "", "", ""],
    [-12999, 4, 13, 1, 31, 30, "A", "", "", ""],
    [-12999, 9, 8, 18, 50, 9, "P", "", "", ""],
    [-12999, 10, 8, 10, 21, 18, "P", "", "", ""],
    # ... Additional eclipse data would be added here
    # The full dataset contains 144,167 lines
]

# Lunar Eclipse Data (leC) would be defined similarly
leC = [
    # Lunar eclipse data would go here
]


def AllSolE(x):
    """
    Get all solar eclipses for a given year.
    
    Args:
        x: Year to query
        
    Returns:
        List of all solar eclipses in that year
    """
    erg = []
    for eclipse in seC:
        year = eclipse[0]
        if year > x:
            break
        if year == x:
            erg.append(eclipse)
    return erg


def TotalSolE(x):
    """
    Get all total solar eclipses for a given year.
    
    Args:
        x: Year to query
        
    Returns:
        List of total solar eclipses in that year
    """
    erg = []
    for eclipse in seC:
        year = eclipse[0]
        if year > x:
            break
        if year == x and eclipse[6] == "T":
            erg.append(eclipse)
    return erg


def AllLunE(x):
    """
    Get all lunar eclipses for a given year.
    
    Args:
        x: Year to query
        
    Returns:
        List of all lunar eclipses in that year
    """
    erg = []
    for eclipse in leC:
        year = eclipse[0]
        if year > x:
            break
        if year == x:
            erg.append(eclipse)
    return erg


def TotalLunE(x):
    """
    Get all total lunar eclipses for a given year.
    
    Args:
        x: Year to query
        
    Returns:
        List of total lunar eclipses in that year (where first character is 'T')
    """
    erg = []
    for eclipse in leC:
        year = eclipse[0]
        if year > x:
            break
        if year == x and eclipse[6][0] == "T":
            erg.append(eclipse)
    return erg


def SonnenfinsternisAlternate(year):
    """
    Get solar eclipses for a given year, handling negative years.
    
    Args:
        year: Year to query (positive or negative)
        
    Returns:
        List of solar eclipse data with floored numeric values
    """
    if year > 0:
        basislsg = AllSolE(year)
    else:
        basislsg = AllSolE(year + 1)
    
    # Convert numeric values to integers where appropriate
    result = []
    for eclipse in basislsg:
        row = []
        for val in eclipse:
            if isinstance(val, (int, float)):
                row.append(int(val))
            else:
                row.append(val)
        result.append(row)
    
    return result


def TotaleSonnenfinsternisAlternate(year):
    """
    Get total solar eclipses for a given year, handling negative years.
    
    Args:
        year: Year to query (positive or negative)
        
    Returns:
        List of total solar eclipse data with floored numeric values
    """
    if year > 0:
        basislsg = TotalSolE(year)
    else:
        basislsg = TotalSolE(year + 1)
    
    # Convert numeric values to integers where appropriate
    result = []
    for eclipse in basislsg:
        row = []
        for val in eclipse:
            if isinstance(val, (int, float)):
                row.append(int(val))
            else:
                row.append(val)
        result.append(row)
    
    return result


def MondfinsternisAlternate(year):
    """
    Get lunar eclipses for a given year, handling negative years.
    
    Args:
        year: Year to query (positive or negative)
        
    Returns:
        List of lunar eclipse data with floored numeric values
    """
    if year > 0:
        basislsg = AllLunE(year)
    else:
        basislsg = AllLunE(year + 1)
    
    # Convert numeric values to integers where appropriate
    result = []
    for eclipse in basislsg:
        row = []
        for val in eclipse:
            if isinstance(val, (int, float)):
                row.append(int(val))
            else:
                row.append(val)
        result.append(row)
    
    return result


def TotaleMondfinsternisAlternate(year):
    """
    Get total lunar eclipses for a given year, handling negative years.
    
    Args:
        year: Year to query (positive or negative)
        
    Returns:
        List of total lunar eclipse data with floored numeric values
    """
    if year > 0:
        basislsg = TotalLunE(year)
    else:
        basislsg = TotalLunE(year + 1)
    
    # Convert numeric values to integers where appropriate
    result = []
    for eclipse in basislsg:
        row = []
        for val in eclipse:
            if isinstance(val, (int, float)):
                row.append(int(val))
            else:
                row.append(val)
        result.append(row)
    
    return result


# Note: The complete eclipse data arrays (seC and leC) would need to be 
# populated with all 144,167 lines of data from the original MATLAB file.
# This skeleton provides the structure and main functions.
