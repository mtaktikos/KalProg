# Time Functions in Calendrica4.m

This document describes the new time manipulation functions added to Calendrica4.m.

## Functions

### TimePlus[list, s]

Adds `s` seconds to a Gregorian time list and returns the new time.

**Parameters:**
- `list`: A list of 6 parameters `{year, month, day, hour, minute, second}` representing a Gregorian date and time
- `s`: Number of seconds to add (can be negative for subtraction)

**Returns:**
- A list of 6 parameters `{year, month, day, hour, minute, second}` representing the new date and time

**Examples:**

```mathematica
(* Add 1 hour (3600 seconds) to a time *)
TimePlus[{2024, 1, 15, 10, 30, 45}, 3600]
(* Returns: {2024, 1, 15, 11, 30, 45} *)

(* Add 1 day (86400 seconds) *)
TimePlus[{2024, 1, 15, 10, 30, 45}, 86400]
(* Returns: {2024, 1, 16, 10, 30, 45} *)

(* Subtract 1 hour (negative seconds) *)
TimePlus[{2024, 1, 15, 10, 30, 45}, -3600]
(* Returns: {2024, 1, 15, 9, 30, 45} *)

(* Time that crosses midnight *)
TimePlus[{2024, 1, 15, 23, 30, 45}, 3600]
(* Returns: {2024, 1, 16, 0, 30, 45} *)

(* Time that crosses month boundary *)
TimePlus[{2024, 1, 31, 12, 0, 0}, 86400]
(* Returns: {2024, 2, 1, 12, 0, 0} *)
```

### TimeDistance[list1, list2]

Calculates the distance in seconds between two Gregorian time lists.

**Parameters:**
- `list1`: A list of 6 parameters `{year, month, day, hour, minute, second}` representing the first date and time
- `list2`: A list of 6 parameters `{year, month, day, hour, minute, second}` representing the second date and time

**Returns:**
- The number of seconds from `list1` to `list2` (positive if `list2` is later, negative if earlier)

**Examples:**

```mathematica
(* Same time - returns 0 *)
TimeDistance[{2024, 1, 15, 10, 30, 45}, {2024, 1, 15, 10, 30, 45}]
(* Returns: 0 *)

(* 1 hour difference *)
TimeDistance[{2024, 1, 15, 10, 30, 45}, {2024, 1, 15, 11, 30, 45}]
(* Returns: 3600 *)

(* 1 day difference *)
TimeDistance[{2024, 1, 15, 10, 30, 45}, {2024, 1, 16, 10, 30, 45}]
(* Returns: 86400 *)

(* Backwards in time (negative result) *)
TimeDistance[{2024, 1, 15, 11, 30, 45}, {2024, 1, 15, 10, 30, 45}]
(* Returns: -3600 *)

(* Across month boundary *)
TimeDistance[{2024, 1, 31, 12, 0, 0}, {2024, 2, 1, 12, 0, 0}]
(* Returns: 86400 *)
```

## Relationship to Existing Functions

These functions are similar to the existing day-based functions:

- **DaysPlusC[date, number]**: Adds a number of days to a calendar date
- **DateDistanceC[date1, date2]**: Returns the number of days between two dates

The new time functions extend this functionality to work with full date-time information (including hours, minutes, and seconds) rather than just dates.

## Implementation Details

- Both functions work with Gregorian calendar dates internally
- Time calculations properly handle:
  - Day boundaries (midnight crossings)
  - Month boundaries
  - Year boundaries (including leap years)
  - Negative time offsets
- The implementation uses the existing `ToFixed` and `Gregorian` functions for accurate date arithmetic

## Location in Code

These functions are defined in `Calendrica4.m` directly after the `DaysPlusC` function definition (around line 2133).
