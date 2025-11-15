#!/usr/bin/env python3
"""
Verification script to test the TakesakoSolarEclipses function logic.

This script simulates what the Mathematica function should do:
1. Convert Mathematica year to Takesako year format
2. Read the Takesako_solar_eclipses.txt file
3. Filter eclipses by year
4. Return the eclipses in the expected format
"""

def convert_year_to_takesako(mathematica_year):
    """
    Convert Mathematica year to Takesako year format.
    
    Takesako uses astronomical year numbering with year 0:
    - Takesako year -13000 = 13001 BCE
    - Mathematica year -13001 = 13001 BCE
    
    Conversion: For years <= 0, Takesako_year = Mathematica_year + 1
    """
    if mathematica_year <= 0:
        return mathematica_year + 1
    else:
        return mathematica_year


def get_takesako_solar_eclipses(mathematica_year, filename='Takesako_solar_eclipses.txt'):
    """
    Read and filter solar eclipses for a given year from Takesako data.
    
    Args:
        mathematica_year: Year in Mathematica astronomical year numbering
        filename: Path to Takesako_solar_eclipses.txt
    
    Returns:
        list: List of eclipse data dictionaries
    """
    takesako_year = convert_year_to_takesako(mathematica_year)
    
    eclipses = []
    
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            # Skip header line
            next(f)
            
            for line in f:
                parts = line.strip().split('\t')
                if len(parts) >= 10:
                    year = int(parts[0])
                    
                    if year == takesako_year:
                        eclipse = {
                            'year': year,
                            'month': int(parts[1]),
                            'day': int(parts[2]),
                            'hour': int(parts[3]),
                            'minute': int(parts[4]),
                            'second': int(parts[5]),
                            'catalog': int(parts[6]),
                            'saros': int(parts[7]),
                            'type': parts[8],
                            'gamma': float(parts[9])
                        }
                        eclipses.append(eclipse)
        
        return eclipses
    
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found")
        return []
    except Exception as e:
        print(f"Error reading file: {e}")
        return []


def format_eclipse(eclipse):
    """Format an eclipse dictionary for display."""
    return (f"{eclipse['year']:6d}-{eclipse['month']:02d}-{eclipse['day']:02d} "
            f"{eclipse['hour']:02d}:{eclipse['minute']:02d}:{eclipse['second']:02d} "
            f"Type: {eclipse['type']} "
            f"Catalog: {eclipse['catalog']:7d} "
            f"Saros: {eclipse['saros']:4d} "
            f"Gamma: {eclipse['gamma']:7.4f}")


def main():
    """Main test function."""
    print("=" * 80)
    print("Verification of TakesakoSolarEclipses Function Logic")
    print("=" * 80)
    print()
    
    # Test 1: Year -13001 (13001 BCE)
    print("Test 1: Year -13001 (13001 BCE in astronomical year numbering)")
    mathematica_year = -13001
    takesako_year = convert_year_to_takesako(mathematica_year)
    print(f"  Mathematica year: {mathematica_year}")
    print(f"  Takesako year:    {takesako_year}")
    print()
    
    eclipses = get_takesako_solar_eclipses(mathematica_year)
    print(f"  Found {len(eclipses)} eclipses:")
    for i, eclipse in enumerate(eclipses, 1):
        print(f"    {i}. {format_eclipse(eclipse)}")
    print()
    
    if len(eclipses) == 2:
        print("  ✓ SUCCESS: Found expected 2 eclipses")
        if eclipses[0]['month'] == 4 and eclipses[0]['day'] == 23:
            print("  ✓ SUCCESS: First eclipse on April 23")
        if eclipses[1]['month'] == 10 and eclipses[1]['day'] == 18:
            print("  ✓ SUCCESS: Second eclipse on October 18")
    else:
        print(f"  ✗ FAILURE: Expected 2 eclipses, found {len(eclipses)}")
    print()
    
    # Test 2: Year 2024 CE
    print("=" * 80)
    print("Test 2: Year 2024 CE")
    mathematica_year = 2024
    takesako_year = convert_year_to_takesako(mathematica_year)
    print(f"  Mathematica year: {mathematica_year}")
    print(f"  Takesako year:    {takesako_year}")
    print()
    
    eclipses = get_takesako_solar_eclipses(mathematica_year)
    print(f"  Found {len(eclipses)} eclipses:")
    for i, eclipse in enumerate(eclipses, 1):
        print(f"    {i}. {format_eclipse(eclipse)}")
    print()
    
    if len(eclipses) == 2:
        print("  ✓ SUCCESS: Found expected 2 eclipses")
        if eclipses[0]['month'] == 4 and eclipses[0]['day'] == 8:
            print("  ✓ SUCCESS: First eclipse on April 8")
        if eclipses[1]['month'] == 10 and eclipses[1]['day'] == 2:
            print("  ✓ SUCCESS: Second eclipse on October 2")
    else:
        print(f"  ✗ FAILURE: Expected 2 eclipses, found {len(eclipses)}")
    print()
    
    # Test 3: Year 1500 CE (should have some eclipses)
    print("=" * 80)
    print("Test 3: Year 1500 CE (Julian calendar year)")
    mathematica_year = 1500
    takesako_year = convert_year_to_takesako(mathematica_year)
    print(f"  Mathematica year: {mathematica_year}")
    print(f"  Takesako year:    {takesako_year}")
    print()
    
    eclipses = get_takesako_solar_eclipses(mathematica_year)
    print(f"  Found {len(eclipses)} eclipses:")
    for i, eclipse in enumerate(eclipses, 1):
        print(f"    {i}. {format_eclipse(eclipse)}")
    print()
    
    print("=" * 80)
    print("All tests completed!")
    print("=" * 80)


if __name__ == '__main__':
    main()
