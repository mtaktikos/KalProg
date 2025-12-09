

Off[Remove::"rmnsm"]
Remove["Chronometry`*"]
Remove["Chronometry`Private`*"]
On[Remove::"rmnsm"] 

SundayC[] = 0;
MondayC[] = 1;
TuesdayC[] = 2;
WednesdayC[] = 3;
ThursdayC[] = 4;
FridayC[] = 5;
SaturdayC[] = 6;

AllSolE[x_] := Module[{erg = {}},
  Do[Which[seC[[1, i, 1]] > x, Break[], seC[[1, i, 1]] == x, 
    erg = Append[erg, seC[[1, i]]]],
   {i, 1, Length[seC[[1]]]}];
  erg]
TotalSolE[x_] := Module[{erg = {}},
  Do[Which[seC[[1, i, 1]] > x, 
    Break[], (seC[[1, i, 1]] == x) && (seC[[1, i, 7]] === "T"), 
    erg = Append[erg, seC[[1, i]]]],
   {i, 1, Length[seC[[1]]]}];
  erg]
AllLunE[x_] := Module[{erg = {}},
  Do[
   Which[leC[[1, i, 1]] > x, Break[], leC[[1, i, 1]] == x, 
    erg = Append[erg, leC[[1, i]]]],
   {i, 1, Length[leC[[1]]]}];
  erg]
TotalLunE[x_] := Module[{erg = {}},
   Do[Which[leC[[1, i, 1]] > x, 
     Break[], (leC[[1, i, 1]] == 
        x)  && (StringPart[leC[[1, i, 7]], 1] === "T"), 
     erg = Append[erg, leC[[1, i]]]],
    {i, 1, Length[leC[[1]]]}];
   erg]
SonnenfinsternisAlternate[year_] := Module[{basislsg},
   If[year > 0, 
    basislsg = Map[Floor, AllSolE[year]] /. Floor[x_String] -> x, 
    basislsg = 
     Map[Floor, AllSolE[year + 1]] /. Floor[x_String] -> x];
   basislsg]
TotaleSonnenfinsternisAlternate[year_] := Module[{basislsg},
   If[year > 0, 
    basislsg = Map[Floor, TotalSolE[year]] /. Floor[x_String] -> x, 
    basislsg = 
     Map[Floor, TotalSolE[year + 1]] /. Floor[x_String] -> x];
   basislsg]
MondfinsternisAlternate[year_] := Module[{basislsg},
   If[year > 0, 
    basislsg = Map[Floor, AllLunE[year]] /. Floor[x_String] -> x, 
    basislsg = 
     Map[Floor, AllLunE[year + 1]] /. Floor[x_String] -> x];
   basislsg]
TotaleMondfinsternisAlternate[year_] := Module[{basislsg},
   If[year > 0, 
    basislsg = Map[Floor, TotalLunE[year]] /. Floor[x_String] -> x, 
    basislsg = 
     Map[Floor, TotalLunE[year + 1]] /. Floor[x_String] -> x];
   basislsg]

BeginPackage["Chronometry`"]

Calendars::usage = "Calendars[] returns the set of all supported calendars."

Begin["`Private`"]

CalendarUsage[calendar_, longDesc_, shortDesc_] :=
	Module[{calName},
		calName = ToString[calendar];
		ToExpression[calName <> "::usage = \"" <> calName <> " represents the " <> longDesc <> " calendar. " <>
		calName <> "[] returns a list of components in " <> shortDesc <> " calendar dates. " <>
		calName <> "[fixedDate] returns the " <> shortDesc <> " calendar date corresponding to the given fixed date.\""];
		ToExpression[calName <> "Q::usage = \"" <> calName <> "Q[date] returns True if $date$ is a valid " <> calName <> " date, False otherwise.\""]
	]

CalendarFields[calendar_, fields_, types_] :=
	Module[{i, field, sfield, scalendar},
		If[Length[Calendars[]] == 0, Calendars[] = {}];
		Calendars[] = Append[Calendars[], calendar];
		calendar[] = fields;
		scalendar = ToString[calendar];
		For[i = 1, i <= Length[fields], ++i,
			field = fields[[i]];
			sfield = ToString[field];
			If[Length[field[]] == 0, field[] = {}];
			field[] = Append[field[], calendar];
			ToExpression[sfield <> "[Chronometry`Private`date_" <> scalendar <> "] ^:= Chronometry`Private`date[[" <> ToString[i] <> "]]"];
			ToExpression[sfield <> "::usage = \"" <> sfield <> "[date] returns the " <> sfield <> " component of the given calendar date. " <>
			sfield <> "[] returns the set of calendars whose dates have a " <> sfield <> " component.\""]
		];
		ToExpression[scalendar <> "Q[date_] := Map[Head, date] === " <> ToString[Apply[calendar, types]]];
	]

End[]


Chronometry::usage = "Chronometry is a package for generalized manipulation and
conversion of dates and times by M. T."

Bogus::usage = "Bogus represents nonexistent dates and times."

ToFixed::usage = "ToFixed[date] returns the fixed (R.D.) date corresponding to the
given calendar $date$."

MeanYear::usage = "MeanYear[calendar] returns how many days has a mean year of the given calendr"

(* ;;;; Section: Basic Code *)

AdjustedMod::usage = "AdjustedMod[x, y] returns Mod[x, y] with results in the range
1..$y$ instead of 0..$y$-1."

MNext::usage = "MNext[inital, condition] returns the first integer greater or equal
to $initial$ such that $condition$ holds."

MFinal::usage = "MFinal[initial, condition] returns the last integer greater or
equal to $initial$ such that $condition$ holds."

MSum::usage = "MSum[expression, initial, condition] returns the sum $expression$
for $index$ = $initial$ and successive integers, as long as $condition$ holds."

BinarySearch::usage = "BinarySearch[lo, hi, test, end] returns the result of a
bisection search in $lo$..$hi$ such that $end$ holds. $test$ determines when to
go left."

SigmaC::usage = "SigmaC[list, body] returns the sum of $body$ for indices i1..in,
running simultaneously thru lists l1..ln. $list$ is of the form {{i1 l1}..{in
ln}}."

PolyC4::usage = "PolyC4[x, a] returns the sum of powers of $x$ with coefficients (from
order 0 up) in list $a$."

UnixEpoch::usage = "UnixEpoch[] returns the start of Unix epoch in 1970"

ValidDateQ::usage = "ValidDateQ[date] returns True if a given date is valid, else False"
 
MomentFromUnix::usage = "MomentFromUbix[s] takes the number of seconds ssince begin of Unix and converts them to moment"

UnixFromMoment::usage = "UnixFromMoment[t] takes a moment and converts it in seconds since Unix start"

FixedFromMoment::usage = "FixedFromMoment[t] is the intger part of moment"

TimeFromMoment::usage = "TimeFromMoment[t] is the fractional  part of moment"

ModC::usage = "ModC{x, {a,b}] is a special Mod function over intervals"
  
SumC::usage = "SumC[f[i], {i, k, p}] is the sum of f[i] for i from k as long as condition p is valid"
 
ProdC::usage = "ProdC[f[i], {i, k, p}] is the product of f[i] for i from k as long as condition p is valid"
   
MinC::usage = "MinC[psi, d] shows position of first element in d where condition p is valid"

MaxC::usage = "MaxC[psi, d] shows position of last element where condition p is valid"

ListOfFixedFromMoments::usage = "ListOfFixedFromMoments[l] returns fixed time for all moments in a list"
   
PositionsInRange::usage "The same as PositionsInInterval"

TimeFromClock::usage =  "TimeFromClock[{h, m, s}] returns the part of the day"
  
ClockFromMoment::usage =  "ClockFromMoment[t] returns to a given moment the hour, minutes and seconds"
   
AngleFromDegree::usage = "AngleFromDegrees[alpha_] returns to a decimal degree the integer degree, minutes and seconds"

NameFromNumber::usage = "NameFromNumber[number, nameList] returns the $number$-th
entry in $nameList$, wrapping around as necessary."

DayOfWeekCFromFixed::usage = "DayOfWeekCFromFixed[date] returns the week day on which
the fixed $date$ falls."

CurrentDateC::usage = "CurrentDateC[] returns the current fixed date according to the
computer's clock, in local time."

CurrentMoment::usage = "CurrentMoment[] returns the fixed moment according to the
computer's clock, in local time."

JDEpoch::usage = "JDEpoch[] returns the fixed time of start of the julian day
number."

MomentFromJD::usage = "MomentFromJD[jd] returns the moment of julian day number
$jd$."

JDFromMoment::usage = "JDFromMoment[tee] returns the julian day number of moment
$tee$."

FixedFromJD::usage = "FixedFromJD[jd] returns the fixed date of julian day number
$jd$."

JDFromFixed::usage = "JDFromFixed[date] returns the julian day number of fixed
$date$."

MJDEpoch::usage = "MJDEpoch[] returns the fixed time of start of the modified
julian day number."

FixedFromMJD::usage = "FixedFromMJD[mjd] returns the fixed date of modified julian
day number $mjd$."

MJDFromFixed::usage = "MJDFromFixed[date] returns the modified julian day number of
fixed $date$."

ConvertDateTo::usage = "ConvertDateTo[date, calendar] returns the calendar $date$
converted to the specified $calendar$."

earlierQ::usage = "earlierQ[date1, date2] ist True, if date2 comes later than date1."

DayOfWeekC::usage = "DayOfWeekC[date] returns the name of the weekday of the date."

DaysPlusC::usage = "DaysPlusC[date, number] adds the number of days to the date."

DaysBetweenC::usage = "DaysBetweenC[date1, date2] returns the number of days
from calendar $date1$ until calendar $date2$, performing calendar conversion as
necessary."

DateDistanceC::usage = "DateDistanceC[date1, date2] returns the number of days
from calendar $date1$ until calendar $date2$, performing calendar conversion as
necessary."

GMT::usage= "GMT[year,month,day,hour] is the time data"

FixedHour::usage = "FixedHour[GMT-time] returns the hours between GMT[1,1,1,0] and the given GMT-time"

HoursBetween::usage = "HoursBetween[GMT1, GMT2] returns the number of hours between two GMT times"

HoursPlus::usage = "HoursPlus[GMT, number] adds the number of hours to the GMT time."

TimePlus::usage = "TimePlus[list, s] adds s seconds to a Gregorian time list {year, month, day, hour, minute, second} and returns the new time as a list of 6 parameters. The parameter s can be negative."

TimeDistance::usage = "TimeDistance[list1, list2] takes two Gregorian time lists each with 6 parameters {year, month, day, hour, minute, second} and returns their distance in seconds."

EquiSol::usage = "EquiSol[y] returns the equinoxes and solstices for a given year"

NeumondGregorian::usage = "NeumondGregorian[y] returns all new moons in year y, the output are (proleptic) Gregorian dates, 
usuable in Astronomy to avoid calendar confusions."

VollmondGregorian::usage= "VollmondGregorian[y] returns all full moons in year y, the output are (proleptic) Gregorian dates, usuable in Astronomy to avoid calendar confusions."

NeumondAlternate::usage="NeumondAlternate[y] returns all new moons in year y. If y < 1582, the year is Julian, else Gregorian.
For some historians useful, but brings confusion for dates earlier than the Julian Calendar."

VollmondAlternate::usage="VollmondAlternate[y] returns all full moons in year y. If y < 1582, the year is Julian, else Gregorian.
For some historians useful, but brings confusion for dates earlier than the Juian Calendar."

FullmoonQ::usage="FullmoonQ[date] returns True if a full moon falls in the given date."

NewmoonQ::usage="NewmoonQ[date] returns True if a full moon falls in the given date."

FullMoonAfter::usage = "FullMoonAfter[tee] returns the moment of next full moon after tee"

NewMoonAfter::usage = "NewMoonAfter[tee] returns the moment of next new moon after tee"

yearRealzahl::usage = "yearRealZahl[gdate] returns the Gregorian year and the following months, days etc as decimal number"

SonnenfinsternisTD::usage="SonnenfinsternisTD[year] returns all solar eclipses in year in dynamical time, after a simpfied algorithm by Meeus. Dynamical time returns dates of the years before 1582 as Julian dates"
 
MondfinsternisTD::usage="MondfinsternisTD[year] returns all lunar eclipses in year in dynamical time, after a simpfied algorithm by Meeus. Dynamical time returns dates of the years before 1582 as Julian dates"

InRangeQ::usage="InRangeQ[tee, range] returns True if $tee$ is in $range$."

ListRange::usage="ListRange[ell, range] returns those moments in list ell that occur in range."

ggg::usage= "ggg[{grad,min,sec}] wandelt {grad,min,sec} in  Bruchteile eines Grades." 

 gms::usage= "gms[{gg] wandelt Bruchteile eines Grades in {grad,min,sec}." 

 mjd::usage ="mjd[datum,stunde] gibt das modifizierte
  Julianische Datum an, d.h. die Zahl der seit dem 17.11.1858 
  0 Uhr WEZ vergangenen Tage. Es gilt 
  mjd[date,0]= julianisch[date]-2400000.5.
  mjd berücksichtigt, daß auf den 4.10.1582 der 15.10.1582 folgte." 

unmjd::usage= "unmjd[mjd] bestimmt zu einer Anzahl Tage
 mjd das zugehörige Kalenderdatum." 

 fixedDate::usage ="fixedDate[datum,stunde] geht vom ersten Tag
des Kalenders aus."

julianisch::usage="julianisch[datum,stunde] gibt den Julianischen Tag zu gegebenem Datum
und gegebener Stunde."


(* ;;;; Section: Old Hindu Calendars *)

Chronometry`Private`CalendarUsage[OldHinduSolar, "old (mean) Hindu (Indian) solar", "old Hindu solar"]
Chronometry`Private`CalendarFields[OldHinduSolar,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

Chronometry`Private`CalendarUsage[OldHinduLunar, "old (mean) Hindu (Indian) lunisolar", "old Hindu lunisolar"]
Chronometry`Private`CalendarFields[OldHinduLunar,
	{CYear, CMonth, CLeapMonth, CDay},
	{Integer, Integer, Symbol, Integer}]

HinduEpoch::usage = "HinduEpoch[] returns the fixed date of the start of the Hindu
calendar (Kali Yuga)."

HinduDayCount::usage = "HinduDayCount[date] returns the elapsed days (Ahargana) to
$date$ since Hindu epoch (KY)."

AryaSolarYear::usage = "AryaSolarYear[] returns the length of the Old Hindu solar
year."

AryaSolarMonth::usage = "AryaSolarMonth[] returns the length of the Old Hindu solar
month."

AryaLunarMonth::usage = "AryaLunarMonth[] returns the length of the Old Hindu lunar
month."

AryaLunarDay::usage = "AryaLunarDay[] returns the length of the Old Hindu lunar
day."

OldHinduLunarLeapYearQ::usage = "OldHinduLunarLeapYearQ[lYear] returns True if
$lYear$ is a leap year on the old Hindu calendar, False otherwise."

AryaJovianPeriod::usage = "AryaJovianPeriod[] returns the number of days in one
revolution of Jupiter around the Sun."

JovianYear::usage = "JovianYear[date] returns the year of the Jupiter cycle at
fixed $date$."

(* ;;;; Section: Julian Calendar *)

Chronometry`Private`CalendarUsage[Julian, "old civil (Julian)", "Julian"]
Chronometry`Private`CalendarFields[Julian,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

JulianEpoch::usage = "JulianEpoch[] returns the fixed date of start of the Julian
calendar."

BCE::usage = "BCE[n] returns the negation of $n$ and is used to mark BCE julian
years."

CE::usage = "CE[n] returns $n$ and is used to mark CE julian years."

JulianLeapYearQ::usage = "JulianLeapYearQ[jYear] returns True if $jYear$ is a leap
year on the Julian calendar, and False otherwise."


(* ;;;; Section: Modern Hindu Calendars *)

Chronometry`Private`CalendarUsage[HinduLunar, "new (true) Hindu (Indian) lunisolar", "new Hindu lunisolar"]
Chronometry`Private`CalendarFields[HinduLunar,
	{CYear, CMonth, CLeapMonth, CDay, CLeapDay},
	{Integer, Integer, Symbol, Integer, Symbol}]

Chronometry`Private`CalendarUsage[HinduSolar, "new (true) Hindu (Indian) solar", "new Hindu solar"]
Chronometry`Private`CalendarFields[HinduSolar,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

HinduSineTable::usage = "HinduSineTable[entry] simulates the Hindu sine table."

HinduSine::usage = "HinduSine[theta] uses linear interpolation in Hindu table."

HinduArcsin::usage = "HinduArcsin[amp] returns the inverse of the Hindu sine
function."

MeanPosition::usage = "MeanPosition[tee, period] returns the position in degrees at
moment $tee$ in uniform circular orbit of $period$ days."

HinduSiderealYear::usage = "HinduSiderealYear[] returns the mean length of the
Hindu sidereal year."

HinduCreation::usage = "HinduCreation[] returns the fixed date of the Hindu
creation."

HinduSiderealMonth::usage = "HinduSiderealMonth[] returns the mean length of the
Hindu sidereal month."

HinduSynodicMonth::usage = "HinduSynodicMonth[] returns the mean time from new moon
to new moon."

HinduAnomalisticYear::usage = "HinduAnomalisticYear[] returns the time from
aphelion to aphelion."

HinduAnomalisticMonth::usage = "HinduAnomalisticMonth[] returns the Time from
apogee to apogee, with bija correction."

TruePosition::usage = "TruePosition[tee, period, size, anomalistic, change] returns
the longitudinal position at moment $tee$. $period$ is the period of mean motion
in days. $size$ is the ratio of radii of epicycle and deferent. $anomalistic$ is
the period of retrograde revolution about epicycle. $change$ is the maximum
decrease in epicycle size."

HinduSolarLongitude::usage = "HinduSolarLongitude[tee] returns the solar longitude
at moment $tee$."

HinduZodiac::usage = "HinduZodiac[tee] returns the zodiacal sign of the sun, as an
integer in range 1..12, at moment $tee$."

HinduLunarLongitude::usage = "HinduLunarLongitude[tee] returns the lunar longitude
at moment $tee$."

HinduLunarPhase::usage = "HinduLunarPhase[tee] returns the Longitudinal distance
between the sun and moon at moment $tee$."

LunarDay::usage = "LunarDay[tee] returns the phase of moon (tithi) at moment $tee$,
as an integer in the range 1..30."

HinduNewMoonBefore::usage = "HinduNewMoonBefore[tee] returns the approximate moment
of the last new moon preceding moment $tee$."

LunarDayAfter::usage = "LunarDayAfter[tee, k] returns the time lunar-day (tithi)
number $k$ begins at or after moment $tee$. $k$ can be fractional (for karanas)."

HinduSolarOnOrBeforeQ::usage = "HinduSolarOnOrBeforeQ[date1, date2] returns True if
Hindu solar $date1$ is on or before $date2$."

HinduCalendarYear::usage = "HinduCalendarYear[tee] returns the solar year at moment
$tee$."

HinduSolarEra::usage = "HinduSolarEra[] returns the years from Kali Yuga until Saka
era."

HinduLunarEra::usage = "HinduLunarEra returns the years from Kali Yuga until
Vikrama era."

HinduLunarOnOrBeforeQ::usage = "HinduLunarOnOrBeforeQ[date1, date2] returns True if
Hindu lunar date $date1$ is on or before Hindu lunar date $date2$."

HinduEquationOfTime::usage = "HinduEquationOfTime[date] returns the time from mean
to true midnight of $date$. (This is a gross approximation to the correct
value.)"

AscensionalDifference::usage = "AscensionalDifference[date, locale] returns the
difference between right and oblique ascension of sun on $date$ at $locale$."

HinduTropicalLongitude::usage = "HinduTropicalLongitude[date] returns the Hindu
tropical longitude on fixed $date$. Assumes precession with maximum of 27 degrees
and period of 7200 sidereal years."

RisingSign::usage = "RisingSign[date] returns the tabulated speed of rising of
current zodiacal sign on $date$."

DailyMotion::usage = "DailyMotion[date] returns the sidereal daily motion of the
sun on $date$."

SolarSiderealDifference::usage = "SolarSiderealDifference[date] returns the
difference between solar and sidereal day on $date$."

Ujjain::usage = "Ujjain[] returns the Location of Ujjain, India."

HinduLocale::usage = "HinduLocale[] returns the Location (Ujjain, India) for
determining the Hindu calendar."

HinduSunrise::usage = "HinduSunrise[date] returns the sunrise at HinduLocale[] on
$date$."

AltHinduSunrise::usage = "AltHinduSunrise[date] returns the astronomical sunrise at
HinduLocale[] on $date$, rounded to nearest minute, as a rational number."

LunarStation::usage = "LunarStation[date] returns the Hindu lunar station
(nakshatra) at sunrise on $date$."

HinduSolarLongitudeAfter::usage = "HinduSolarLongitudeAfter[tee, phi] returns the
Moment UT of the first time at or after $tee$ when Hindu solar longitude will be
$phi$ degrees."

MeshaSamkranti::usage = "MeshaSamkranti[gYear] returns the fixed moment of Mesha
samkranti (Vernal equinox) in Gregorian $gYear$."

HinduLunarNewYear::usage = "HinduLunarNewYear[gYear] returns the fixed date of
Hindu lunisolar new year in Gregorian $gYear$."

Karana::usage = "Karana[n] returns the number (0-10) of the name of the $n$-th
(1-60) Hindu karana."

Yoga::usage = "Yoga[date] returns the Hindu yoga on $date$."

SacredWednesdaysInGregorian::usage = "SacredWednesdaysInGregorian[gYear] returns a
list of Wednesdays in Gregorian $gYear$ that are day 8 of Hindu lunar months."

SacredWednesdays::usage = "SacredWednesdays[start, end] returns a list of
Wednesdays between fixed dates $start$ and $end$ (inclusive) that are day 8 of
Hindu lunar months."

(* ;;;; Section: Gregorian Calendar *)

Chronometry`Private`CalendarUsage[Gregorian, "present civil (Gregorian)", "Gregorian"]
Chronometry`Private`CalendarFields[Gregorian,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

DayOfWeekCNames::usage = "DayOfWeekCNames[] returns a list of the names of the
standard week days."

MonthNames::usage = "MonthNames[] returns a list of the names of the standard
months."

NameFromDayOfWeekC::usage = "NameFromDayOfWeekC[DayOfWeekC] returns the name of
$DayOfWeekC$."

NameFromMonth::usage = "NameFromMonth[month] returns the name of the standard
$month$."

GregorianEpoch::usage = "GregorianEpoch[] returns the fixed date of the start of
the (proleptic) Gregorian calendar."

GregorianLeapYearQ::usage = "GregorianLeapYearQ[gYear] returns True if $gYear$ is a
leap year on the Gregorian calendar, False otherwise."

GregorianYearFromFixed::usage = "GregorianYearFromFixed[date] returns the Gregorian
year corresponding to the fixed $date$."

GregorianNewYear::usage = "GregorianNewYear[gYear] returns the fixed date of Jan 1 in gYear."

GregorianYearEnd::usage = "GregorianYearEnd[gYear] returns the fixed date of Dec 31 in gYear."

GregorianYearRange::usage = "GregorianYearRange[gYear] returns the range of moments in gYear."

DayNumber::usage = "DayNumber[date] returns the number of the day in the year of
the calendar $date$. DayNumber[] returns the set of calendars supported by
DayNumber[date]."

DaysRemaining::usage = "DaysRemaining[date] returns the number of days remaining in
the year after the calendar $date$. DaysRemaining[] returns the set of calendars
supported by DaysRemaining[date]."

AltFixedFromGregorian::usage = "AltFixedFromGregorian[date] give an alternative
calculation of the fixed date equivalent to the Gregorian date."

AltGregorianFromFixed::usage = "AltGregorianFromFixed[date] returns an alternative
calculation of the Gregorian date corresponding to fixed $date$."

AltGregorianYearFromFixed::usage = "AltGregorianYearFromFixed[date] returns an
alternative calculation of the Gregorian year corresponding to the fixed $date$."

IndependenceDay::usage = "IndependenceDay[gYear] returns the fixed date of United
States Independence Day in the Gregorian $gYear$."

KDayOnOrBefore::usage = "KDayOnOrBefore[date, k] returns the fixed date of the
$k$-day on or before fixed $date$. A $k$-day of 0 means Sunday, 1 means Monday,
etc."

KDayOnOrAfter::usage = "KDayOnOrAfter[date, k] returns the fixed date of the
$k$-day on or after fixed $date$. A $k$-day of 0 means Sunday, 1 means Monday,
etc."

KDayNearest::usage = "KDayNearest[date, k] returns the fixed date of the $k$-day
nearest fixed $date$. A $k$-day of 0 means Sunday, 1 means Monday, etc."

KDayAfter::usage = "KDayAfter[date, k] returns the fixed date of the $k$-day after
fixed $date$. A $k$-day of 0 means Sunday, 1 means Monday, etc."

KDayBefore::usage = "KDayBefore[date, k] returns the fixed date of the $k$-day
before fixed $date$. A $k$-day of 0 means Sunday, 1 means Monday, etc."

NthKDay::usage = "NthKDay[n, k, date] returns the fixed date of the $n$-th $k$-day
after calendar $date$. If $n$ > 0 the $n$-th $k$-day on or after $date$ is
returned. If $n$ < 0, the $n$-th $k$-day on or before $date$ is returned. A
$k$-day of 0 means Sunday, 1 means Monday, etc."

FirstKDay::usage = "FirstKDay[k, date] returns the fixed date of the first $k$-day
on or after calendar $date$. A $k$-day of 0 means Sunday, 1 means Monday, and so
on."

LastKDay::usage = "LastKDay[k, date] returns the fixed date of the last $k$-day on
or before calendar $date$. A $k$-day of 0 means Sunday, 1 means Monday, and so
on."

LaborDay::usage = "LaborDay[gYear] returns the fixed date of United States Labor
Day in Gregorian $gYear$-- the first Monday in September."

MemorialDay::usage = "MemorialDay[gYear] returns the fixed date of United States
Memorial Day in Gregorian $gYear$-- the last Monday in May."

ElectionDay::usage = "ElectionDay[gYear] returns the fixed date of United States
Election Day in Gregorian $gYear$-- the Tuesday after the first Monday in
November."

Christmas::usage = "Christmas[gYear] returns the fixed date of Christmas in
Gregorian $gYear$."

Advent::usage = "Advent[gYear] returns the fixed date of Advent in Gregorian
$gYear$ -- the Sunday closest to November 30."

Epiphany::usage = "Epiphany[gYear] returns the fixed date of Epiphany in the U.S.
in Gregorian $gYear$ -- the first Sunday after January 1."

JulianInGregorian::usage = "JulianInGregorian[jMonth, jDay, gYear] returns a list
of the fixed dates of Julian $jMonth$ and $jDay$ that occur in Gregorian
$gYear$."

EasternOrthodoxChristmas::usage = "EasternOrthodoxChristmas[gYear] returns a list
of zero or one fixed dates of Eastern Orthodox Christmas in Gregorian $gYear$."

(* ;;;; Section: Ecclesiastical Calendars *)

OrthodoxEaster::usage = "OrthodoxEaster[gYear] returns the fixed date of Orthox
Easter in Gregorian $gYear$."

AltOrthodoxEaster::usage = "AltOrthodoxEaster[gYear] returns an alternate
calculation of the fixed date of Orthodox Easter in Gregorian $gYear$."

Easter::usage = "Easter[gYear] returns the fixed date of Easter in Gregorian
$gYear$."

Pentecost::usage = "Pentecost[gYear] returns the fixed date of Pentecost in
Gregorian $gYear$."

(* ;;;; Section: Time and Astronomy *)

Hr::usage = "Hr[x] returns the fraction of a day represented by $x$ hours."

Mt::usage = "Mt[x] returns $x$ and is used to mark values in meters."

Deg::usage = "Deg[x] returns $x$ and is used to mark values in degrees."

Angle::usage = "Angle[d, m, s] returns the real angle denoted by $d$ degrees, $m$
arcminutes, and $s$ arcseconds."

Degrees::usage = "Degrees[theta] returns $theta$ normalized to a range o 0-360
degrees."

RadiansToDegrees::usage = "RadiansToDegrees[theta] returns the value in degrees of
$theta$ radians."

DegreesToRadians::usage = "DegreesToRadians[theta] returns the value in radians of
$theta$ degrees."

SinDegreesC::usage = "SinDegreesC[theta] returns the sine of $theta$ degrees."

CosDegreesC::usage = "CosDegreesC[theta] returns the cosine of $theta$ degrees."

TanDegreesC::usage = "TanDegreesC[theta] returns the tangent of $theta$ degrees."

ArcTanDegreesC::usage = "ArcTanDegreesC[theta] returns the arctangent of $theta$
degrees."

ArcSinDegreesC::usage = "ArcSinDegreesC[theta] returns the arcsine of $theta$
degrees."

ArcCosDegreesC::usage = "ArcCosDegreesC[theta] returns the arccosine of $theta$
degrees."

Location::usage = "Location represents a location on the Earth's surface.
Location[] returns a list of components in a Location."

LocationQ::usage = "LocationQ[location] returns True if location is a valid
Location, False otherwise."

CPlaceName::usage = "CPlaceName[locale] returns the place name of Location
$locale$."

CLatitude::usage = "CLatitude[locale] returns the latitude of Location $locale$."

CLongitude::usage = "CLongitude[locale] returns the longitude of Location
$locale$."

CElevation::usage = "CElevation[locale] returns the elevation (in meters) of
Location $locale$."

CZone::usage = "CZone[locale] returns the time zone (as an offset from universal
time) of Location $locale$."

Urbana::usage = "Urbana[] returns the Location of Urbana, IL, USA."

LosAngeles::usage = "LosAngeles[] returns the Location of Los Angeles, CA, USA."

Mecca::usage = "Mecca[] returns the location of Mecca, Saudi Arabia."

MDirection::usage = "MDirection[locale, focus] returns the angle (clockwise from
North) to face $focus$ when standing in $locale$. Subject to errors near focus
and its antipode."

DirectionC::usage = "DirectionC[locale, focus] returns the angle (clockwise from
North) to face $focus$ when standing in $locale$. Subject to errors near focus
and its antipode."

TimeOfDay::usage = "TimeOfDay represents a time of day. TimeOfDay[tee] returns the
time of day from moment $tee$. TimeOfDay[] returns a list of components in a time
of day."

TimeOfDayQ::usage = "TimeOfDayQ[time] returns True if $time$ is a valid TimeOfDay,
False otherwise."

CHour::usage = "CHour[time] returns the hour component of TimeOfDay $time$."

CMinute::usage = "CMinute[time] returns the minute component of TimeOfDay $time$."

CSecond::usage = "CSecond[time] returns the second component of TimeOfDay $time$."

ToMoment::usage = "ToMoment[timeOfDay] returns the moment corresponding to the
TimeOfDay $time$."

StandardFromUniversal::usage = "StandardFromUniversal[teeU, locale] returns the
standard time from $teeU$ in universal time at $locale$."

UniversalFromStandard::usage = "UniversalFromStandard[teeS, locale] returns the
universal time from $teeS$ in standard time at $locale$."

LocalFromUniversal::usage = "LocalFromUniversal[teeU, locale] returns the local
time from universal $teeU$ at $locale$."

UniversalFromLocal::usage = "UniversalFromLocal[teeEll, locale] returns the
universal time from local $teeEll$ at $locale$."

StandardFromLocal::usage = "StandardFromLocal[teeEll, locale] returns the standard
time from local $teeEll$ at $locale$."

LocalFromStandard::usage = "LocalFromStandard[teeS, locale] returns the local time
from standard $teeS$ at $locale$."

Midday::usage = "Midday[date, locale] returns the standard time on fixed $date$ of
midday at $locale$."

Midnight::usage = "Midnight[date, locale] returns the standard time on fixed $date$
of true (apparent) midnight at $locale$."

JulianCenturies::usage = "JulianCenturies[tee] returns the julian centuries since
2000 at moment $tee$."

Obliquity::usage = "Obliquity[tee] returns the obliquity of the ecliptic at moment
$tee$."

MomentFromDepression::usage = "MomentFromDepression[approx, locale, alpha] returns
the moment in Local Time near $approx$ when depression angle of sun is $alpha$
(negative if above horizon) at $locale$. Returns Bogus if it never occurs."

Dawn::usage = "Dawn[date, locale, alpha] returns the standard time in the morning
of $date$ at $locale$ when depression angle of sun is $alpha$."

Dusk::usage = "Dusk[date, locale, alpha] returns the standard time in the evening
on $date$ at $locale$ when depression angle of sun is $alpha$."

SunriseC::usage = "SunriseC[date, locale] returns the standard time of sunrise on
$date$ at $locale$."

SunsetC::usage = "SunsetC[date, locale] returns the standard time of sunset on fixed
$date$ at $locale$."

Sonnenaufgang::usage="Sonnenaufgang[date, locale] returns the standard time not-gms of sunrise on
$date$ at $locale$."

Sonnenuntergang::usage="Sonnenuntergang[date, locale] returns the standard time not-gms of sunset on
$date$ at $locale$."

fruehesterSonnenaufgang::usage="fruehesterSonnenaufgang[year, locale] returns the date when the earliest 
sunrise in year occurs."

fruehesterSonnenuntergang::usage="fruehesterSonnenuntergang[year, locale] returns the date when the earliest 
sunset in year occurs."

spaetesterSonnenaufgang::usage="spaetesterSonnenaufgang[year, locale] returns the date when the latest 
sunrise in year occurs."

spaetesterSonnenuntergang::usage="spaetesterSonnenuntergang[year, locale] returns the date when the latest 
sunset in year occurs."

UniversalFromDynamical::usage = "UniversalFromDynamical[tee] returns the universal
moment from Dynamical time $tee$."

DynamicalFromUniversal::usage = "DynamicalFromUniversal[tee] returns the dynamical
time at Universal moment $tee$."

WeltzeitInDynamisch::usage = "WeltzeitInDynamisch[ereigniszeit] verwandelt eine 
in UTC gegebene Ereigniszeit in TD"

DynamischInWeltzeit::usage = "DynamischInWeltzeit[ereigniszeit] verwandelt eine 
in TD gegebene Ereigniszeit in UTC"

J2000::usage = "J2000[] returns the moment of noon at the start of Gregorian year
2000."

SiderealFromMoment::usage = "SiderealFromMoment[tee] returns the mean sidereal time
of day from moment $tee$ expressed as hour angle. Adapted from \"Astronomical
Algorithms\" by Jean Meeus, Willmann-Bell, Inc., 1991."

MeanTropicalYear::usage = "MeanTropicalYear[] returns the length in days of the
mean tropical year."

MeanSynodicMonth::usage = "MeanSynodicMonth[] returns the length in days of the
mean synodic month."

EphemerisCorrection::usage = "EphemerisCorrection[tee] returns the Dynamical Time
minus Universal Time (in days) for fixed time $tee$.  Adapted from \"Astronomical
Algorithms\" by Jean Meeus, Willmann-Bell, Inc., 1991."

EquationOfTime::usage = "EquationOfTime[tee] returns the equation of time (as
fraction of day) for moment $tee$. Adapted from \"Astronomical Algorithms\" by
Jean Meeus, Willmann-Bell, Inc., 1991."

LocalFromApparent::usage = "LocalFromApparent[tee, location] returns the local time from
sundial time $tee$."

ApparentFromLocal::usage = "ApparentFromLocal[tee, location] returns the sundial time at
local time $tee$."

ApparentFromUniversal::usage = "ApparentFromUniversal[tee, location] returns the sundial time at
universl time $tee$."

UniversalFromApparent::usage = "UniversalFromApparent[tee, location] returns the universal time at sundial time "

LunarSolarAngle::usage = "LunarSolarAngle[jd] returns the lunar phase, as an
angle in degrees, at astronomical (julian) day number jd.  An angle of 0 means
a new moon, 90 degrees means the first quarter, 180 means a full moon, and 270
degrees means the last quarter."

SolarLongitudeC::usage = "SolarLongitudeC[tee] returns the longitude of the sun at
the moment tee. Adapted from \"Planetary Programs and Tables from -4000 to
+2800\" by Pierre Bretagnon and Jean-Louis Simon, Willmann-Bell, Inc., 1986."

Nutation::usage = "Nutation[tee] returns the longitudinal nutation at moment
$tee$."

Aberration::usage = "Aberration[tee] returns the aberration at moment $tee$."

SolarLongitudeAfter::usage = "SolarLongitudeAfter[tee, phi] returns the moment UT
of the first time at or after $tee$ when the solar longitude will be $phi$
degrees."

Spring::usage = "Spring[] returns the longitude of the sun at vernal equinox."

Summer::usage = "Summer[] returns the longitude of the sun at summer solstice."

Autumn::usage = "Autumn[] returns the longitude of the sun at autumnal equinox."

Winter::usage = "Winter[] returns the longitude of the sun at vernal solstice."

LunarLongitude::usage = "LunarLongitude[tee] returns the Longitude of the moon (in
degrees) at moment tee. Adapted from \"Astronomical Algorithms\" by Jean Meeus,
Willmann-Bell, Inc., 1991."

NthNewMoon::usage = "NthNewMoon[n] returns the moment of $n$-th new moon after (or
before) the new moon of January 11, 1.  Adapted from \"Astronomical Algorithms\"
by Jean Meeus, Willmann-Bell, Inc., 1991."

NewMoonBefore::usage = "NewMoonBefore[tee] returns the Moment UT of the last new
moon before $tee$."

NewMoonAfter::usage = "NewMoonAfter[tee] returns the Moment UT of the last new moon
at or after $tee$."

LunarPhase::usage = "LunarPhase[tee] returns the lunar phase, as an angle in
degrees, at moment $tee$. An angle of 0 means a new moon, 90 degrees means the
first quarter, 180 means a full moon, and 270 degrees means the last quarter."

New::usage = "New[] returns the excess of lunar longitude over solar longitude at
the new moon."

FirstQuarter::usage = "FirstQuarter[] returns the excess of lunar longitude over
solar longitude at the first quarter moon."

FullLunar::usage = "FullLunar[] returns the excess of lunar longitude over solar longitude at
the full moon."

LastQuarter::usage = "LastQuarter[] returns the excess of lunar longitude over
solar longitude at the last quarter moon."

LunarPhaseBefore::usage = "LunarPhaseBefore[tee, phi] returns the moment UT of the
last time at or before $tee$ when the lunar-phase was $phi$ degrees."

LunarPhaseAfter::usage = "LunarPhaseAfter[tee, phi] returns the moment UT of the
next time at or after $tee$ when the lunar-phase is $phi$ degrees."

LunarLatitude::usage = "LunarLatitude[tee] returns the latitude of the moon (in
degrees) at moment $tee$. Adapted from \"Astronomical Algorithms\" by Jean Meeus,
Willmann-Bell, Inc., 1998."

LunarAltitude::usage = "LunarAltitude[tee, locale] returns the altitude of the moon
at $tee$ at $locale$, ignoring parallax and refraction. Adapted from
\"Astronomical Algorithms\" by Jean Meeus, Willmann-Bell, Inc., 1998."

EstimatePriorSolarLongitude::usage = "EstimatePriorSolarLongitude[tee, phi] returns
the Approximate moment at or before $tee$ when the solar longitude just exceeded
$phi$ degrees."

VisibleCrescent::usage = "VisibleCrescent[date, locale] uses S. K. Shaukat's
criterion for likely visibility of crescent moon on the eve of $date$ at $locale$, and returns
True or False."

PhasisOnOrBefore::usage = "PhasisOnOrBefore[date, locale] returns the closest fixed
date on or before $date$ when the crescent moon first became visible at
$locale$."

PhasisOnOrAfter::usage = "PhasisOnOrAfter[date, locale] returns the closest fixed
date on or after $date$ when the crescent moon first became visible at
$locale$."

Jerusalem::usage = "Jerusalem[] returns the location of Jerusalem, Israel."

SamaritanLocation::usage = "SamaritanLocation[] returns the location of Mt. Gerizim"

Acre::usage = "Acre[] returns the location of Acre, Israel"

(* ;;;; Section: Test Code *)

ChronometryTest::usage = "ChronometryTest[] runs a series of tests on the date
conversion algorithms, comparing the results against test data transcribed from
Appendix C of _Chronometryl Calculations_ and elsewhere. As it runs, it prints a
list of tests performed and either ok if the algorithms appear to be working
correctly, or a list containing any discrepancies found."

DayOfWeekCNames[Gregorian, ASCII] = {
	"Sunday", 
	"Monday", 
	"Tuesday", 
	"Wednesday", 
	"Thursday", 
	"Friday", 
	"Saturday"}

DayOfWeekCNames[] :=
	DayOfWeekCNames[Gregorian, ASCII]


MonthNames[Gregorian, ASCII] = {
	"January", 
	"February", 
	"March", 
	"April", 
	"May", 
	"June", 
	"July", 
	"August", 
	"September", 
	"October", 
	"November", 
	"December"}
	

MonthNames[] :=
	MonthNames[Gregorian, ASCII]

Map[(Evaluate[Symbol[#]]::"usage" =
	StringJoin[#, " represents a day of the week. ",
	#, "[] returns a corresponding numerical constant."])&, DayOfWeekCNames[]]


Map[(Evaluate[Symbol[#]]::"usage" =
	StringJoin[#, " represents a month on the Julian and Gregorian calendars. ",
	#, "[] returns a corresponding numerical constant."])&, MonthNames[]]

Begin["`Private`"]

SundayC[] = 0;
MondayC[] = 1;
TuesdayC[] = 2;
WednesdayC[] = 3;
ThursdayC[] = 4;
FridayC[] = 5;
SaturdayC[] = 6;

(* test if a given date is valid *)

ValidDateQ[x_[date__]] := x[ToFixed[x[date]]] == x[date]

(* Identity function for R.D. dates *)

ToFixed[date_Integer] :=
	date

(** adjusted-mod **)

AdjustedMod[x_, y_] :=
	y + Mod[x, -y]


(** next **)

MNext[initial_, condition_] :=
	Module[{i},
		For[i = initial, !condition[i], ++i];
		i
	]

(** final **)

MFinal[initial_, condition_] :=
	Module[{i},
		For[i = initial, condition[i], ++i];
		i - 1
	]


(** sum **)

MSum[expression_, initial_, condition_] :=
	Module[{total, i},
		For[total = 0; i = initial, condition[i], ++i, total += expression[i]];
		total
	]


(** binary-search **)

BinarySearch[lo_, hi_, test_, end_] :=
	Module[{l, h, x},
		For[
			l = lo; h = hi; x = (h + l) / 2,	(* establish the low and high bounds, and the point between them *)
			!end[l, h],							(* continue until the end condition is true *)
			Identity,							(* no action in increment phase *)
			If[test[x], h = x, l = x];			(* body determines whether to go left or right, and resets the upper or lower bounds accordingly *)
			x = (h + l) / 2						(* then it resets the test point to lie between the bounds *)
		];
		x										(* return the last test point visited *)
	]


(** sigma **)

SigmaC[list_, body_] :=
	Apply[Plus, Apply[Function[Evaluate[Map[First, list]], body],
		Map[Part[#, 2]&, list] ]]


(** poly **)

PolyC4[x_, a_] :=
	a[[1]] + Sum[a[[i]] x^(i - 1), {i, 2, Length[a]}]

UnixEpoch[] = 719163
 
MomentFromUnix[s_] := UnixEpoch[] + s/(24*3600)

UnixFromMoment[t_] := 24*3600*(t - UnixEpoch[])

FixedFromMoment[t_] := Floor[t]

TimeFromMoment[t_] := FractionalPart[t]

ModC[x_, {a_, b_}] /; 
   Not[(a == 1) && (b \[Element] Integers) && (b !=  0)] := 
  If[a == b, x, a + Mod[x - a, b - a]]
  
ModC[x_, {1, b_}] /; ((b \[Element] Integers) && (b !=  0) ) := 
  b + Mod[x, -b]
  
SumC[f_[i_], {i, k_, p_}] :=
  Module[{erg = 0},
   i = k ; 
   While[p, erg = erg + f[i]; i = i + 1]; erg]
   
ProdC[f_[i_], {i, k_, p_}] :=
  Module[{erg = 0},
   i = k ; 
   While[p, erg = erg*f[i]; i = i + 1]; erg]
   
MinC[psi_, d_] := LengthWhile[d, Not[psi]] + 1

MaxC[psi_, d_] := LengthWhile[d, psi]

ListOfFixedFromMoments[l_] := 
  If[l === {}, {}, 
   Join[{FixedFromMoment[First[l]], ListOfFixedFromMoments[Rest[l]]}]]
   
PositionsInRange = PositionsInInterval

TimeFromClock[{h_, m_, s_}] := 
  N[ h/24.0 + m/(24*60) + s/(24*3600), 20]
  
ClockFromMoment[t_] := Module[{fh, fm, fs},
   fh = FractionalPart[t]*24; fm = FractionalPart[fh]*60; 
   fs = FractionalPart[fm]*60; {Floor[fh], Floor[fm], Round[fs]}]
   
AngleFromDegrees[alpha_] := Module[{d = Abs[alpha], fm, fs},
   fm = FractionalPart[d]*60; fs = FractionalPart[fm]*60;
   {Floor[d], Floor[fm], Round[fs]}]

NameFromNumber[number_Integer, nameList_List] :=
	nameList[[ AdjustedMod[number, Length[nameList]] ]]


(** day-of-week-from-fixed **)

DayOfWeekCFromFixed[date_Integer] :=
	Mod[date, 7]


CurrentDateC[] :=
	ToFixed[Apply[Gregorian, Take[Date[], 3]]]


CurrentMoment[] :=
	ToFixed[Gregorian[1900, January[], 1]] + AbsoluteTime[] / (60 60 24)


(** jd-epoch **)

JDEpoch[] = -1721424.5


(** moment-from-jd **)

MomentFromJD[jd_] :=
	jd + JDEpoch[]


(** jd-from-moment **)

JDFromMoment[tee_] :=
	tee - JDEpoch[]


(** fixed-from-jd **)

FixedFromJD[jd_] :=
	Floor[MomentFromJD[jd]]


(** jd-from-fixed **)

JDFromFixed[date_] :=
	JDFromMoment[date]


(** mjd-epoch **)

MJDEpoch[] = 678576


(** fixed-from-mjd **)

FixedFromMJD[mjd_] :=
	mjd + MJDEpoch[]


(** mjd-from-fixed **)

MJDFromFixed[date_] :=
	date - MJDEpoch[]


ConvertDateTo[date_, calendar_] :=
	calendar[ToFixed[date]]

InRangeQ[tee_, range_] := range[[1]] <= tee <= Last[range]

ListRange[ell_, range_] := 
 Module[{r}, If[ell == {}, {}, r = ListRange[Rest[ell], range];
   If[InRangeQ[ell[[1]], range], Append[{ell[[1]]}, r], r]]]


earlierQ[date1_, date2_]:= ToFixed[date1] < ToFixed[date2]

Off[Syntax::com];

DayOfWeekC[date_] := 
 NameFromDayOfWeekC[DayOfWeekCFromFixed[First[ConvertDateTo[date,]]]]

DateDistanceC[date1_, date2_] :=
	ToFixed[date2] - ToFixed[date1]

DaysBetweenC[date1_, date2_] :=
	ToFixed[date2] - ToFixed[date1]      

DaysPlusC[date_, summand_] := 
 Module[{f = Head[date], ex = First[ConvertDateTo[date,]] + summand}, 
  f[ex]]
  
FixedHour[GMT[y_,m_,d_,h_]]:=24*ToFixed[Gregorian[y,m,d]]+h
 
GMT[fixed_]:= Module[{gg=Gregorian[Floor[fixed/24.0]],y,m,d,h},
y=gg[[1]];m=gg[[2]];d=gg[[3]];h=fixed-24*ToFixed[Gregorian[y,m,d]];
GMT[y,m,d,h]]
  
HoursBetween[uhrzeit1_, uhrzeit2_] :=  
  FixedHour[uhrzeit2] - FixedHour[uhrzeit1]
  
HoursPlus[uhrzeit_, anzahl_] := GMT[FixedHour[uhrzeit] + anzahl]
  
(* TimePlus: Adds s seconds to a Gregorian time list {year, month, day, hour, minute, second} *)
TimePlus[list_List, s_] :=
 Module[{year, month, day, hour, minute, second, totalSeconds, 
   newSeconds, dayDelta, fixedDate, newFixedDate, gregorianDate},
  (* Extract components from input list *)
  {year, month, day, hour, minute, second} = list;
  
  (* Convert time to moment *)
  fixedDate = ToFixed[Gregorian[year, month, day]];
  totalSeconds = hour*3600 + minute*60 + second + s;
  
  (* Calculate day offset and remaining seconds *)
  dayDelta = Floor[totalSeconds / (24*3600)];
  newSeconds = Mod[totalSeconds, 24*3600];
  
  (* Calculate new date *)
  newFixedDate = fixedDate + dayDelta;
  gregorianDate = Gregorian[newFixedDate];
  
  (* Convert seconds back to hours, minutes, seconds *)
  hour = Floor[newSeconds / 3600];
  newSeconds = newSeconds - hour*3600;
  minute = Floor[newSeconds / 60];
  second = newSeconds - minute*60;
  
  (* Return as list *)
  {CYear[gregorianDate], CMonth[gregorianDate], CDay[gregorianDate], 
   hour, minute, second}
 ]

(* TimeDistance: Returns the distance in seconds between two time lists *)
TimeDistance[list1_List, list2_List] :=
 Module[{year1, month1, day1, hour1, minute1, second1, year2, month2, 
   day2, hour2, minute2, second2, fixed1, fixed2, dayDiff, timeDiff1, 
   timeDiff2},
  (* Extract components *)
  {year1, month1, day1, hour1, minute1, second1} = list1;
  {year2, month2, day2, hour2, minute2, second2} = list2;
  
  (* Convert to fixed dates *)
  fixed1 = ToFixed[Gregorian[year1, month1, day1]];
  fixed2 = ToFixed[Gregorian[year2, month2, day2]];
  
  (* Calculate day difference in seconds *)
  dayDiff = (fixed2 - fixed1) * 24 * 3600;
  
  (* Calculate time difference in seconds *)
  timeDiff1 = hour1*3600 + minute1*60 + second1;
  timeDiff2 = hour2*3600 + minute2*60 + second2;
  
  (* Return total difference *)
  dayDiff + timeDiff2 - timeDiff1
 ]

MeanYear[cal_] := 
 N[DateDistanceC[cal[100, 1, 1], cal[500, 1, 1]]/400, 10]
  
EquiSol[j_] := 
 Module[{erg, date, std, fruehling, sommer, herbst, winter},
  If[j < 1000, y = j/1000;
   fruehling = 
    1721139.29189 + 365242.13740 y + 0.06134 y^2 + 0.00111 y^3 - 
     0.00071 y^4;
   sommer = 
    1721233.25401 + 365241.72562 y - 0.05323 y^2 + 0.00907 y^3 + 
     0.00025 y^4;
   herbst = 
    1721325.70455 + 365242.49558 y - 0.11677 y^2 - 0.00297 y^3 + 
     0.00074 y^4;
   winter = 
    1721414.39987 + 365242.88257 y - 0.00769 y^2 - 0.00933 y^3 - 
     0.00006 y^4,
   y = (j - 2000)/1000;
   fruehling = 
    2451623.80984 + 365242.37404 y + 0.05169 y^2 - 0.00411 y^2 - 
     0.00057 y^4;
   sommer = 
    2451716.56767 + 365241.62603 y + 0.00325 y^2 + 0.00888 y^3 - 
     0.00030 y^4;
   herbst = 
    2451810.21715 + 365242.01767 y - 0.11575 y^2 + 0.00337 y^3 + 
     0.00078 y^4;
   winter = 
    2451900.05952 + 365242.74049 y - 0.06223 y^2 - 0.00823 y^3 + 
     0.00032 y^4];
  date = {fruehling, sommer, herbst, winter};
  std = Map[FractionalPart[#] - 0.5 &, date]*24;
  date = Map[Gregorian, FixedFromJD[date]];
  Do[If[std[[i]] < 0, std[[i]] = std[[i]] + 24], {i, 1, 4}]; 
  std = Map[gms, std];
  erg = Table[{date[[i]], std[[i]]}, {i, 1, 4}];
  erg = Map[DynamischInWeltzeit[#] &, erg]; erg]
  
  NeumondGregorian[jahr_] := 
 Module[{correctedseconds = 
    0.003464788444132334* jahr^2 - 13.49712325998752*jahr + 11776.4, 
   start, fi, fein, el, aus = {}}, 
  start = ToFixed[Gregorian[jahr, 1, 1]];
  Do[fi = NewMoonAfter[start];
   el = {Gregorian[Floor[fi]], gms[(fi - Floor[fi])*24]};
   fein = 
    TimePlus[{el[[1, 1]], el[[1, 2]], el[[1, 3]], el[[2, 1]], 
      el[[2, 2]], el[[2, 3]]}, correctedseconds];
   el = {Gregorian[fein[[1]], fein[[2]], fein[[3]]], {fein[[4]], 
      fein[[5]], fein[[6]]}};
   If[el[[1, 1]] == jahr, aus = Append[aus, el]];
   start = fi + 1, {i, 1, 13}]; aus]

VollmondGregorian[jahr_] := 
 Module[{correctedseconds = 
    0.003464788444132334* jahr^2 - 13.49712325998752*jahr + 11776.4, 
   start, fi, fein, el, aus = {}}, 
  start = ToFixed[Gregorian[jahr, 1, 1]];
  Do[fi = FullMoonAfter[start];
   el = {Gregorian[Floor[fi]], gms[(fi - Floor[fi])*24]};
   fein = 
    TimePlus[{el[[1, 1]], el[[1, 2]], el[[1, 3]], el[[2, 1]], 
      el[[2, 2]], el[[2, 3]]}, correctedseconds];
   el = {Gregorian[fein[[1]], fein[[2]], fein[[3]]], {fein[[4]], 
      fein[[5]], fein[[6]]}};
   If[el[[1, 1]] == jahr, aus = Append[aus, el]];
   start = fi + 1, {i, 1, 13}]; aus]
NeumondAlternate[jahr_] :=
 Module[{ 
   correctedseconds = 
    0.003464788444132334* jahr^2 - 13.49712325998752*jahr + 11776.4,
   calAkt, start, fi, fein, el, aus = {}},
  If[jahr < 1582, calAkt = Julian, calAkt = Gregorian];
  start = ToFixed[calAkt[jahr, 1, 1]];
  Do[fi = NewMoonAfter[start];
   el = {calAkt[Floor[fi]], gms[(fi - Floor[fi])*24]};
   fein = 
    TimePlus[{el[[1, 1]], el[[1, 2]], el[[1, 3]], el[[2, 1]], 
      el[[2, 2]], el[[2, 3]]}, correctedseconds];
   el = {calAkt[fein[[1]], fein[[2]], fein[[3]]], {fein[[4]], 
      fein[[5]], fein[[6]]}};
   If[el[[1, 1]] == jahr, aus = Append[aus, el]];
   start = fi + 1, {i, 1, 13}]; aus]

VollmondAlternate[jahr_] := 
 Module[{correctedseconds = 
    0.003464788444132334* jahr^2 - 13.49712325998752*jahr + 11776.4, 
   calAkt, start, fi, fein, el, aus = {}}, 
  If[jahr < 1582, calAkt = Julian, calAkt = Gregorian];
  start = ToFixed[calAkt[jahr, 1, 1]];
  Do[fi = FullMoonAfter[start];
   el = {calAkt[Floor[fi]], gms[(fi - Floor[fi])*24]};
   fein = 
    TimePlus[{el[[1, 1]], el[[1, 2]], el[[1, 3]], el[[2, 1]], 
      el[[2, 2]], el[[2, 3]]}, correctedseconds];
   If[el[[1, 1]] == jahr, aus = Append[aus, el]];
   start = fi + 1, {i, 1, 13}]; aus]

FullmoonQ[datum_] := 
 Module[{calAkt = Head[datum], akt, fi, mondfix, flag = False},
  akt = ToFixed[datum];
  fi = FullMoonAfter[akt - 1];
  mondfix = calAkt[Floor[fi]];
  If[datum == mondfix, flag = True];
  flag]

FullMoonAfter[tee_] := LunarPhaseAfter[tee, FullLunar[]]

NewmoonQ[datum_] := 
 Module[{calAkt = Head[datum], akt, fi, mondfix, flag = False},
  akt = ToFixed[datum];
  fi = NewMoonAfter[akt - 1];
  mondfix = calAkt[Floor[fi]];
  If[datum == mondfix, flag = True];
  flag]
  
 yearRealzahl[tee_ (* in Weltzeit *)] := 
  Module[{dyntee, cal, zeit, erg },
    dyntee = WeltzeitInDynamisch[tee]; cal = dyntee[[1]]; 
   zeit = dyntee[[2]];
    erg = 
    cal[[1]] + (cal[[2]] - 1)/12 + cal[[3]]/365.25 + zeit[[1]]/8766 + 
     zeit[[2]]/525960 + zeit[[3]]/31557600;
   erg]
   
SonnenfinsternisTD[year_] := 
 Module[{neumonde, ereignis, kk, tt, ee, mm, ms, ff, abstandzu180, 
   omega, f1, a1, pp, qq, ww, gamma, uu, erg = {}},
  neumonde = NeumondGregorian[year]; 
  neumonde = Map[WeltzeitInDynamisch, neumonde];
  Do[ereignis = neumonde[[i]];
   kk = Floor[(yearRealzahl[ereignis] - 2000)*12.3685];
   tt = kk/1236.85;
   ee = 1 - 0.002516 tt - 0.0000074 tt^2 (* 47.6, 
   eccentrity of earth's orbit around the sun *);
   mm = 2.5534 + 29.10535670 kk - 0.0000014*tt*tt - 0.00000011 tt^3 (* 
   49.4 sun mean anomaly *); 
   ms = 201.5643 + 385.81693528 kk + 0.0107582 tt^2 + 
     0.00001238 tt^3 - 0.000000058 tt^4 (* 49.5 moons mean anomaly*); 
   ff  = 160.7108 + 390.67050284 kk - 0.0016118 tt^2 - 
     0.00000227 tt^3 + 0.000000011 tt^4 (* 
   49.6 moon argument for latitude*); 
   omega = 124.7746 - 1.56375588 kk + 0.0020672 tt^2 + 
     0.00000215 tt^3 (* 49.7 longitude of ascending node*);
   mm = Mod[mm, 360];
   ms = Mod[ms, 360];
   ff = Mod[ff, 360];
   omega = Mod[omega, 360];
   f1 = ff - 0.02665 Degree *Sin[omega Degree];
   a1 = 299.77 Degree + 0.107408 Degree kk - 0.009173 tt^2 ;
   pp = 0.2070 ee * Sin[mm Degree] + 0.0024 ee *Sin[2 mm Degree] - 
     0.0392*Sin[ms Degree] + 0.0116*Sin[2 ms Degree] - 
     0.0073 ee*Sin[(ms + mm) Degree ] + 0.0067 ee*Sin[ms - mm] + 
     0.0118*Sin[2 f1 Degree]; 
   qq = 5.2207 - 0.0048 ee*Cos[mm Degree] + 
     0.0020 ee*Cos[2 mm Degree] - 0.3299 Cos[ms Degree] - 
     0.0060 ee Cos[(ms + mm) Degree] + 
     0.0041 ee Cos[(ms - mm) Degree]; ww = Abs[Cos[f1 Degree]];
   gamma = (pp Cos[f1 Degree] + qq*Sin[f1 Degree])*(1 - 0.0048 ww);
   uu = 0.0059 + 0.0046 ee Cos[mm Degree] - 0.0182 Cos[ms Degree] + 
     0.0004 Cos[2 ms Degree] - 0.0005 Cos[(mm + ms) Degree];
   abstandzu180 = Abs[180 - ff];
   If[year > 1581,
    If[(abstandzu180 < 
        13.9) || ((abstandzu180 < 21) && (Abs[gamma] <= 1.5433 + uu)), 
     If[uu < 0, ereignis = Append[ereignis, "Total"], 
      ereignis = Append[ereignis, "Nichttotal"]];
     If[Length[ereignis] == 3, erg = Append[erg, ereignis]]] ,
    If[(abstandzu180 < 
        13.9) || ((abstandzu180 < 21) && (Abs[gamma] <= 
          1.5433 + uu)),
     Which[uu < 0 && i > 1, 
      ereignis = Append[neumonde[[i - 1]], "Total"], i > 1, 
      ereignis = Append[neumonde[[i - 1]], "Nichttotal"]];
     If[Length[ereignis] == 3, erg = Append[erg, ereignis]]]] , {i, 1,
     Length[neumonde]}];
  erg ]
  
  MondfinsternisTD[year_] := 
 Module[{vollmonde, ereignis, kk, tt, ee, mm, ms, ff, abstandzu180, 
   abstandzu360, omega, f1, a1, pp, qq, ww, gamma, uu, erg = {}},
  vollmonde = VollmondGregorian[year]; 
  vollmonde = Map[WeltzeitInDynamisch, vollmonde];
  Do[ereignis = vollmonde[[i]];
   kk = Floor[(yearRealzahl[ereignis] - 2000)*12.3685] + 0.5;
   tt = kk/1236.85;
   ee = 1 - 0.002516 tt - 0.0000074 tt^2 (* 47.6, 
   eccentrity of earth's orbit around the sun *);
   mm = 2.5534 + 29.10535670 kk - 0.0000014*tt*tt - 0.00000011 tt^3 (* 
   49.4 sun mean anomaly *);
   ms = 201.5643 + 385.81693528 kk + 0.0107582 tt^2 + 
     0.00001238 tt^3 - 0.000000058 tt^4 (* 49.5 moons mean anomaly*);
   ff  = 
    160.7108 + 390.67050284 kk - 0.0016118 tt^2 - 0.00000227 tt^3 + 
     0.000000011 tt^4 (* 49.6 moon argument for latitude*);
   omega = 
    124.7746 - 1.56375588 kk + 0.0020672 tt^2 + 0.00000215 tt^3 (* 
   49.7 longitude of ascending node*);
   mm = Mod[mm, 360];
   ms = Mod[ms, 360];
   ff = Mod[ff, 360];
   omega = Mod[omega, 360];
   f1 = ff - 0.02665 Degree *Sin[omega Degree];
   a1 = 299.77 Degree + 0.107408 Degree kk - 0.009173 tt^2 ;
   pp = 0.2070 ee * Sin[mm Degree] + 0.0024 ee *Sin[2 mm Degree] - 
     0.0392*Sin[ms Degree] + 0.0116*Sin[2 ms Degree] - 
     0.0073 ee*Sin[(ms + mm) Degree ] + 0.0067 ee*Sin[ms - mm] + 
     0.0118*Sin[2 f1 Degree];
   qq = 5.2207 - 0.0048 ee*Cos[mm Degree] + 
     0.0020 ee*Cos[2 mm Degree] - 0.3299 Cos[ms Degree] - 
     0.0060 ee Cos[(ms + mm) Degree] + 
     0.0041 ee Cos[(ms - mm) Degree]; ww = Abs[Cos[f1 Degree]];
   gamma = (pp Cos[f1 Degree] + qq*Sin[f1 Degree])*(1 - 0.0048 ww);
   uu = 0.0059 + 0.0046 ee Cos[mm Degree] - 0.0182 Cos[ms Degree] + 
     0.0004 Cos[2 ms Degree] - 0.0005 Cos[(mm + ms) Degree];
   abstandzu180 = Abs[180 - ff]; abstandzu360 = Abs[360 - ff];
   If[year > 1581,
    If[(abstandzu180 < 13.9) || (abstandzu360 < 
        13.9) || ((abstandzu180 < 21) && (Abs[gamma] <= 
          1.5433 + uu)) || ((abstandzu360 < 21) && (Abs[gamma] <= 
          1.5433 + uu)), 
     If[uu < 0, ereignis = Append[ereignis, "Total"], 
      ereignis = Append[ereignis, "Nichttotal"]];
     If[Length[ereignis] == 3, erg = Append[erg, ereignis]]] ,
    If[(abstandzu180 < 13.9) || (abstandzu360 < 
        13.9) || ((abstandzu180 < 21) && (Abs[gamma] <= 
          1.5433 + uu)) || ((abstandzu360 < 21) && (Abs[gamma] <= 
          1.5433 + uu)), 
     Which[uu < 0 && i > 1, 
      ereignis = Append[vollmonde[[i - 1]], "Total"], i > 1, 
      ereignis = Append[vollmonde[[i - 1]], "Nichttotal"]];
     If[Length[ereignis] == 3, erg = Append[erg, ereignis]]]] , {i, 1,
     Length[vollmonde]}];
  erg ] 
  
ggg[{g_,m_,s_}]:= Module[{sgn=1},
 If[g<0 || m<0 || s<0, sgn=-1];
 N[sgn*(Abs[g]+Abs[m]/60+Abs[s]/3600)]]

gms[gg_]:=Module[{g1,g,m,s},
 g1=Abs[gg]; g=Floor[g1];
 g1=(g1-g)*60; m=Floor[g1]; s=(g1-m)*60;
 If[gg<0, If[g != 0, g*=-1, If[m!=0, m*=-1, s*=-1]]];
 N[{g,m,s}]]

mjd[date_,hour_]:=DateDistanceC[Gregorian[1858,11,17],date]+hour/24 

unmjd[mjd_]:= Module[{b,d,f,jd,jd0,c,e,day,month,year,hour},
 jd=mjd+2400000.5; jd0=Round[jd];
 If[jd0<2299161, b=000000000000000000000000; c=jd0+1524,
  b=Floor[(jd0-1867216.25)/36524.25];
  c=jd0+(b-Floor[b/4])+1525];
 d=Floor[(c-122.1)/365.25];
 e=365d+Floor[d/4];
 f=Floor[(c-e)/30.6001];
 day=Floor[c-e+0.5]-Floor[30.6001f];
 month=f-1-12*Floor[f/14];
 year=d-4715-Floor[(7+month)/10];
 hour=24*(jd+0.5-jd0);
{Gregorian[year,month,day],hour}]

arctanC[y_, x_] := Module[{alpha = ArcTan[y/x]/Degree, erg},
  Which[x == 0  && y == 0, erg = Bogus,
   Mod[x/Degree, 360] == 0, erg =  Sign[y]*90 Degree,
   Mod[x/Degree, 360] > 0, erg = alpha,
   True, erg = alpha + 180 ];
  erg]
  
 DirectionC[location_, focus_] := 
 Module[{phi = location[[2]], psi = location[[3]], phiS = focus[[2]], 
   psiS = focus[[3]], y, x, erg},
  y = N[Sin[psiS Degree - psi Degree]]; 
   x = Cos[phi Degree]*Tan[phiS Degree] - 
    Sin[phi Degree]*Cos[psi Degree - psiS Degree]; 
   Which[((x == 0) && (y == 0) ) || (phiS == 90.0), erg = 0 Degree,
   phiS == -90, erg = 180 Degree,
   True, erg = arctanC[y, x]];
  erg] 



fixedDate[date_,hour_]:=
 First[ConvertDateTo[date,]]+hour/24;

julianisch[date_,hour_]:=N[fixedDate[date,hour]+1721424+1/2,20];

On[Syntax::com];


(*
;;;; Section: Gregorian Calendar

*)

SundayC[]	= 0
MondayC[]	= 1
TuesdayC[]	= 2
WednesdayC[]	= 3
ThursdayC[]	= 4
FridayC[]	= 5
SaturdayC[]	= 6


January[]	= 1
February[]	= 2
March[]		= 3
April[]		= 4
May[]		= 5
June[]		= 6
July[]		= 7
August[]	= 8
September[]	= 9
October[]	= 10
November[]	= 11
December[]	= 12



NameFromDayOfWeekC[DayOfWeekC_Integer, calendar_:Gregorian, encoding_:ASCII] :=
	NameFromNumber[DayOfWeekC + 1, DayOfWeekCNames[calendar, encoding]]


NameFromMonth[month_, calendar_:Gregorian, encoding_:ASCII] :=
	NameFromNumber[month, MonthNames[calendar, encoding]]



(** gregorian-epoch **)

GregorianEpoch[] = 1


(** gregorian-leap-year? **)

GregorianLeapYearQ[year_Integer] :=
	Mod[year, 4] == 0 && !MemberQ[{100, 200, 300}, Mod[year, 400]]


(** fixed-from-gregorian **)

ToFixed[date_?GregorianQ] :=
	Module[{month = CMonth[date], year = CYear[date]},
		(GregorianEpoch[] - 1)
		+ 365 (year - 1)
		+ Quotient[year - 1, 4] 
		- Quotient[year - 1, 100]
		+ Quotient[year - 1, 400]
		+ Quotient[367 month - 362, 12]
		+ If[month <= 2, 0,
			If[GregorianLeapYearQ[year], -1, -2]]
		+ CDay[date]
	]


(** gregorian-year-from-fixed **)

GregorianYearFromFixed[date_] :=
	Module[{l0, n400, d1, n100, d2, n4, d3, n1, year},
		l0 = date - GregorianEpoch[];
		n400 = Quotient[l0, 146097];
		d1 = Mod[l0, 146097];
		n100 = Quotient[d1, 36524];
		d2 = Mod[d1, 36524];
		n4 = Quotient[d2, 1461];
		d3 = Mod[d2, 1461];
		n1 = Quotient[d3, 365];
		year = 400 n400 + 100 n100 + 4 n4 + n1;
		If[n100 == 4 || n1 == 4, year, year + 1]
	]


(** gregorian-from-fixed **)

Gregorian[date_Integer] :=
	Module[{year, priorDays, correction, month, day},
		year = GregorianYearFromFixed[date];
		priorDays = date - ToFixed[ Gregorian[year, January[], 1] ];
		correction = If[
			date < ToFixed[ Gregorian[year, March[], 1] ],
				0,
				If[ GregorianLeapYearQ[year], 1, 2]
		];
		month = Quotient[12 (priorDays + correction) + 373, 367];
		day = date - ToFixed[ Gregorian[year, month, 1] ] + 1;
		Gregorian[year, month, day]
	]


GregorianNewYear[gyear_Integer] := ToFixed[Gregorian[gyear, 1, 1]]

GregorianYearEnd[gyear_Integer] := ToFixed[Gregorian[gyear, 12, 31]]

GregorianYearRange[gyear_Integer] := {GregorianNewYear[gyear], 
  GregorianYearEnd[gyear]}


(** day-number **)

DayNumber[] = {Gregorian}

DayNumber[date_?GregorianQ] :=
	DateDistanceC[Gregorian[CYear[date] - 1, December[], 31], date]


(** days-remaining **)

DaysRemaining[] = {Gregorian}

DaysRemaining[date_?GregorianQ] :=
	DateDistanceC[date, Gregorian[CYear[date], December[], 31]]


(** alt-fixed-from-gregorian **)

AltFixedFromGregorian[date_?GregorianQ] :=
	Module[{month, d, year, m, y},
		month = CMonth[date];
		day = CDay[date];
		year = CYear[date];
		m = AdjustedMod[month - 2, 12];
		y = year + Quotient[month + 9, 12];
		(GregorianEpoch[] - 1)
		- 306
		+ 365 (y - 1)
		+ Quotient[y - 1, 4]
		- Quotient[y - 1, 100]
		+ Quotient[y - 1, 400]
		+ Quotient[3 m - 1, 5]
		+ 30 (m - 1)
		+ day
	]


(** alt-gregorian-from-fixed **)

AltGregorianFromFixed[date_Integer] :=
	Module[{y, priorDays, month, year, day},
		y = GregorianYearFromFixed[(GregorianEpoch[] - 1) + date + 306];
		priorDays = date - ToFixed[Gregorian[y - 1, 3, 1]];
		month = AdjustedMod[Quotient[5 priorDays + 155, 153] + 2, 12];
		year = y - Quotient[month + 9, 12];
		day = 1 + date - ToFixed[Gregorian[year, month, 1]];
		Gregorian[year, month, day]
	]


(** alt-gregorian-year-from-fixed **)

AltGregorianYearFromFixed[date_] :=
	Module[{approx, start},
		approx = Quotient[date - GregorianEpoch[] + 2, 146097/400];
		start = GregorianEpoch[]
			+ 365 approx
			+ Quotient[approx, 4]
			- Quotient[approx, 100]
			+ Quotient[approx, 400];
		If[date < start, approx, approx + 1]
	]


(** independence-day **)

IndependenceDay[gYear_] :=
	ToFixed[Gregorian[gYear, July[], 4]];


(** kday-on-or-before **)

KDayOnOrBefore[date_, k_] :=
	date - DayOfWeekCFromFixed[date - k]


(** kday-on-or-after **)

KDayOnOrAfter[date_, k_] :=
	KDayOnOrBefore[date + 6, k]


(** kday-nearest **)

KDayNearest[date_, k_] :=
	KDayOnOrBefore[date + 3, k]


(** kday-after **)

KDayAfter[date_, k_] :=
	KDayOnOrBefore[date + 7, k]


(** kday-before **)

KDayBefore[date_, k_] :=
	KDayOnOrBefore[date - 1, k]


(** nth-kday **)

NthKDay[n_, k_, gDate_] :=
	If[n > 0,	KDayBefore[ToFixed[gDate], k] + 7 n,
				KDayAfter[ToFixed[gDate], k] + 7 n]


(** first-kday **)

FirstKDay[k_, gDate_] :=
	NthKDay[1, k, gDate]


(** last-kday **)

LastKDay[k_, gDate_] :=
	NthKDay[-1, k, gDate]


(** labor-day **)

LaborDay[gYear_] :=
	FirstKDay[MondayC[], Gregorian[gYear, September[], 1]]


(** memorial-day **)

MemorialDay[gYear_] :=
	LastKDay[MondayC[], Gregorian[gYear, May[], 31]]


(** election-day **)

ElectionDay[gYear_] :=
	FirstKDay[TuesdayC[], Gregorian[gYear, November[], 2]]


(** daylight-saving-start **)

DaylightSavingStart[gYear_] :=
	FirstKDay[SundayC[], Gregorian[gYear, April[], 1]]


(** daylight-saving-end **)

DaylightSavingEnd[gYear_] :=
	LastKDay[SundayC[], Gregorian[gYear, October[], 31]]


(** christmas **)

Christmas[gYear_] :=
	ToFixed[Gregorian[gYear, December[], 25]]


(** advent **)

Advent[gYear_] :=
	KDayNearest[ToFixed[Gregorian[gYear, November[], 30]], SundayC[]]


(** epiphany **)

Epiphany[year_] :=
	FirstKDay[SundayC[], Gregorian[year, January[], 2]]


Format[date_Gregorian] :=
	If[GregorianQ[date],
		StringForm["``, `` `` ``",
		  	NameFromDayOfWeekC[ToFixed[date]],
		    CDay[date],
		    NameFromMonth[CMonth[date]],
		    CYear[date]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: Julian Calendar

  888888          888 d8b                   
    "88b          888 Y8P                   
     888          888                       
     888 888  888 888 888  8888b.  88888b.  
     888 888  888 888 888     "88b 888 "88b 
     888 888  888 888 888 .d888888 888  888 
     88P Y88b 888 888 888 888  888 888  888 
     888  "Y88888 888 888 "Y888888 888  888 
   .d88P                                    
 .d88P"                                     
888P"                                       

*)


(** julian-epoch **)

JulianEpoch[] = ToFixed[Gregorian[0, December[], 30]]


(** bce **)

BCE[n_] := - n


(** ce **)

CE[n_] := n


(** julian-leap-year? **)

JulianLeapYearQ[jyear_] :=
	Mod[jyear, 4] == If[jyear > 0, 0, 3]


(** fixed-from-julian **)

ToFixed[date_?JulianQ] :=
	Module[{month, day, year, y},
		month = CMonth[date];
		day = CDay[date];
		year = CYear[date];
		y = If[year < 0, year + 1, year];
		JulianEpoch[] - 1
		+ 365 (y - 1)
		+ Quotient[y - 1, 4]
		+ Quotient[367 month - 362, 12]
		+ If[month <= 2, 0,
			If[JulianLeapYearQ[year], -1, -2]]
		+ day
	]


(** julian-from-fixed **)

Julian[date_Integer] :=
	Module[{approx, year, priorDays, correction, month},
		approx = Quotient[4 (date - JulianEpoch[]) + 1464, 1461];
		year = If[approx <= 0, approx - 1, approx];
		priorDays = date - ToFixed[Julian[year, January[], 1]];
		correction = If[date < ToFixed[Julian[year, March[], 1]], 0, If[JulianLeapYearQ[year], 1, 2]];
		month = Quotient[12 (priorDays + correction) + 373, 367];
		day = date - ToFixed[Julian[year, month, 1]] + 1;
		Julian[year, month, day]
	]


(** julian-in-gregorian **)

JulianInGregorian[jMonth_, jDay_, gYear_] :=
	Module[{jan1, dec31, y, date1, date2, result},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		dec31 = ToFixed[Gregorian[gYear, December[], 31]];
		y = CYear[Julian[jan1]];
		yPrime = If[y == -1, 1, y + 1];
		date1 = ToFixed[Julian[y, jMonth, jDay]];
		date2 = ToFixed[Julian[yPrime, jMonth, jDay]];
		result = {};
		If[jan1 <= date1 <= dec31, result = Append[result, date1]];
		If[jan1 <= date2 <= dec31, result = Append[result, date2]];
		result
	]


(** eastern-orthodox-christmas **)

EasternOrthodoxChristmas[gYear_] :=
	JulianInGregorian[December[], 25, gYear]


Format[date_Julian]:=
	If[JulianQ[date],
		StringForm["`` `` `` ``", 
			CDay[date], 
			NameFromMonth[CMonth[date]], 
			If[CYear[date] < 0, -CYear[date], CYear[date]],
			If[CYear[date] < 0, "B.C.E.", "C.E."]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: Ecclesiastical Calendars

8888888888                   888                   d8b                   888    d8b                   888 
888                          888                   Y8P                   888    Y8P                   888 
888                          888                                         888                          888 
8888888     .d8888b  .d8888b 888  .d88b.  .d8888b  888  8888b.  .d8888b  888888 888  .d8888b  8888b.  888 
888        d88P"    d88P"    888 d8P  Y8b 88K      888     "88b 88K      888    888 d88P"        "88b 888 
888        888      888      888 88888888 "Y8888b. 888 .d888888 "Y8888b. 888    888 888      .d888888 888 
888        Y88b.    Y88b.    888 Y8b.          X88 888 888  888      X88 Y88b.  888 Y88b.    888  888 888 
8888888888  "Y8888P  "Y8888P 888  "Y8888   88888P' 888 "Y888888  88888P'  "Y888 888  "Y8888P "Y888888 888 

*)


(** orthodox-easter **)

OrthodoxEaster[gYear_] :=
	Module[{shiftedEpact, jYear, paschalMoon},
		shiftedEpact = Mod[14 + 11 Mod[gYear, 19], 30];
		jYear = If[gYear > 0, gYear, gYear - 1];
		paschalMoon = ToFixed[Julian[jYear, April[], 19]] - shiftedEpact;
		KDayAfter[paschalMoon, SundayC[]]
	]


(** alt-orthodox-easter **)

AltOrthodoxEaster[gYear_] :=
	Module[{paschalMoon},
		paschalMoon = 354 gYear
			+ 30 * Quotient[(7 gYear) + 8, 19]
			+ Quotient[gYear, 4]
			- Quotient[gYear, 19]
			- 272;
		KDayAfter[paschalMoon, SundayC[]]
	]


(** easter **)

Easter[gYear_] :=
	Module[{century, shiftedEpact, adjustedEpact, paschalMoon},
		century = 1 + Quotient[gYear, 100];
		shiftedEpact = Mod[14
							+ 11 Mod[gYear, 19]
							- Quotient[3 century, 4]
							+ Quotient[5 + 8 century, 25],
						30];
		adjustedEpact = If[shiftedEpact == 0 || (shiftedEpact == 1 && 10 < Mod[gYear, 19]), shiftedEpact + 1, shiftedEpact];
		paschalMoon = ToFixed[Gregorian[gYear, April[], 19]] - adjustedEpact;
		KDayAfter[paschalMoon, SundayC[]]
	]


(** pentecost **)

Pentecost[gYear_] :=
	Easter[gYear] + 49


(*
;;;; Section: Islamic Calendar

8888888          888                        d8b          
  888            888                        Y8P          
  888            888                                     
  888   .d8888b  888  8888b.  88888b.d88b.  888  .d8888b 
  888   88K      888     "88b 888 "888 "88b 888 d88P"    
  888   "Y8888b. 888 .d888888 888  888  888 888 888      
  888        X88 888 888  888 888  888  888 888 Y88b.    
8888888  88888P' 888 "Y888888 888  888  888 888  "Y8888P 

*)


(** islamic-epoch **)

IslamicEpoch[] = ToFixed[Julian[CE[622], July[], 16]]


(** islamic-leap-year? **)

IslamicLeapYearQ[iYear_] :=
	Mod[11 iYear + 14, 30] < 11


(** fixed-from-islamic **)

ToFixed[date_?IslamicQ] :=
	Module[{year, month},
		year = CYear[date];
		month = CMonth[date];
		CDay[date]
		+ 29 (month - 1)
		+ Quotient[(6 month) - 1, 11]
		+ (year - 1) 354
		+ Quotient[3 + 11 year, 30]
		+ IslamicEpoch[] - 1
	]


(** islamic-from-fixed **)

Islamic[date_Integer] :=
	Module[{year, month, day, priorDays},
		year = Quotient[30 (date - IslamicEpoch[]) + 10646, 10631];
		priorDays = date - ToFixed[Islamic[year, 1, 1]];
		month = Quotient[11 priorDays + 330, 325];
		day = 1 + date - ToFixed[Islamic[year, month, 1]];
		Islamic[year, month, day]
	]


(** islamic-in-gregorian **)

IslamicInGregorian[iMonth_, iDay_, gYear_] :=
	Module[{jan1, dec31, y, date1, date2, date3, result},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		dec31 = ToFixed[Gregorian[gYear, December[], 31]];
		y = CYear[Islamic[jan1]];
		date1 = ToFixed[Islamic[y,     iMonth, iDay]];
		date2 = ToFixed[Islamic[y + 1, iMonth, iDay]];
		date3 = ToFixed[Islamic[y + 2, iMonth, iDay]];
		result = {};
		If[jan1 <= date1 <= dec31, result = Append[result, date1]];
		If[jan1 <= date2 <= dec31, result = Append[result, date2]];
		If[jan1 <= date3 <= dec31, result = Append[result, date3]];
		result
	]


(** mawlid-an-nabi **)

MawlidAnNabi[gYear_] :=
	IslamicInGregorian[3, 12, gYear]


(** asr **)

Asr[date_Integer, locale_Location] :=
	Module[{noon, phi, delta, altitude, h},
		noon = UniversalFromStandard[Midday[date, locale], locale];
		phi = CLatitude[locale];
		delta = ArcSinDegreesC[SinDegreesC[Obliquity[noon]] SinDegreesC[SolarLongitudeC[noon]]];
		altitude = ArcSinDegreesC[SinDegreesC[phi] SinDegreesC[delta] + CosDegreesC[phi] CosDegreesC[delta]];
		h = ArcTanDegreesC[TanDegreesC[altitude] / (1 + 2 TanDegreesC[altitude]), 1];
		Dusk[date, locale, -h];
	]


DayOfWeekCNames[Islamic, ASCII] = {
	"yaum al-ahad", 
	"yaum al-ithnayna", 
	"yaum ath-thalatha'", 
	"yaum al-arba`a'", 
	"yaum al-hamis", 
	"yaum al-jum`a", 
	"yaum as-sabt"}


MonthNames[Islamic, ASCII] = {
	"Muharram",
	"Safar",
	"Rabi I",
	"Rabi II",
	"Jumada I",
	"Jumada II",
	"Rajab",
	"Sha`ban",
	"Ramadan",
	"Shawwal",
	"Dhu al-Qa`da",
	"Dhu al-Hijja"}


Format[date_Islamic]:=
	If[IslamicQ[date],
		StringForm["``, `` `` `` A.H.",
			NameFromDayOfWeekC[ToFixed[date], Islamic], 
			CDay[date],
			NameFromMonth[CMonth[date], Islamic],
			CYear[date]
		],
		ToString[InputForm[date]]
	]

  
(*
;;;; Section: Old Hindu Calendars

 .d88888b.  888      888     888    888 d8b               888          
d88P" "Y88b 888      888     888    888 Y8P               888          
888     888 888      888     888    888                   888          
888     888 888  .d88888     8888888888 888 88888b.   .d88888 888  888 
888     888 888 d88" 888     888    888 888 888 "88b d88" 888 888  888 
888     888 888 888  888     888    888 888 888  888 888  888 888  888 
Y88b. .d88P 888 Y88b 888     888    888 888 888  888 Y88b 888 Y88b 888 
 "Y88888P"  888  "Y88888     888    888 888 888  888  "Y88888  "Y88888 

*)


(** hindu-epoch **)

HinduEpoch[] = ToFixed[Julian[BCE[3102], February[], 18]]


(** hindu-day-count **)

HinduDayCount[date_] :=
	date - HinduEpoch[]


(** arya-solar-year **)

AryaSolarYear[] = 1577917500/4320000


(** arya-solar-month **)

AryaSolarMonth[] = AryaSolarYear[] / 12


(** old-hindu-solar-from-fixed **)

OldHinduSolar[date_Integer] :=
	Module[{sun, year, month, day},
		sun = HinduDayCount[date] + 1/4;
		year = Quotient[sun, AryaSolarYear[]];
		month = 1 + Mod[Quotient[sun, AryaSolarMonth[]], 12];
		day = 1 + Floor[Mod[sun, AryaSolarMonth[]]];
		OldHinduSolar[year, month, day]
	]


(** fixed-from-old-hindu-solar **)

ToFixed[date_?OldHinduSolarQ] :=
	Ceiling[
		HinduEpoch[] +
		CYear[date] AryaSolarYear[] +
		(CMonth[date] - 1) AryaSolarMonth[] +
		CDay[date] - 5/4
	]


(** arya-lunar-month **)

AryaLunarMonth[] = 1577917500/53433336


(** arya-lunar-day **)

AryaLunarDay[] = AryaLunarMonth[] / 30


(** old-hindu-lunar-leap-year? **)

OldHinduLunarLeapYearQ[lYear_] :=
	Mod[lYear AryaSolarYear[] - AryaSolarMonth[], AryaLunarMonth[]] >=
		23902504679/1282400064


(** old-hindu-lunar-from-fixed **)

OldHinduLunar[date_Integer] :=
	Module[{sun, newMoon, leap, month, day, year},
		sun = HinduDayCount[date] + 1/4;
		newMoon = sun - Mod[sun, AryaLunarMonth[]];
		leap = AryaSolarMonth[] - AryaLunarMonth[] >= Mod[newMoon, AryaSolarMonth[]] &&
			Mod[newMoon, AryaSolarMonth[]] > 0;
		month = 1 + Mod[Ceiling[newMoon / AryaSolarMonth[]], 12];
		day = 1 + Mod[Quotient[sun, AryaLunarDay[]], 30];
		year = Ceiling[(newMoon + AryaSolarMonth[]) / AryaSolarYear[]] - 1;
		OldHinduLunar[year, month, leap, day]
	]


(** fixed-from-old-hindu-lunar **)

ToFixed[date_?OldHinduLunarQ] :=
	Module[{month, mina, lunarNewYear},
		month = CMonth[date];
		mina = (12 CYear[date] - 1) AryaSolarMonth[];
		lunarNewYear = AryaLunarMonth[] (Quotient[mina, AryaLunarMonth[]] + 1);
		Floor[
			HinduEpoch[] +
			lunarNewYear +
			AryaLunarMonth[] If[!CLeapMonth[date] &&
					Ceiling[(lunarNewYear - mina) / (AryaSolarMonth[] - AryaLunarMonth[])] <= month,
						month, month - 1] +
			(CDay[date] - 1) AryaLunarDay[] +
			3/4
		]
	]


(** arya-jovian-period **)

AryaJovianPeriod[] = 1577917500/364224


(** jovian-year **)

JovianYear[date_Integer] :=
	Mod[Quotient[HinduDayCount[date], AryaJovianPeriod[] / 12], 60] + 1


MonthNames[OldHinduLunar, ASCII] = {
	"Chaitra",
	"Vaisakha",
	"Jyaishtha",
	"Ashadha",
	"Sravana",
	"Bhadrapada",
	"Asvina",
	"Kartika",
	"Margasirsha",
	"Pausha",
	"Magha",
	"Phalguna"}


DayOfWeekCNames[OldHinduLunar, ASCII] = {
	"Ravivara", 
	"Chandravara", 
	"Mangalavara", 
	"Buddhavara", 
	"Brihaspatvara", 
	"Sukravara", 
	"Sanivara"}


MonthNames[OldHinduSolar, ASCII] = {
	"Mesha",
	"Vrishabha",
	"Mithuna",
	"Karka",
	"Simha",
	"Kanya",
	"Tula",
	"Vrischika",
	"Dhanu",
	"Makara",
	"Kumbha",
	"Mina"}


DayOfWeekCNames[OldHinduSolar, ASCII] = {
	"Ravivara", 
	"Chandravara", 
	"Mangalavara", 
	"Buddhavara", 
	"Brihaspatvara", 
	"Sukravara", 
	"Sanivara"}


Format[date_OldHinduSolar] :=
	If[OldHinduSolarQ[date],
		StringForm["``, `` `` `` K.Y.",
			NameFromDayOfWeekC[ToFixed[date], OldHinduSolar],
			CDay[date],
			NameFromNumber[CMonth[date], MonthNames[OldHinduSolar, ASCII]],
			CYear[date]
		],
		ToString[InputForm[date]]
	]


Format[date_OldHinduLunar]:=
	If[OldHinduLunarQ[date],
		StringForm["``, `` ```` `` K.Y.",
			NameFromDayOfWeekC[ToFixed[date], OldHinduLunar],
			CDay[date],
			NameFromNumber[CMonth[date], MonthNames[OldHinduLunar, ASCII]],
			If[CLeapMonth[date], " II", ""],
			CYear[date]
		],
		ToString[InputForm[date]]
	]



(*
;;;; Section: Time and Astronomy

*)


(** hr **)

Hr[x_] :=
	x / 24


(** mt **)

Mt[x_] :=
	x


(** deg **)

Deg[x_] :=
	x


(** angle **)

Angle[d_, m_, s_] :=
	d + (m + s / 60) / 60


(** degrees **)

Degrees[theta_] :=
	Mod[theta, 360]


(** radians-to-degrees **)

RadiansToDegrees[theta_] :=
	Degrees[theta / Pi 180]


(** degrees-to-radians **)

DegreesToRadians[theta_] :=
	Degrees[theta] Pi / 180


(** sin-degrees **)

SinDegreesC[theta_] :=
	Sin[DegreesToRadians[theta]]


(** cosine-degrees **)

CosDegreesC[theta_] :=
	Cos[DegreesToRadians[theta]]


(** tangent-degrees **)

TanDegreesC[theta_] :=
	Tan[DegreesToRadians[theta]]


(** arctan-degrees **)

ArcTanDegreesC[x_, quad_] :=
	Module[{alpha},
		alpha = RadiansToDegrees[ArcTan[x]];
		Mod[If[quad == 1 || quad == 4, alpha, alpha + Deg[180]], 360]
	]


(** arcsin-degrees **)

ArcSinDegreesC[x_] :=
	RadiansToDegrees[Re[ArcSin[x]]]


(** arccos-degrees **)

ArcCosDegreesC[x_] :=
	RadiansToDegrees[Re[ArcCos[x]]]


Location[] = {CPlaceName, CLatitude, CLongitude, CElevation, CZone}


LocationQ[locale_] :=
	MatchQ[locale, Location[_String, _?NumberQ, _?NumberQ, _?NumberQ, _?NumberQ]]


(** latitude **)
(** longitude **)
(** elevation **)
(** zone **)

CPlaceName[locale_Location]	^:= locale[[1]]
CLatitude[locale_Location]	^:= locale[[2]]
CLongitude[locale_Location]	^:= locale[[3]]
CElevation[locale_Location]	^:= locale[[4]]
CZone[locale_Location]		^:= locale[[5]]

Greenwich[] = Location["Greenwich, UK", 51.4777815, 0.0, Mt[46.9], 0]

Hamburg[] = 
 Location["Hamburg, Germany", Deg[53.55], Deg[10], Mt[40], 1]

Urbana[] = Location["Urbana, IL, USA", 40.1, -88.2, Mt[225], -6]

LosAngeles[] = Location["Los Angeles, CA, USA", Angle[34, 4, 0], -Angle[118, 15, 0], Mt[0], -8]

Format[locale_Location]:=
	If[LocationQ[locale],
		StringForm["``: lat. `` ``, long. `` ``, elev. ``, zone ``",
			CPlaceName[locale],
			NumberForm[N[Abs[CLatitude[locale]]], {5, 3}],
			If[Sign[CLatitude[locale]] >= 0, "N", "S"],
			NumberForm[N[Abs[CLongitude[locale]]], {5, 3}],
			If[Sign[CLongitude[locale]] >= 0, "E", "W"],
			CElevation[locale],
			NumberForm[N[CZone[locale]], {4, 2}]
		],
		ToString[InputForm[date]]
	]


(** mecca **)

Mecca[] = Location["Mecca, Saudi Arabia", Angle[21, 25, 24], Angle[39, 49, 24], Mt[1000], 2]

(** direction **)

MDirection[locale_Location, focus_Location] :=
	Modele[{phi, phiPrime, psi, psiPrime, denom},
		phi = CLatitude[locale];
		phiPrime = CLatitude[focus];
		psi = CLongitude[locale];
		psiPrime = CLongitude[focus];
		denom = CosDegreesC[phi] TanDegreesC[phiPrime] - SinDegreesC[phi] CosDegreesC[psi - psiPrime];
		If[denom == 0,
			0,
			Mod[ArcTanDegreesC[
				SinDegreesC[psiPrime - psi] / denom,
				If[denom < 0, 2, 1]
				]
			,360]
		]
	]


(** time-from-moment **)


TimeOfDay[] = {CHour, CMinute, CSecond}


CHour[time_TimeOfDay]	:= time[[1]]
CMinute[time_TimeOfDay]	:= time[[2]]
CSecond[time_TimeOfDay] := time[[3]]


TimeOfDay[tee_] :=
	Module[{hour, minute, second},
		hour = Floor[Mod[tee 24, 24]];
		minute = Floor[Mod[tee 24 60, 60]];
		second = Mod[tee 24 60 60, 60];
		TimeOfDay[hour, minute, second]
	]


TimeOfDayQ[time_] :=
	MatchQ[time, TimeOfDay[_Integer, _Integer, _?NumberQ]]


PadTime[n_Integer] :=
	If[n < 10, "0", ""] <> ToString[n]
	

Format[time_TimeOfDay]:=
	If[TimeOfDayQ[time],
		Module[{modHour, hour, second},
			modHour = Mod[CHour[time], 12];
			hour = If[modHour == 0, 12, modHour];
			PadTime[hour] <> ":" <>
			PadTime[CMinute[time]] <> ":" <>
			PadTime[Floor[CSecond[time]]] <> " " <>
			If[Mod[CHour[time], 24] < 12, "A.M.", "P.M."]
		],
		ToString[InputForm[time]]
	]


ToMoment[time_TimeOfDay] :=
	CHour[time] / 24 + CMinute[time] / (24 60) + CSecond[time] / (24 60 60)


(** standard-from-universal **)

StandardFromUniversal[teeU_, locale_Location] :=
	teeU + CZone[locale] / 24


(** universal-from-standard **)

UniversalFromStandard[teeS_, locale_Location] :=
	teeS - CZone[locale] / 24


(** local-from-universal **)

LocalFromUniversal[teeU_, locale_Location] :=
	teeU + CLongitude[locale] / Deg[360]


(** universal-from-local **)

UniversalFromLocal[teeEll_, locale_Location] :=
	teeEll - CLongitude[locale] / Deg[360]


(** standard-from-local **)

StandardFromLocal[teeEll_, locale_Location] :=
	StandardFromUniversal[UniversalFromLocal[teeEll, locale], locale]


(** local-from-standard **)

LocalFromStandard[teeS_, locale_Location] :=
	LocalFromUniversal[UniversalFromStandard[teeS, locale], locale]


(** midday **)

Midday[date_Integer, locale_Location] :=
	StandardFromLocal[LocalFromApparent[date + Hr[12]], locale]


(** midnight **)

Midnight[date_Integer, locale_Location] :=
	StandardFromLocal[LocalFromApparent[date], locale]


(** julian-centuries **)

JulianCenturies[tee_] :=
	(DynamicalFromUniversal[tee] - J2000[]) / 36525


(** obliquity **)

Obliquity[tee_] :=
	Module[{c},
		c = JulianCenturies[tee];
		Angle[23, 26, 21.448] + PolyC4[c, CoeffObliquity]
	]
CoeffObliquity = {0, Angle[0, 0, -46.8150], Angle[0, 0, -0.00059], Angle[0, 0, 0.001813]}


(** moment-from-depression **)

MomentFromDepression[approx_, locale_Location, alpha_] :=
	Module[{phi, tee, delta, morning, sineOffset, offset},
		phi = CLatitude[locale];
		tee = UniversalFromLocal[approx, locale];
		delta = ArcSinDegreesC[SinDegreesC[Obliquity[tee]] SinDegreesC[SolarLongitudeC[tee]]];
		morning = Mod[approx, 1] < 0.5;
		sineOffset = TanDegreesC[phi] TanDegreesC[delta] +
			SinDegreesC[alpha] / (CosDegreesC[delta] CosDegreesC[phi]);
		offset = Mod[0.5 + ArcSinDegreesC[sineOffset] / Deg[360], 1] - 0.5;
		If[Abs[sineOffset] <= 1,
			LocalFromApparent[Floor[approx] + 
				If[morning,
					.25 - offset,
					.75 + offset
				]
			]
		,
			Bogus
		]
	]


(** dawn **)

Dawn[date_Integer, locale_Location, alpha_] :=
	Module[{approx, result},
		approx = MomentFromDepression[date + .25, locale, alpha];
		result = MomentFromDepression[If[approx === Bogus, date, approx], locale, alpha];
		If[result === Bogus,
			Bogus,
			StandardFromLocal[result, locale]
		]
	]


(** dusk **)

Dusk[date_Integer, locale_Location, alpha_] :=
	Module[{approx, result},
		approx = MomentFromDepression[date + .75, locale, alpha];
		result = MomentFromDepression[If[approx === Bogus, date + .99, approx], locale, alpha];
		If[result === Bogus,
			Bogus,
			StandardFromLocal[result, locale]
		]
	]


(** sunrise **)

SunriseC[date_Integer, locale_Location] :=
	Module[{h, capR, dip, alpha},
		h = Max[0, CElevation[locale]];
		capR = Mt[6.372 10^6];
		dip = ArcCosDegreesC[capR / (capR + h)];
		alpha = Angle[0, 50, 0] + dip;
		Dawn[date, locale, alpha]
	]


(** sunset **)

SunsetC[date_Integer, locale_Location] :=
	Module[{h, capR, dip, alpha},
		h = Max[0, CElevation[locale]];
		capR = Mt[6.372 10^6];
		dip = ArcCosDegreesC[capR / (capR + h)];
		alpha = Angle[0, 50, 0] + dip;
		Dusk[date, locale, alpha]
	]


Sonnenaufgang[datum_, ort_] := 
 FractionalPart[SunriseC[ToFixed[datum], ort]]*24  

Sonnenuntergang[datum_, ort_] :=
 FractionalPart[SunsetC[ToFixed[datum], ort] ]*24
 
fruehesterSonnenuntergang[jahr_, ort_] :=
  Module[{tag = Gregorian[jahr, 12, 21], 
    erg = {21, Sonnenuntergang[Gregorian[jahr, 12, 21], ort]}, akt},
   Do[tag = DaysPlusC[tag, -1]; akt = {tag, Sonnenuntergang[tag, ort]};
    If[ akt[[2]] < erg[[2]], erg = akt, Break[] ], {i, 1, 100}];
   Print["Der früheste Sonnenuntergang in ", ort, " im Jahr ", jahr, 
    " findet am ", erg[[1]], " statt"];
   Print[" und zwar um ", gms[erg[[2]]], " Uhr lokaler Zeit"];
   erg[[1]]]
   
fruehesterSonnenaufgang[jahr_, ort_] :=
  Module[{tag = Gregorian[jahr, 6, 21], 
    erg = {21, Sonnenaufgang[Gregorian[jahr, 6, 21], ort]}, akt},
   Do[tag = DaysPlusC[tag, -1]; akt = {tag, Sonnenaufgang[tag, ort]};
    If[ akt[[2]] < erg[[2]], erg = akt, Break[] ], {i, 1, 100}];
   Print["Der früheste Sonnenaufgang in ", ort, " im Jahr ", jahr, 
    " findet am ", erg[[1]], " statt"];
   Print[" und zwar um ", gms[erg[[2]]], " Uhr lokaler Zeit"];
   erg[[1]]]
   
spaetesterSonnenaufgang[jahr_, ort_] :=
  Module[{tag = Gregorian[jahr, 12, 21], erg, akt},
   erg = {tag, Sonnenaufgang[Gregorian[jahr, 12, 21], ort]};
   Do[tag = DaysPlusC[tag, 1]; akt = {tag, Sonnenaufgang[tag, ort]};
    If[ akt[[2]] > erg[[2]], erg = akt, Break[] ], {i, 1, 100}];
   Print["Der späteste Sonnenaufgang in ", ort, " im Jahr ", jahr, 
    " findet am ", erg[[1]], " statt"];
   Print[" und zwar um ", gms[erg[[2]]], " Uhr lokaler Zeit"];
  erg[[1]] ]
  
spaetesterSonnenuntergang[jahr_, ort_] :=
  Module[{tag = Gregorian[jahr, 6, 21], erg, akt},
   erg = {tag, Sonnenuntergang[Gregorian[jahr, 6, 21], ort]};
   Do[tag = DaysPlusC[tag, 1]; 
    akt = {tag, Sonnenuntergang[tag, ort]};
    If[ akt[[2]] > erg[[2]], erg = akt, Break[] ], {i, 1, 100}];
   Print["Der späteste Sonnenuntergang in ", ort, " im Jahr ", jahr, 
    " findet am ", erg[[1]], " statt"];
   Print[" und zwar um ", gms[erg[[2]]], " Uhr lokaler Zeit"];
   erg[[1]]];

(** universal-from-dynamical **)

UniversalFromDynamical[tee_] :=
	tee - EphemerisCorrection[tee]

(** dynamical-from-universal **)

DynamicalFromUniversal[tee_] :=
	tee + EphemerisCorrection[tee]
	
WeltzeitInDynamisch[utc_] := 
  Module[{datum, uhrzeit, weltzeit, dynzeit, fz, datneu, uhrneu},
   datum = ToFixed[utc[[1]]]; uhrzeit = ggg[utc[[2]]]/24;
    weltzeit = datum + uhrzeit;
   dynzeit = DynamicalFromUniversal[weltzeit]; fz = Floor[dynzeit]; 
   uhrneu = TimeOfDay[dynzeit - fz] /. TimeOfDay -> List;
   If[fz > 577735, datneu = Gregorian[fz], datneu = Julian[fz]];
   {datneu, uhrneu}]
   
DynamischInWeltzeit[dyn_] := 
 Module[{datum, uhrzeit, weltzeit, dynzeit, fz, datneu, uhrneu},
  datum = ToFixed[dyn[[1]]]; uhrzeit = ggg[dyn[[2]]]/24;
   dynzeit = datum + uhrzeit;
  weltzeit = UniversalFromDynamical[dynzeit]; fz = Floor[weltzeit]; 
  uhrneu = TimeOfDay[weltzeit - fz] /. TimeOfDay -> List;
  If[fz > 577735, datneu = Gregorian[fz], datneu = Julian[fz]];
  {datneu, uhrneu}]
	
(** j2000 **)

J2000[] = Hr[12] + ToFixed[Gregorian[2000, January[], 1]]


(** sidereal-from-moment **)

SiderealFromMoment[tee_] :=
	Module[{c, siderealCoeff},
		c = (tee - J2000[]) / 36525;
		Mod[PolyC4[c, SFMSiderealCoeff], 360]
	]
SFMSiderealCoeff = Deg[{280.46061837, 36525 * 360.98564736629, 0.000387933, 1/38710000}]


(** mean-tropical-year **)

MeanTropicalYear[] = 365.242189


(** mean-synodic-month **)

MeanSynodicMonth[] = 29.530588853


(** ephemeris-correction **)

EphemerisCorrection[tee_] :=
	Module[{year, c, x},
		year = GregorianYearFromFixed[Floor[tee]];
		c = DateDistanceC[Gregorian[1900, January[], 1], Gregorian[year, July[], 1]] / 36525;
		Which[	1988 <= year <= 2019,
					(year - 1933) / (24 60 60),
				1900 <= year <= 1987,
					PolyC4[c, ECCoeff19th],
				1800 <= year <= 1899,
					PolyC4[c, ECCoeff18th],
				1700 <= year <= 1799,
					PolyC4[year - 1700, ECCoeff17th] / (24 60 60),
				1620 <= year <= 1699,
					PolyC4[year - 1600, ECCoeff16th] / (24 60 60),
				True,
					x = Hr[12] + DateDistanceC[Gregorian[1810, January[], 1], Gregorian[year, January[], 1]];
					(x^2 / 41048480 - 15) / (24 60 60)]
	]
ECCoeff19th = {-0.00002, 0.000297, 0.025184, -0.181133, 0.553040, -0.861938, 0.677066, -0.212591}
ECCoeff18th = {-0.000009, 0.003844, 0.083563, 0.865736, 4.867575, 15.845535, 31.332267, 38.291999, 28.316289, 11.636204, 2.043794}
ECCoeff17th = {8.118780842, -0.005092142, 0.003336121, -0.0000266484}
ECCoeff16th = {196.58333, -4.0675, 0.0219167}


(** equation-of-time **)

EquationOfTime[tee_] :=
	Module[{c, longitude, anomaly, eccentricity, varepsilon, y, equation},
		c = JulianCenturies[tee];
		longitude = PolyC4[c, ETCoeffLongitude];
		anomaly = PolyC4[c, ETCoeffAnomaly];
		eccentricity = PolyC4[c, ETCoeffEccentricity];
		varepsilon = Obliquity[tee];
		y = TanDegreesC[varepsilon / 2]^2;
		equation = (1 / 2 / Pi) * N[(y SinDegreesC[2 longitude] +
		-2 eccentricity SinDegreesC[anomaly] +
		4 eccentricity y SinDegreesC[anomaly] CosDegreesC[2 longitude] +
		-0.5 y^2 SinDegreesC[4 longitude] +
		-1.25 eccentricity^2 SinDegreesC[2 anomaly])];
		Sign[equation] Min[Abs[equation], Hr[12]]
	]
ETCoeffLongitude = Deg[{280.46645, 36000.76983, 0.0003032}]
ETCoeffAnomaly = Deg[{357.52910, 35999.05030, -0.0001559, -0.00000048}]
ETCoeffEccentricity = Deg[{0.016708617, -0.000042037, -0.0000001236}]

(** local-from-apparent **)

LocalFromApparent[tee_, location_] :=
	tee - EquationOfTime[UniversalFromLocal[tee, location]]
    
LocalFromApparent[tee_] :=
	tee - EquationOfTime[tee]

(** apparent-from-local **)

ApparentFromLocal[tee_] :=
	tee + EquationOfTime[tee]
 
ApparentFromLocal[tee_, location_] :=
	tee + EquationOfTime[UniversalFromLocal[tee,location]]
    
ApparentFromUniversal[tee_, location_] :=
 ApparentFromLocal[LocalFromUniversal[tee, location], location]
 
UniversalFromApparent[tee_, location_] := 
 UniversalFromLocal[LocalFromApparent[tee, location], location]

(** solar-longitude **)

SolarLongitudeC[tee_] :=
	Module[{c, longitude, x, y, z},
		c = JulianCenturies[tee];
		longitude = Deg[282.7771834] +
			36000.76953744 c +
			0.000005729577951308232 SigmaC[{{x, SLCoefficients},
				{y, SLAddends},
				{z, SLMultipliers}}, x SinDegreesC[z c + y]];
		N[Mod[longitude + Aberration[tee] + Nutation[tee], 360]]
	]
SLCoefficients = {403406, 195207, 119433, 112392, 3891, 2819, 1721,
	660, 350, 334, 314, 268, 242, 234, 158, 132, 129, 114,
	99, 93, 86, 78, 72, 68, 64, 46, 38, 37, 32, 29, 28, 27, 27,
	25, 24, 21, 21, 20, 18, 17, 14, 13, 13, 13, 12, 10, 10, 10,
	10}
SLMultipliers = {0.9287892, 35999.1376958, 35999.4089666,
    35998.7287385, 71998.20261, 71998.4403,
    36000.35726, 71997.4812, 32964.4678,
    -19.4410, 445267.1117, 45036.8840, 3.1008,
    22518.4434, -19.9739, 65928.9345,
    9038.0293, 3034.7684, 33718.148, 3034.448,
    -2280.773, 29929.992, 31556.493, 149.588,
    9037.750, 107997.405, -4444.176, 151.771,
    67555.316, 31556.080, -4561.540,
    107996.706, 1221.655, 62894.167,
    31437.369, 14578.298, -31931.757,
    34777.243, 1221.999, 62894.511,
    -4442.039, 107997.909, 119.066, 16859.071,
    -4.578, 26895.292, -39.127, 12297.536,
    90073.778}
SLAddends = {270.54861, 340.19128, 63.91854, 331.26220,
    317.843, 86.631, 240.052, 310.26, 247.23,
    260.87, 297.82, 343.14, 166.79, 81.53,
    3.50, 132.75, 182.95, 162.03, 29.8,
    266.4, 249.2, 157.6, 257.8, 185.1, 69.9,
    8.0, 197.1, 250.4, 65.3, 162.7, 341.5,
    291.6, 98.5, 146.7, 110.0, 5.2, 342.6,
    230.9, 256.1, 45.3, 242.9, 115.2, 151.8,
    285.3, 53.3, 126.6, 205.7, 85.9,
    146.1}


(** nutation **)

Nutation[tee_] :=
	Module[{c, capA, capB},
		c = JulianCenturies[tee];
		capA = PolyC4[c, NUCoeffA];
		capB = PolyC4[c, NUCoeffB];
		Deg[-0.004778] SinDegreesC[capA] +
		Deg[-0.0003667] SinDegreesC[capB]
	]
NUCoeffA = Deg[{124.90, -1934.134, 0.002063}]
NUCoeffB = Deg[{201.11, 72001.5377, 0.00057}]


(** aberration **)

Aberration[tee_] :=
	Module[{c},
		c = JulianCenturies[tee];
		Deg[0.0000974] CosDegreesC[Deg[177.63] + Deg[35999.01848] c] - Deg[0.005575]
	]


(** solar-longitude-after **)

SolarLongitudeAfter[tee_, phi_] :=
	Module[{varepsilon, rate, tau, l, u},
		varepsilon = 0.00001;
		rate = MeanTropicalYear[] / Deg[360];
		tau = tee + rate Mod[phi - SolarLongitudeC[tee], 360];
		l = Max[tee, tau - 5];
		u = tau + 5;
		BinarySearch[l, u,
			Function[{x}, Mod[SolarLongitudeC[x] - phi, 360] < Deg[180]],
			Function[{lo, hi}, hi - lo < varepsilon]]
	]


(** spring **)
(** summer **)
(** autumn **)
(** winter **)

Spring[] = Deg[0]
Summer[] = Deg[90]
Autumn[] = Deg[180]
Winter[] = Deg[270]


(** lunar-longitude **)

LunarLongitude[tee_] :=
	Module[{c, meanMoon, elongation, solarAnomaly, lunarAnomaly, moonNode, capE,
			correction, venus, jupiter, flatEarth,
			v, w, x, y, z},
		c = JulianCenturies[tee];
		meanMoon = Degrees[PolyC4[c, LLonMeanMoon]];
		elongation = Degrees[PolyC4[c, LLonElongation]];
		solarAnomaly = Degrees[PolyC4[c, LLonSolarAnomaly]];
		lunarAnomaly = Degrees[PolyC4[c, LLonLunarAnomaly]];
		moonNode = Degrees[PolyC4[c, LLonMoonNode]];
		capE = PolyC4[c, LLonCapE];
		correction = (Deg[1] / 1000000) SigmaC[{	{v, LLonSineCoefficients},
										{w, LLonArgsLunarElongation},
										{x, LLonArgsSolarAnomaly},
										{y, LLonArgsLunarAnomaly},
										{z, LLonArgsMoonFromNode}},
											v capE^Abs[x] SinDegreesC[	w elongation + 
																		x solarAnomaly +
																		y lunarAnomaly +
																		z moonNode]
										];
		venus = (Deg[3958] / 1000000) SinDegreesC[119.75 + c 131.849];
		jupiter = (Deg[318] / 1000000) SinDegreesC[53.09 + c 479264.29];
		flatEarth = (Deg[1962] / 1000000) SinDegreesC[meanMoon - moonNode];
		N[Mod[meanMoon + correction + venus + jupiter + flatEarth + Nutation[tee], 360]]
	]
LLonMeanMoon = Deg[{218.3164591, 481267.88134236, -.0013268, 1/538841, -1/65194000}]
LLonElongation = Deg[{297.8502042, 445267.1115168, -.00163, 1/545868, -1/113065000}]
LLonSolarAnomaly = Deg[{357.5291092, 35999.0502909, -.0001536, 1/24490000}]
LLonLunarAnomaly = Deg[{134.9634114, 477198.8676313, 0.008997, 1/69699, -1/14712000}]
LLonMoonNode = Deg[{93.2720993, 483202.0175273, -.0034029, -1/3526000, 1/863310000}]
LLonCapE = {1, -0.002516, -0.0000074}
LLonArgsLunarElongation = {0, 2, 2, 0, 0, 0, 2, 2, 2, 2, 0, 1, 0, 2, 0, 0, 4, 0, 4, 2, 2, 1,
	1, 2, 2, 4, 2, 0, 2, 2, 1, 2, 0, 0, 2, 2, 2, 4, 0, 3, 2, 4, 0, 2,
	2, 2, 4, 0, 4, 1, 2, 0, 1, 3, 4, 2, 0, 1, 2}
LLonArgsSolarAnomaly = {0, 0, 0, 0, 1, 0, 0, -1, 0, -1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1,
	0, 1, -1, 0, 0, 0, 1, 0, -1, 0, -2, 1, 2, -2, 0, 0, -1, 0, 0, 1,
	-1, 2, 2, 1, -1, 0, 0, -1, 0, 1, 0, 1, 0, 0, -1, 2, 1, 0}
LLonArgsLunarAnomaly = {1, -1, 0, 2, 0, 0, -2, -1, 1, 0, -1, 0, 1, 0, 1, 1, -1, 3, -2,
	-1, 0, -1, 0, 1, 2, 0, -3, -2, -1, -2, 1, 0, 2, 0, -1, 1, 0,
	-1, 2, -1, 1, -2, -1, -1, -2, 0, 1, 4, 0, -2, 0, 2, 1, -2, -3,
	2, 1, -1, 3}
LLonArgsMoonFromNode = {0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, -2, 2, -2, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, -2, 2, 0, 2, 0, 0, 0, 0,
	0, 0, -2, 0, 0, 0, 0, -2, -2, 0, 0, 0, 0, 0, 0, 0}
LLonSineCoefficients = {6288774, 1274027, 658314, 213618, -185116, -114332,
	58793, 57066, 53322, 45758, -40923, -34720, -30383,
	15327, -12528, 10980, 10675, 10034, 8548, -7888,
	-6766, -5163, 4987, 4036, 3994, 3861, 3665, -2689,
	-2602, 2390, -2348, 2236, -2120, -2069, 2048, -1773,
	-1595, 1215, -1110, -892, -810, 759, -713, -700, 691,
	596, 549, 537, 520, -487, -399, -381, 351, -340, 330,
	327, -323, 299, 294}


(** nth-new-moon **)

NthNewMoon[n_] :=
	Module[{k, c, approx, capE, solarAnomaly, lunarAnomaly, moonArgument, capOmega,
		correction, extra, additional,
		v, w, x, y, z, i, j, l},
		
		k = n - 24724;
		c = k / 1236.85;
		approx = PolyC4[c, NMCoeffApprox];
		capE = PolyC4[c, NMCoeffCapE];
		solarAnomaly = PolyC4[c, NMCoeffSolarAnomaly];
		lunarAnomaly = PolyC4[c, NMCoeffLunarAnomaly];
		moonArgument = PolyC4[c, NMCoeffMoonArgument];
		capOmega = PolyC4[c, NMCoeffCapOmega];
		correction = -.00017 * SinDegreesC[capOmega] +
			SigmaC[{	{v, NMSineCoeff},
					{w, NMEFactor},
					{x, NMSolarCoeff},
					{y, NMLunarCoeff},
					{z, NMMoonCoeff}},
					v capE^w SinDegreesC[x solarAnomaly + y lunarAnomaly + z moonArgument]
			];
		extra = 0.000325 * SinDegreesC[PolyC4[c, NMExtra]];
		additional =
			SigmaC[{	{i, NMAddConst},
					{j, NMAddCoeff},
					{l, NMAddFactor}},
					l SinDegreesC[i + j k]
			];
		UniversalFromDynamical[N[approx + correction + extra + additional]]
	]
NMCoeffApprox = {730125.59765, MeanSynodicMonth[] * 1236.85, 0.0001337, -0.000000150, 0.00000000073}
NMCoeffCapE = {1, -0.002516, -0.0000074}
NMCoeffSolarAnomaly = Deg[{2.5534, 29.10535669 * 1236.85, -0.0000218, -0.00000011}]
NMCoeffLunarAnomaly = Deg[{201.5643, 385.81693528 * 1236.85, 0.0107438, 0.00001239, -0.000000058}]
NMCoeffMoonArgument = Deg[{160.7108, 390.67050274 * 1236.85, -0.0016341, -0.00000227, 0.000000011}]
NMCoeffCapOmega = {124.7746, -1.56375580 * 1236.85, 0.0020691, 0.00000215}
NMEFactor = {0, 1, 0, 0, 1, 1, 2, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
NMSolarCoeff = {0, 1, 0, 0, -1, 1, 2, 0, 0, 1, 0, 1, 1, -1, 2, 0, 3, 1, 0, 1, -1, -1, 1, 0}
NMLunarCoeff = {1, 0, 2, 0, 1, 1, 0, 1, 1, 2, 3, 0, 0, 2, 1, 2, 0, 1, 2, 1, 1, 1, 3, 4}
NMMoonCoeff = {0, 0, 0, 2, 0, 0, 0, -2, 2, 0, 0, 2, -2, 0, 0, -2, 0, -2, 2, 2, 2, -2, 0, 0}
NMSineCoeff = {-0.40720, 0.17241, 0.01608, 0.01039, 0.00739, -0.00514, 0.00208,
	-0.00111, -0.00057, 0.00056, -0.00042, 0.00042, 0.00038, -0.00024,
	-0.00007, 0.00004, 0.00004, 0.00003, 0.00003, -0.00003, 0.00003,
	-0.00002, -0.00002, 0.00002}
NMAddConst = {251.88, 251.83, 349.42, 84.66, 141.74, 207.14, 154.84, 34.52, 207.19,
			291.34, 161.72, 239.56, 331.55}
NMAddCoeff = {0.016321, 26.641886, 36.412478, 18.206239, 53.303771, 2.453732,
			7.306860, 27.261239, 0.121824, 1.844379, 24.198154, 25.513099, 3.592518}
NMAddFactor = {0.000165, 0.000164, 0.000126, 0.000110, 0.000062, 0.000060, 0.000056,
			0.000047, 0.000042, 0.000040, 0.000037, 0.000035, 0.000023}
NMExtra = Deg[{299.77, 132.8475848, -0.009173}]


(** new-moon-before **)

NewMoonBefore[tee_] :=
	Module[{t0, phi, n},
	t0 = NthNewMoon[0];
	phi = LunarPhase[tee];
	n = Round[(tee - t0) / MeanSynodicMonth[] - phi / Deg[360]];
	NthNewMoon[MFinal[n - 1, (NthNewMoon[#] < tee)&]]
	]


(** new-moon-after **)

NewMoonAfter[tee_] :=
	Module[{t0, phi, n},
	t0 = NthNewMoon[0];
	phi = LunarPhase[tee];
	n = Round[(tee - t0) / MeanSynodicMonth[] - phi / Deg[360]];
	NthNewMoon[MNext[n, (NthNewMoon[#] >= tee)&]]
    ]
    

LunarSolarAngle[jd_] :=
	Degrees[LunarLongitude[jd] - SolarLongitudeC[jd]];


(** lunar-phase **)

LunarPhase[tee_] :=
	Mod[LunarLongitude[tee] - SolarLongitudeC[tee], 360]


(** new **)

New[] = Deg[0]


(** first-quarter **)

FirstQuarter[] = Deg[90]


(** full **)

FullLunar[] = Deg[180]


(** last-quarter **)

LastQuarter[] = Deg[270]


(** lunar-phase-before **)

LunarPhaseBefore[tee_, phi_] :=
	Module[{varepsilon, tau, l, u},
		varepsilon = 0.00001;
		tau = tee - MeanSynodicMonth[] (1/360) Mod[LunarPhase[tee] - phi, Deg[360]];
		l = tau - 2;
		u = Min[tee, tau + 2];
		BinarySearch[l, u,
			Function[{x}, Mod[LunarPhase[x] - phi, 360] < Deg[180]],
			Function[{lo, hi}, hi - lo < varepsilon]]
	]


(** lunar-phase-after **)

LunarPhaseAfter[tee_, phi_] :=
	Module[{varepsilon, tau, l, u},
		varepsilon = 0.00001;
		tau = tee + MeanSynodicMonth[] (1/360) Mod[phi - LunarPhase[tee], Deg[360]];
		l = Max[tee, tau - 2];
		u = tau + 2;
		BinarySearch[l, u,
			Function[{x}, Mod[LunarPhase[x] - phi, 360] < Deg[180]],
			Function[{lo, hi}, hi - lo < varepsilon]]
	]
	

(** lunar-latitude **)

LunarLatitude[tee_] :=
	Module[{c, longitude, elongation, solarAnomaly, lunarAnomaly, moonNode, capE,
			latitude, venus, flatEarth, extra,
			v, w, x, y, z},
		c = JulianCenturies[tee];
		longitude = Degrees[PolyC4[c, LLatLongitude]];
		elongation = Degrees[PolyC4[c, LLatElongation]];
		solarAnomaly = Degrees[PolyC4[c, LLatSolarAnomaly]];
		lunarAnomaly = Degrees[PolyC4[c, LLatLunarAnomaly]];
		moonNode = Degrees[PolyC4[c, LLatMoonNode]];
		capE = PolyC4[c, LLatCapE];
		latitude = (Deg[1] / 1000000) SigmaC[{	{v, LLatSineCoefficients},
										{w, LLatArgsLunarElongation},
										{x, LLatArgsSolarAnomaly},
										{y, LLatArgsLunarAnomaly},
										{z, LLatArgsMoonNode}},
											v capE^Abs[x] SinDegreesC[	w elongation + 
																		x solarAnomaly +
																		y lunarAnomaly +
																		z moonNode]
										];
		venus = (Deg[175] / 1000000) (SinDegreesC[Deg[119.75] + c 131.849 + moonNode] + SinDegreesC[Deg[119.75] + c 131.849 - moonNode]);
		flatEarth = (Deg[-2235] / 1000000) SinDegreesC[longitude] +
			(Deg[127] / 1000000) SinDegreesC[longitude - lunarAnomaly] +
			(Deg[-115] / 1000000) SinDegreesC[longitude + lunarAnomaly];
		extra = (Deg[382] / 1000000) SinDegreesC[Deg[313.45] + c Deg[481266.484]];
		N[Mod[latitude + venus + flatEarth + extra, 360]]
	]
LLatLongitude = Deg[{218.3164591, 481267.88134236, -.0013268, 1/538841, -1/65194000}]
LLatElongation = Deg[{297.8502042, 445267.1115168, -.00163, 1/545868, -1/113065000}]
LLatSolarAnomaly = Deg[{357.5291092, 35999.0502909, -.0001536, 1/24490000}]
LLatLunarAnomaly = Deg[{134.9634114, 477198.8676313, 0.008997, 1/69699, -1/14712000}]
LLatMoonNode = Deg[{93.2720993, 483202.0175273, -.0034029, -1/3526000, 1/863310000}]
LLatCapE = {1, -0.002516, -0.0000074}
LLatArgsLunarElongation = {0, 0, 0, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 4, 0, 0, 0,
	1, 0, 0, 0, 1, 0, 4, 4, 0, 4, 2, 2, 2, 2, 0, 2, 2, 2, 2, 4, 2, 2,
	0, 2, 1, 1, 0, 2, 1, 2, 0, 4, 4, 1, 4, 1, 4, 2}
LLatArgsSolarAnomaly = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, -1, -1, -1, 1, 0, 1,
	0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 1,
	0, -1, -2, 0, 1, 1, 1, 1, 1, 0, -1, 1, 0, -1, 0, 0, 0, -1, -2}
LLatArgsLunarAnomaly = {0, 1, 1, 0, -1, -1, 0, 2, 1, 2, 0, -2, 1, 0, -1, 0, -1, -1, -1,
	0, 0, -1, 0, 1, 1, 0, 0, 3, 0, -1, 1, -2, 0, 2, 1, -2, 3, 2, -3,
	-1, 0, 0, 1, 0, 1, 1, 0, 0, -2, -1, 1, -2, 2, -2, -1, 1, 1, -2,
	0, 0}
LLatArgsMoonNode = {1, 1, -1, -1, 1, -1, 1, 1, -1, -1, -1, -1, 1, -1, 1, 1, -1, -1,
	-1, 1, 3, 1, 1, 1, -1, -1, -1, 1, -1, 1, -3, 1, -3, -1, -1, 1,
	-1, 1, -1, 1, 1, 1, 1, -1, 3, -1, -1, 1, -1, -1, 1, -1, 1, -1,
	-1, -1, -1, -1, -1, 1}
LLatSineCoefficients = {5128122, 280602, 277693, 173237, 55413, 46271, 32573,
	17198, 9266, 8822, 8216, 4324, 4200, -3359, 2463, 2211,
	2065, -1870, 1828, -1794, -1749, -1565, -1491, -1475,
	-1410, -1344, -1335, 1107, 1021, 833, 777, 671, 607,
	596, 491, -451, 439, 422, 421, -366, -351, 331, 315,
	302, -283, -229, 223, 223, -220, -220, -185, 181,
	-177, 176, 166, -164, 132, -119, 115, 107}


(** lunar-altitude **)

LunarAltitude[tee_, locale_Location] :=
	Module[{phi, psi, varepsilon, lambda, beta, alpha, delta, theta0, capH, altitude},
		phi = CLatitude[locale];
		psi = CLongitude[locale];
		varepsilon = Obliquity[tee];
		lambda = LunarLongitude[tee];
		beta = LunarLatitude[tee];
		alpha = ArcTanDegreesC[
			(SinDegreesC[lambda] CosDegreesC[varepsilon] - TanDegreesC[beta] SinDegreesC[varepsilon]) /
			CosDegreesC[lambda],
			Quotient[lambda, Deg[90]] + 1
		];
		delta = ArcSinDegreesC[SinDegreesC[beta] CosDegreesC[varepsilon] +
			CosDegreesC[beta] SinDegreesC[varepsilon] SinDegreesC[lambda]];
		theta0 = SiderealFromMoment[tee];
		capH = Mod[theta0 + psi - alpha, 360];
		altitude = ArcSinDegreesC[SinDegreesC[phi] SinDegreesC[delta] + CosDegreesC[phi] CosDegreesC[delta] CosDegreesC[capH]];
		Mod[altitude + Deg[180], 360] - Deg[180]
	]


(** estimate-prior-solar-longitude **)

EstimatePriorSolarLongitude[tee_, phi_] :=
	Module[{rate, tau, capDelta},
		rate = MeanTropicalYear[] / Deg[360];
		tau = tee - rate Mod[SolarLongitudeC[tee] - phi, 360];
		capDelta = Mod[SolarLongitudeC[tau] - phi + Deg[180], 360] - Deg[180];
		Min[tee, tau - rate capDelta]
	]


(** visible-crescent **)

VisibleCrescent[date_Integer, locale_Location] :=
	Module[{tee, phase, altitude, elongation},
		tee = UniversalFromStandard[Dusk[date - 1, locale, Deg[4.5]], locale];
		phase = LunarPhase[tee];
		altitude = LunarAltitude[tee, locale];
		arcOfLight = ArcCosDegreesC[CosDegreesC[LunarLatitude[tee]] CosDegreesC[phase]];
		(New[] < phase < FirstQuarter[]) &&
			(Deg[10.6] <= arcOfLight <= Deg[90]) &&
			(altitude > Deg[4.1])
	]


(** phasis-on-or-before **)

PhasisOnOrBefore[date_Integer, locale_Location] :=
	Module[{mean, tau},
		mean = date - Floor[(LunarPhase[date] / Deg[360]) MeanSynodicMonth[]];
		tau = If[date - mean <= 3 && !VisibleCrescent[date, locale],
			mean - 30,
			mean - 2];
		MNext[tau, VisibleCrescent[#, locale]&]
	]

PhasisOnOrAfter[date_Integer, locale_Location] :=
	Module[{mean, tau},
		mean = date - Floor[(LunarPhase[date] / Deg[360]) MeanSynodicMonth[]];
		tau = If[date - mean <= 3 && !VisibleCrescent[date-1, locale],
			date,
			mean + 29];
		MNext[tau, VisibleCrescent[#, locale]&]
	]


(** jerusalem **)

Jerusalem[] = Location["Jerusalem, Israel", Deg[31.8], Deg[35.2], Mt[800], 2]

Babylon[] = Location["Babylon", Deg[32.5], Deg[44.4], Mt[26], 3]


(*
;;;; Section: Modern Hindu Calendars

888b     d888               888                               888    888 d8b               888          
8888b   d8888               888                               888    888 Y8P               888          
88888b.d88888               888                               888    888                   888          
888Y88888P888  .d88b.   .d88888  .d88b.  888d888 88888b.      8888888888 888 88888b.   .d88888 888  888 
888 Y888P 888 d88""88b d88" 888 d8P  Y8b 888P"   888 "88b     888    888 888 888 "88b d88" 888 888  888 
888  Y8P  888 888  888 888  888 88888888 888     888  888     888    888 888 888  888 888  888 888  888 
888   "   888 Y88..88P Y88b 888 Y8b.     888     888  888     888    888 888 888  888 Y88b 888 Y88b 888 
888       888  "Y88P"   "Y88888  "Y8888  888     888  888     888    888 888 888  888  "Y88888  "Y88888 

*)


(** hindu-sine-table **)

HinduSineTable[entry_] :=
	Module[{exact, error},
		exact = 3438 SinDegreesC[entry 225/60];
		error = 0.215 Sign[exact] Sign[ Abs[exact] - 1716 ];
		Round[exact + error] / 3438
	]


(** hindu-sine **)

HinduSine[theta_] :=
	Module[{entry, fraction},
		entry = theta 60/225;
		fraction = Mod[entry, 1];
		fraction HinduSineTable[Ceiling[entry]] +
			(1 - fraction) HinduSineTable[Floor[entry]]
	]


(** hindu-arcsin **)

HinduArcsin[amp_] :=
	Module[{neg, a, pos, below, result},
		neg = amp < 0;
		a = If[neg, -amp, amp];
		pos = MNext[0, (a <= HinduSineTable[#])&];
		below = HinduSineTable[pos - 1];
		result = 225/60 (pos - 1 + (a - below) / (HinduSineTable[pos] - below));
		If[neg, -result, result]
	]


(** mean-position **)

MeanPosition[tee_, period_] :=
	Deg[360] Mod[(tee - HinduCreation[]) / period, 1]


(** hindu-sidereal-year **)

HinduSiderealYear[] = 365 + 279457/1080000


(** hindu-creation **)

HinduCreation[] = HinduEpoch[] - 1955880000 HinduSiderealYear[]


(** hindu-sidereal-month **)

HinduSiderealMonth[] = 27 + 4644439/14438334


(** hindu-synodic-month **)

HinduSynodicMonth[] = 29 + 7087771/13358334


(** hindu-anomalistic-year **)

HinduAnomalisticYear[] = 1577917828000 / (4320000000 - 387)


(** hindu-anomalistic-month **)

HinduAnomalisticMonth[] = 1577917828 / (57753336 - 488199)


(** true-position **)

TruePosition[tee_, period_, size_, anomalistic_, change_] :=
	Module[{long, offset, contraction, equation},
		long = MeanPosition[tee, period];
		offset = HinduSine[MeanPosition[tee, anomalistic]];
		contraction = Abs[offset] change size;
		equation = HinduArcsin[offset (size - contraction)];
		Mod[long - equation, 360]
	]


(** hindu-solar-longitude **)

HinduSolarLongitude[tee_] :=
	TruePosition[tee, HinduSiderealYear[], 14/360, HinduAnomalisticYear[], 1/42]


(** hindu-zodiac **)

HinduZodiac[tee_] :=
	Quotient[HinduSolarLongitude[tee], Deg[30]] + 1


(** hindu-lunar-longitude **)

HinduLunarLongitude[tee_] :=
	TruePosition[tee, HinduSiderealMonth[], 32/360, HinduAnomalisticMonth[], 1/96]


(** hindu-lunar-phase **)

HinduLunarPhase[tee_] :=
	Mod[HinduLunarLongitude[tee] - HinduSolarLongitude[tee], 360]


(** lunar-day **)

LunarDay[tee_] :=
	Quotient[HinduLunarPhase[tee], Deg[12]] + 1


(** hindu-new-moon-before **)

HinduNewMoonBefore[tee_] :=
	Module[{varepsilon, tau, l, u},
		varepsilon = 2^-1000;
		tau = tee - (1 / Deg[360]) HinduLunarPhase[tee] HinduSynodicMonth[];
		l = tau - 1;
		u = Min[tee, tau + 1];
		BinarySearch[l, u,
			Function[{x}, HinduLunarPhase[x] < Deg[180]],
			Function[{lo, hi}, HinduZodiac[lo] == HinduZodiac[hi] || hi - lo < varepsilon]]
	]


(** lunar-day-after **)

LunarDayAfter[tee_, k_] :=
	Module[{varepsilon, phase, tau, l, u},
		varepsilon = 2^-17;
		phase = (k - 1) 12;
		tau = tee + (1/360) Mod[phase - HinduLunarPhase[tee], Deg[360]] HinduSynodicMonth[];
		l = Max[tee, tau - 2];
		u = tau + 2;
		BinarySearch[l, u,
			Function[{x}, Mod[HinduLunarPhase[x] - phase, 360] < Deg[180]],
			Function[{lo, hi}, hi - lo < varepsilon]]
	]


(** hindu-solar-from-fixed **)

HinduSolar[date_Integer] :=
	Module[{critical, month, year, approx, begin, day},
		critical = HinduSunrise[date + 1];
		month = HinduZodiac[critical];
		year = HinduCalendarYear[critical] - HinduSolarEra[];
		approx = date - 3 - Mod[Floor[HinduSolarLongitude[critical]], Deg[30]];
		begin = MNext[approx, (HinduZodiac[HinduSunrise[1 + #]] == month)&];
		day = date - begin + 1;
		HinduSolar[year, month, day]
	]


(** hindu-solar-on-or-before? **)

HinduSolarOnOrBeforeQ[date1_?HinduSolarQ, date2_?HinduSolarQ] :=
	Module[{month1, month2, day1, day2, year1, year2},
		month1 = CMonth[date1];
		month2 = CMonth[date2];
		day1 = CDay[date1];
		day2 = CDay[date2];
		year1 = CYear[date1];
		year2 = CYear[date2];
		
		year1 < year2 || year1 == year2 && (month1 < month2 || month1 == month2 && day1 <= day2)
	]


(** hindu-calendar-year **)

HinduCalendarYear[tee_] :=
	Round[(tee - HinduEpoch[]) / HinduSiderealYear[] - HinduSolarLongitude[tee] / Deg[360]]


(** hindu-solar-era **)

HinduSolarEra[] = 3179


(** fixed-from-hindu-solar **)

ToFixed[date_?HinduSolarQ] :=
	Module[{month, day, year, approx, rate, phi, capDelta, tau},
		month = CMonth[date];
		day = CDay[date];
		year = CYear[date];
		approx = Floor[(year + HinduSolarEra[] + (month - 1) / 12) HinduSiderealYear[]] + HinduEpoch[] + day - 1;
		rate = Deg[360] / HinduSiderealYear[];
		phi = (month - 1) Deg[30] + (day - 1) rate;
		capDelta = Mod[HinduSolarLongitude[approx + 1/4] - phi + Deg[180], 360] - Deg[180];
		tau = approx - Ceiling[capDelta / rate];
		MNext[tau - 2, HinduSolarOnOrBeforeQ[date, HinduSolar[#]]&]
	]


(** hindu-lunar-era **)

HinduLunarEra[] = 3044


(** hindu-lunar-from-fixed **)

HinduLunar[date_Integer] :=
	Module[{critical, day, leapDay, lastNewMoon, nextNewMoon, solarMonth, leapMonth, month, year},
		critical = HinduSunrise[date];
		day = LunarDay[critical];
		leapDay = day == LunarDay[HinduSunrise[date - 1]];
		lastNewMoon = HinduNewMoonBefore[critical];
		nextNewMoon = HinduNewMoonBefore[Floor[lastNewMoon] + 35];
		solarMonth = HinduZodiac[lastNewMoon];
		leapMonth = solarMonth == HinduZodiac[nextNewMoon];
		month = AdjustedMod[solarMonth + 1, 12];
		year = HinduCalendarYear[nextNewMoon] -
			HinduLunarEra[] -
			If[leapMonth && month == 1, -1, 0];
		HinduLunar[year, month, leapMonth, day, leapDay]
	]


(** hindu-lunar-on-or-before? **)

HinduLunarOnOrBeforeQ[date1_?HinduLunarQ, date2_?HinduLunarQ] :=
	Module[{month1, month2, leap1, leap2, day1, day2, leapday1, leapday2, year1, year2},
		month1 = CMonth[date1];
		month2 = CMonth[date2];
		leap1 = CLeapMonth[date1];
		leap2 = CLeapMonth[date2];
		day1 = CDay[date1];
		day2 = CDay[date2];
		leapday1 = CLeapDay[date1];
		leapday2 = CLeapDay[date2];
		year1 = CYear[date1];
		year2 = CYear[date2];
		
		year1 < year2 || year1 == year2 && (month1 < month2 || 
			month1 == month2 && (leap1 && !leap2 || 
				leap1 == leap2 && (day1 < day2 || day1 == day2 && (!leapday1 || leapday2))))
	]


(** fixed-from-hindu-lunar **)

ToFixed[date_?HinduLunarQ] :=
	Module[{year, month, leap, day, approx, s, k, est, tau, mid},
		year = CYear[date];
		month = CMonth[date];
		leapMonth = CLeapMonth[date];
		day = CDay[date];
		approx = HinduEpoch[] + HinduSiderealYear[] (year + HinduLunarEra[] + (month - 1) / 12);
		s = Floor[approx - (1 / Deg[360]) (Mod[HinduSolarLongitude[approx] - (month - 1) Deg[30] + Deg[180], Deg[360]] - 180)];
		k = LunarDay[s + 1/4];
		mid = HinduLunar[s - 15];
		est = s + day - Which[
			3 < k < 29,
				k,
			CMonth[mid] < month || (CLeapMonth[mid] && !leapMonth),
				Mod[k + 15, 30] - 15,
			True,
				Mod[k - 15, 30] + 15
		];
		tau = est - Mod[LunarDay[est + 1/4] - day + 15, 30] + 15;
		MNext[tau - 1, HinduLunarOnOrBeforeQ[date, HinduLunar[#]]&]
	]


(** hindu-equation-of-time **)

HinduEquationOfTime[date_Integer] :=
	Module[{offset, equationSun},
		offset = HinduSine[MeanPosition[date, HinduAnomalisticYear[]]];
		equationSun = offset 3438/60 (Abs[offset] / 1080 - 14/360);
		DailyMotion[date] 1/360 equationSun 1/360 HinduSiderealYear[]
	]


(** ascensional-difference **)

AscensionalDifference[date_Integer, locale_Location] :=
	Module[{sinDecl, lat, diurnalRadius, tanLat, earthSine},
		sinDecl = 1397/3438 HinduSine[HinduTropicalLongitude[date]];
		lat = CLatitude[locale];
		diurnalRadius = HinduSine[Deg[90] + HinduArcsin[sinDecl]];
		tanLat = HinduSine[lat] / HinduSine[Deg[90] + lat];
		earthSine = sinDecl tanLat;
		HinduArcsin[-(earthSine / diurnalRadius)]
	]


(** hindu-tropical-longitude **)

HinduTropicalLongitude[date_Integer] :=
	Module[{days, precession},
		days = Floor[date - HinduEpoch[]];
		precession = Deg[27] - Abs[Deg[54] - Mod[Deg[27] + Deg[108] 600/1577917828 days, 108]];
		Mod[HinduSolarLongitude[date] - precession, 360]
	]


(** rising-sign **)

RisingSign[date_Integer] :=
	Part[ArgsRisingSign,
		Mod[Quotient[HinduTropicalLongitude[date], Deg[30]], 6] + 1]
ArgsRisingSign = {1670/1800, 1795/1800, 1935/1800, 1935/1800, 1795/1800, 1670/1800}


(** daily-motion **)

DailyMotion[date_Integer] :=
	Module[{meanMotion, anomaly, epicycle, entry, sineTableStep, factor},
		meanMotion = Deg[360] / HinduSiderealYear[];
		anomaly = MeanPosition[date, HinduAnomalisticYear[]];
		epicycle = 14/360 - Abs[HinduSine[anomaly]] / 1080;
		entry = Quotient[anomaly, Deg[225] / 60];
		sineTableStep = HinduSineTable[entry + 1] - HinduSineTable[entry];
		factor = sineTableStep (-3438/225) epicycle;
		meanMotion (factor + 1)
	]


(** solar-sidereal-difference **)

SolarSiderealDifference[date_Integer] :=
	DailyMotion[date] RisingSign[date]


(** ujjain **)

Ujjain[] = Location["Ujjain, India", Angle[23, 9, 0], Angle[75, 46, 0], Mt[0], 5 + 461/9000]


(** hindu-locale **)

HinduLocale[] = Ujjain[]


(** hindu-sunrise **)

HinduSunrise[date_Integer] :=
	date + 1/4 + (CLongitude[Ujjain[]] - CLongitude[HinduLocale[]]) / Deg[360] +
		HinduEquationOfTime[date] + (1577917828/1582237828 / Deg[360]) * 
			(AscensionalDifference[date, HinduLocale[]] + 1/4 SolarSiderealDifference[date])


(** alt-hindu-sunrise **)

AltHinduSunrise[date_Integer] :=
	Module[{rise},
		rise = SunriseC[date, HinduLocale[]];
		1/24 1/60 Round[rise 24 60]
	]


(** lunar-station **)

LunarStation[date_Integer] :=
	Module[{critical},
		critical = HinduSunrise[date];
		Quotient[HinduLunarLongitude[critical], Deg[800] / 60] + 1
	]


(** hindu-solar-longitude-after **)

HinduSolarLongitudeAfter[tee_, phi_] :=
	Module[{varepsilon, tau, l, u},
		varepsilon = 1/1000000;
		tau = tee + HinduSiderealYear[] (1/360) Mod[phi - HinduSolarLongitude[tee], Deg[360]];
		l = Max[tee, tau - 5];
		u = tau + 5;
		BinarySearch[l, u,
			Function[{x}, Mod[HinduSolarLongitude[x] - phi, 360] < Deg[180]],
			Function[{lo, hi}, hi - lo < varepsilon]]
	]


(** mesha-samkranti **)

MeshaSamkranti[gYear_Integer] :=
	Module[{jan1},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		HinduSolarLongitudeAfter[jan1, Deg[0]]
	]


(** hindu-lunar-new-year **)

HinduLunarNewYear[gYear_Integer] :=
	Module[{jan1, mina, newMoon, hDay, critical},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		mina = HinduSolarLongitudeAfter[jan1, Deg[330]];
		newMoon = LunarDayAfter[mina, 1];
		hDay = Floor[newMoon];
		critial = HinduSunrise[hDay];
		hDay + If[newMoon < critial || LunarDay[HinduSunrise[hDay + 1]] == 2, 0, 1]
	]


(** karana **)

Karana[n_Integer] :=
	Which[n == 1, 0,
		n > 57, n - 50,
		True, AdjustedMod[n - 1, 7]
	]


(** yoga **)

Yoga[date_Integer] :=
	Floor[Mod[(HinduSolarLongitude[date] + HinduLunarLongitude[date]) 60/800, Deg[27]]] + 1


(** sacred-wednesdays-in-gregorian **)

SacredWednesdaysInGregorian[gYear_Integer] :=
	SacredWednesdays[
		ToFixed[Gregorian[gYear, January[], 1]],
		ToFixed[Gregorian[gYear, December[], 31]]
	]


(** sacred-wednesdays **)

SacredWednesdays[start_Integer, end_Integer] :=
	Module[{result = {}, wed, hDate},
		wed = KDayOnOrAfter[start, WednesdayC[]];
		While[wed <= end,
			hDate = HinduLunar[wed];
			If[CDay[hDate] == 8,
				result = Append[result, wed]];
			wed += 7;
		];
		result
	]


Format[date_HinduLunar]:=
	If[HinduLunarQ[date],
		StringForm["``, ```` ```` `` V.E.",
			NameFromDayOfWeekC[ToFixed[date], OldHinduLunar],
			CDay[date],
			If[CLeapDay[date], " II", ""],
			NameFromNumber[CMonth[date], MonthNames[OldHinduLunar, ASCII]],
			If[CLeapMonth[date], " II", ""],
			CYear[date]
		],
		ToString[InputForm[date]]
	]


Format[date_HinduSolar]:=
	If[HinduSolarQ[date],
		StringForm["``, `` `` `` S.E.",
			NameFromDayOfWeekC[ToFixed[date], OldHinduSolar],
			CDay[date],
			NameFromNumber[AdjustedMod[CMonth[date] + 1, 12], MonthNames[OldHinduLunar, ASCII]],
			CYear[date]
		],
		ToString[InputForm[date]]
	]

	

(*
;;;; Section: Test Code
                                                                          
*)

(* These test tables (except where specified otherwise) were transcribed from Appendix C of _Chronometryl Calculations_ *)

TestFixedDates[] = {
	-214193, -61387, 25469, 49217, 171307, 210155, 253427, 369740, 400085, 434355, 452605,
	470160, 473837, 507850, 524156, 544676, 567118, 569477, 601716, 613424, 626596, 645554,
	664224, 671401, 694799, 704424, 708842, 709409, 709580, 727274, 728714, 744313, 764652}

TestDaysOfWeek[] = {
	SundayC, WednesdayC, WednesdayC, SundayC, WednesdayC, MondayC, SaturdayC, SundayC, SundayC, FridayC, SaturdayC,
	FridayC, SundayC, SundayC, WednesdayC, SaturdayC, SaturdayC, SaturdayC, WednesdayC, SundayC, FridayC, SundayC,
	MondayC, WednesdayC, SundayC, SundayC, MondayC, MondayC, ThursdayC, TuesdayC, SundayC, WednesdayC, SundayC}

TestJulianDays[] = {
	1507231.5, 1660037.5, 1746893.5, 1770641.5, 1892731.5, 1931579.5, 1974851.5, 2091164.5, 2121509.5, 2155779.5, 2174029.5, 
	2191584.5, 2195261.5, 2229274.5, 2245580.5, 2266100.5, 2288542.5, 2290901.5, 2323140.5, 2334848.5, 2348020.5, 2366978.5, 
	2385648.5, 2392825.5, 2416223.5, 2425848.5, 2430266.5, 2430833.5, 2431004.5, 2448698.5, 2450138.5, 2465737.5, 2486076.5}

TestDates[Gregorian] = {
	{-586, 7, 24}, {-168, 12, 5}, {70, 9, 24}, {135, 10, 2}, {470, 1, 8}, {576, 5, 20}, {694, 11, 10}, {1013, 4, 25}, {1096, 5, 24}, {1190, 3, 23}, {1240, 3, 10},
	{1288, 4, 2}, {1298, 4, 27}, {1391, 6, 12}, {1436, 2, 3}, {1492, 4, 9}, {1553, 9, 19}, {1560, 3, 5}, {1648, 6, 10}, {1680, 6, 30}, {1716, 7, 24}, {1768, 6, 19},
	{1819, 8, 2}, {1839, 3, 27}, {1903, 4, 19}, {1929, 8, 25}, {1941, 9, 29}, {1943, 4, 19}, {1943, 10, 7}, {1992, 3, 17}, {1996, 2, 25}, {2038, 11, 10}, {2094, 7, 18}}

TestDates[Julian] = {
	{-587, 7, 30}, {-169, 12, 8}, {70, 9, 26}, {135, 10, 3}, {470, 1, 7}, {576, 5, 18}, {694, 11, 7}, {1013, 4, 19}, {1096, 5, 18}, {1190, 3, 16}, {1240, 3, 3}, 
	{1288, 3, 26}, {1298, 4, 20}, {1391, 6, 4}, {1436, 1, 25}, {1492, 3, 31}, {1553, 9, 9}, {1560, 2, 24}, {1648, 5, 31}, {1680, 6, 20}, {1716, 7, 13}, {1768, 6, 8}, 
	{1819, 7, 21}, {1839, 3, 15}, {1903, 4, 6}, {1929, 8, 12}, {1941, 9, 16}, {1943, 4, 6}, {1943, 9, 24}, {1992, 3, 4}, {1996, 2, 12}, {2038, 10, 28}, {2094, 7, 5}}


TestDates[OldHinduSolar] = {
	{2515, 5, 19}, {2933, 9, 26}, {3171, 7, 11}, {3236, 7, 17}, {3570, 10, 19}, {3677, 2, 28}, {3795, 8, 17}, {4114, 1, 26}, {4197, 2, 24}, {4290, 12, 20}, {4340, 12, 7}, 
	{4388, 12, 30}, {4399, 1, 24}, {4492, 3, 7}, {4536, 10, 28}, {4593, 1, 3}, {4654, 6, 12}, {4660, 11, 27}, {4749, 3, 1}, {4781, 3, 21}, {4817, 4, 13}, {4869, 3, 8}, 
	{4920, 4, 20}, {4939, 12, 13}, {5004, 1, 4}, {5030, 5, 11}, {5042, 6, 15}, {5044, 1, 4}, {5044, 6, 23}, {5092, 12, 2}, {5096, 11, 11}, {5139, 7, 26}, {5195, 4, 2}}

TestDates[OldHinduLunar] = {
	{2515, 6, False, 11}, {2933, 9, False, 26}, {3171, 8, False, 3}, {3236, 8, False, 9}, {3570, 11, True, 19}, 
	{3677, 3, False, 5}, {3795, 9, False, 15}, {4114, 2, False, 7}, {4197, 2, False, 24}, {4291, 1, False, 9}, 
	{4340, 12, False, 9}, {4389, 1, False, 23}, {4399, 2, False, 8}, {4492, 4, False, 2}, {4536, 11, False, 7}, 
	{4593, 1, False, 3}, {4654, 7, False, 2}, {4660, 11, False, 29}, {4749, 3, False, 20}, {4781, 4, False, 4}, 
	{4817, 5, False, 6}, {4869, 4, False, 5}, {4920, 5, False, 12}, {4940, 1, True, 13}, {5004, 1, False, 23}, 
	{5030, 5, False, 21}, {5042, 7, False, 9}, {5044, 1, False, 15}, {5044, 7, False, 9}, {5092, 12, False, 14}, 
	{5096, 12, False, 7}, {5139, 8, False, 14}, {5195, 4, False, 6}}


TestDates[HinduSolar] = {
	{-664, 5, 19}, {-246, 9, 26}, {-8, 7, 9}, {57, 7, 16}, {391, 10, 21}, {498, 2, 31}, {616, 8, 16},
	{935, 1, 28}, {1018, 2, 26}, {1111, 12, 23}, {1161, 12, 10}, {1210, 1, 2}, {1220, 1, 27}, {1313, 3, 8},
	{1357, 10, 30}, {1414, 1, 5}, {1475, 6, 10}, {1481, 11, 29}, {1570, 3, 3}, {1602, 3, 22}, {1638, 4, 13},
	{1690, 3, 10}, {1741, 4, 20}, {1760, 12, 16}, {1825, 1, 7}, {1851, 5, 10}, {1863, 6, 14}, {1865, 1, 7},
	{1865, 6, 21}, {1913, 12, 4}, {1917, 11, 13}, {1960, 7, 24}, {2016, 4, 2}}

TestDates[HinduLunar] = {
	{-529, 6, False, 11, False}, {-111, 9, False, 27, False}, {127, 8, False, 3, False}, {192, 8, False, 9, False}, {526, 11, False, 19, False}, 
	{633, 3, False, 5, False}, {751, 9, False, 15, False}, {1070, 2, False, 6, False}, {1153, 3, True, 23, False}, {1247, 1, False, 8, False}, 
	{1297, 1, False, 8, False}, {1345, 1, False, 22, False}, {1355, 2, False, 8, False}, {1448, 4, False, 1, False}, {1492, 11, False, 7, False}, 
	{1549, 2, True, 3, False}, {1610, 7, False, 2, False}, {1616, 11, False, 28, True}, {1705, 3, False, 20, False}, {1737, 4, False, 4, False}, 
	{1773, 5, False, 6, False}, {1825, 4, False, 5, False}, {1876, 5, False, 11, False}, {1896, 1, False, 13, False}, {1960, 1, False, 22, False}, 
	{1986, 5, False, 20, False}, {1998, 7, False, 9, False}, {2000, 1, False, 14, False}, {2000, 7, False, 8, False}, {2048, 12, False, 14, False}, 
	{2052, 12, False, 7, False}, {2095, 8, False, 14, False}, {2151, 4, False, 6, False}}

(* Easter information from <http://www.ozemail.com.au/~jahisco/BSS/easter.htm> as of 9/9/97 *)

Interleave[list1_, list2_] :=
	Thread[List[list1, list2]]

FormatResult[d_] :=
	If[Length[d] == 0, "OK", d]
	
PrintResult[s_, d_] :=
	Module[{result},
		WriteString["stdout", s];
		result = Evaluate[d];
		WriteString["stdout", ": ", ToString[FormatResult[result]], "\n"]
	]

SetAttributes[PrintResult, HoldRest]

PrintDotAfter[exp_] := (
	If[Mod[++dotCount, 1] == 0,
		WriteString["stdout", "."]];
	exp
)

TestFixedToWeekDay[] :=
	PrintResult["fixed -> week day",
		Select[Interleave[TestFixedDates[], TestDaysOfWeek[]], (Symbol[NameFromDayOfWeekC[DayOfWeekCFromFixed[ #[[1]] ]]] =!= #[[2]])&]];

TestFixedToJulianDay[] :=
	PrintResult["fixed -> Julian day",
		Select[Interleave[TestFixedDates[], TestJulianDays[]], (JDFromFixed[ #[[1]] ] =!= #[[2]])&]];

TestJulianDayToFixed[] :=
	PrintResult["Julian day -> fixed",
		Select[Interleave[TestJulianDays[], TestFixedDates[]], (FixedFromJD[ #[[1]] ] =!= #[[2]])&]];

TestFixedToCalendar[calendar_] :=
	Block[{dotCount = 0},
		PrintResult["fixed -> " <> ToString[calendar],
			Select[Interleave[TestFixedDates[], TestDates[calendar]], (PrintDotAfter[calendar[ #[[1]] ] =!= Apply[calendar, #[[2]] ]])&]];
	]

TestCalendarToFixed[calendar_] :=
	Block[{dotCount = 0},
		PrintResult[ToString[calendar] <> " -> fixed",
			Select[Interleave[TestDates[calendar], TestFixedDates[]], (PrintDotAfter[ToFixed[ Apply[calendar, #[[1]] ] ] =!= #[[2]]])&]];
	]

TestCalendar[calendar_] :=
	{ TestFixedToCalendar[calendar], TestCalendarToFixed[calendar] }

TestHoliday[holiday_] :=
	PrintResult["fixed -> " <> ToString[holiday],
		Select[TestDates[holiday], (Gregorian[ holiday[ #[[1]] ] ] =!= Apply[Gregorian, #])&]];

ChronometryTest[] := (
	WriteString["stdout", 
	  "Current date and time (local): " <> ToString[Gregorian[CurrentDate[]]] <> 
	    ", " <> ToString[ TimeOfDay[CurrentMoment[]]] ];

	WriteString["stdout", "\n\nBasic support algorithms:\n\n"];
	
	TestFixedToWeekDay[];
	TestFixedToJulianDay[];
	TestJulianDayToFixed[];

	WriteString["stdout", "\nArithmetic calendars:\n\n"];
	
	Map[TestCalendar, {
		Gregorian,
		Julian,
		Islamic,
		OldHinduSolar,
		OldHinduLunar
	}];
	
	WriteString["stdout", "\n"];

		WriteString["stdout", "\nAstronomical calendars:\n\n"];
	
	Map[TestCalendar, {
		HinduSolar,
		HinduLunar
	}];

	WriteString["stdout", "\nDate Formats:\n\n"];
	
	Map[WriteString["stdout", 
	        ToString[#] <> ": " <> 
	          ToString[ConvertDateTo[Gregorian[1965, May[], 15], #]] <> "\n"] &, 
	    Calendars[]];

	WriteString["stdout", "\nSome holidays:\n\n"];
	
	WriteString["stdout", "\nDone!"];
)

End[]



EndPackage[]
