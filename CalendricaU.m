
(*

 .d8888b.           888                        888         d8b                   
d88P  Y88b          888                        888         Y8P                   
888    888          888                        888                               
888         8888b.  888  .d88b.  88888b.   .d88888 888d888 888  .d8888b  8888b.  
888            "88b 888 d8P  Y8b 888 "88b d88" 888 888P"   888 d88P"        "88b 
888    888 .d888888 888 88888888 888  888 888  888 888     888 888      .d888888 
Y88b  d88P 888  888 888 Y8b.     888  888 Y88b 888 888     888 Y88b.    888  888 
 "Y8888P"  "Y888888 888  "Y8888  888  888  "Y88888 888     888  "Y8888P "Y888888 
 _____ _              __  __ _ _ _                  _                     _____     _ _ _   _             
FOURTH EDITION

Calendrica Mathematica 4.0, 1 April 2016


*)


(*
;;;; The Functions (code, comments, and definitions) contained in this
;;;; file (the "Program") were written by Edward M. Reingold and Nachum
;;;; Dershowitz (the "Authors"), who retain all rights to them except as
;;;; granted in the License and subject to the warranty and liability
;;;; limitations below.  These Functions are explained in the Authors'
;;;; book, "Calendrical Calculations: Third Edition" (Cambridge
;;;; University Press, second printing, 2008), and are subject to an international
;;;; copyright.
;;;;
;;;; The Authors' public service intent is more liberal than suggested
;;;; by the License below, as are their licensing policies for otherwise
;;;; nonallowed uses such as--without limitation--those in commercial,
;;;; web-site, and large-scale academic contexts.  Please see the
;;;; web-site
;;;;
;;;;     http://www.calendarists.com
;;;;
;;;; for all uses not authorized below; in case there is cause for doubt
;;;; about whether a use you contemplate is authorized, please contact
;;;; the Authors (e-mail: reingold@iit.edu).  For commercial
;;;; licensing information, contact the first author at the Department
;;;; of Computer Science, Illinois Institute of Technology,
;;;; Chicago, IL 60616-3729, USA.
;;;;
;;;; 1. LICENSE.  The Authors grant you a license for personal use only.
;;;; This means that for strictly personal use you may copy and use the
;;;; code, and keep a backup or archival copy also.  Any other uses,
;;;; including without limitation, allowing the code or its output to be
;;;; accessed, used, or available to others, is not permitted.
;;;;
;;;; 2. WARRANTY.
;;;;
;;;; (a) THE AUTHORS PROVIDE NO WARRANTIES OF ANY KIND, EITHER
;;;;     EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITING THE
;;;;     GENERALITY OF THE FOREGOING, ANY IMPLIED WARRANTY OF
;;;;     MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
;;;;
;;;; (b) THE AUTHORS SHALL NOT BE LIABLE TO YOU OR ANY THIRD PARTIES
;;;;     FOR DAMAGES OF ANY KIND, INCLUDING WITHOUT LIMITATION, ANY LOST
;;;;     PROFITS, LOST SAVINGS, OR ANY OTHER INCIDENTAL OR CONSEQUENTIAL
;;;;     DAMAGES ARISING OUT OF OR RELATED TO THE USE, INABILITY TO USE,
;;;;     OR INACCURACY OF CALCULATIONS, OF THE CODE AND FUNCTIONS
;;;;     CONTAINED HEREIN, OR THE BREACH OF ANY EXPRESS OR IMPLIED
;;;;     WARRANTY, EVEN IF THE AUTHORS OR PUBLISHER HAVE BEEN ADVISED OF
;;;;     THE POSSIBILITY OF THOSE DAMAGES.
;;;;
;;;; (c) THE FOREGOING WARRANTY MAY GIVE YOU SPECIFIC LEGAL
;;;;     RIGHTS WHICH MAY VARY FROM STATE TO STATE IN THE U.S.A.
;;;;
;;;; 3. LIMITATION OF LICENSEE REMEDIES.  You acknowledge and agree that
;;;; your exclusive remedy (in law or in equity), and Authors' entire
;;;; liability with respect to the material herein, for any breach of
;;;; representation or for any inaccuracy shall be a refund of the license
;;;; fee or service and handling charge which you paid the Authors, if any.
;;;;
;;;; SOME STATES IN THE U.S.A. DO NOT ALLOW THE EXCLUSION OR LIMITATION OF
;;;; LIABILITY FOR INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE ABOVE
;;;; EXCLUSIONS OR LIMITATION MAY NOT APPLY TO YOU.
;;;;
;;;; 4. DISCLAIMER.  Except as expressly set forth above, the Authors:
;;;;
;;;;   (a) make no other warranties with respect to the material in the
;;;;   Program and expressly disclaim any others;
;;;;
;;;;   (b) do not warrant that the material contained in the Program will
;;;;   meet your requirements or that their operation shall be
;;;;   uninterrupted or error-free;
;;;;
;;;;   (c) license this material on an "as is" basis, and the entire risk
;;;;   as to the quality, accuracy, and performance of the Program is
;;;;   yours, should the code prove defective (except as expressly
;;;;   warranted herein).  You alone assume the entire cost of all
;;;;   necessary corrections.
;;;;
;;;; Sample values for the functions (useful for debugging) are given in
;;;; Appendix C of the book.  These sample values are not available
;;;; electronically.
*)

Off[Remove::"rmnsm"]
Remove["Calendrica`*"]
Remove["Calendrica`Private`*"]
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



BeginPackage["Calendrica`"]

(*
;;;; Section: Usage

888     888                                     
888     888                                     
888     888                                     
888     888 .d8888b   8888b.   .d88b.   .d88b.  
888     888 88K          "88b d88P"88b d8P  Y8b 
888     888 "Y8888b. .d888888 888  888 88888888 
Y88b. .d88P      X88 888  888 Y88b 888 Y8b.     
 "Y88888P"   88888P' "Y888888  "Y88888  "Y8888  
                                   888          
                              Y8b d88P          
                               "Y88P"           
*)


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
			ToExpression[sfield <> "[Calendrica`Private`date_" <> scalendar <> "] ^:= Calendrica`Private`date[[" <> ToString[i] <> "]]"];
			ToExpression[sfield <> "::usage = \"" <> sfield <> "[date] returns the " <> sfield <> " component of the given calendar date. " <>
			sfield <> "[] returns the set of calendars whose dates have a " <> sfield <> " component.\""]
		];
		ToExpression[scalendar <> "Q[date_] := Map[Head, date] === " <> ToString[Apply[calendar, types]]];
	]

End[]


Calendrica::usage = "Calendrica is a package for generalized manipulation and
conversion of dates through various modern and historical calendars. It is based
on the work of Nachum Dershowitz and Edward M. Reingold in their book
_Calendrical Calculations_, the Millennium edition, published by Cambridge
University Press. The _Mathematica_ translation was performed by Robert C.
McNally <calendrica@dangerousgames.com> and continued by M. T."

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

TimePlus::usage = "TimePlus[list, s] adds s seconds to a Gregorian time list {year, month, day, hour, minute, second} and returns the new time as a list of 6 parameters. The parameter s can be negative."

TimeDistance::usage = "TimeDistance[list1, list2] takes two Gregorian time lists each with 6 parameters {year, month, day, hour, minute, second} and returns their distance in seconds."

EquiSol::usage="EquiSol[y] returns the equinoxes and solstices for a given year"

NeumondGregorian::usage="NeumondGregorian[y] returns all new moons in year y, the output are (proleptic) Gregorian dates, 
usuable in Astronomy to avoid calendar confusions."

VollmondGregorian::usage="VollmondGregorian[y] returns all full moons in year y, the output are (proleptic) Gregorian dates, 
usuable in Astronomy to avoid calendar confusions."

NeumondAlternate::usage="NeumondAlternate[y] returns all new moons in year y. If y < 1582, the year is Julian, else Gregorian.
For some historians useful, but brings confusion for dates earlier than the Julian Calendar."

VollmondAlternate::usage="VollmondAlternate[y] returns all full moons in year y. If y < 1582, the year is Julian, else Gregorian.
For some historians useful, but brings confusion for dates earlier than the Juian Calendar."

FullmoonQ::usage="FullmoonQ[date] returns True if a full moon falls in the given date."

NewmoonQ::usage="NewmoonQ[date] returns True if a full moon falls in the given date."

FullMoonAfter::usage = "FullMoonAfter[tee] returns the moment of next \
full moon after tee"

NewMoonAfter::usage = "NewMoonAfter[tee] returns the moment of next \
new moon after tee"

yearRealzahl::usage = "yearRealZahl[gdate] returns the Gregorian year and the following months, days etc as decimal number"

SonnenfinsternisTD::usage="SonnenfinsternisTD[year] returns all solar eclipses in year in dynamical time, after a simpfied algorithm by Meeus. Dynamical time returns dates of the years before 1582 as Julian dates"
 
MondfinsternisTD::usage="MondfinsternisTD[year] returns all lunar eclipses in year in dynamical time, after a simpfied algorithm by Meeus. Dynamical time returns dates of the years before 1582 as Julian dates"

InRangeQ::usage="InRangeQ[tee, range] returns True if $tee$ is in $range$."

ListRange::usage="ListRange[ell, range] returns those moments in list ell that occur in range."

ggg::usage= "ggg[{grad,min,sec}] wandelt {grad,min,sec} in 
 Bruchteile eines Grades." 

 gms::usage= "gms[{gg] wandelt Bruchteile eines Grades in 
{grad,min,sec}." 

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

(* ;;;; Section: Egyptian Calendar *)

Calendrica`Private`CalendarUsage[Egyptian, "Egyptian", "Egyptian"]
Calendrica`Private`CalendarFields[Egyptian,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

EgyptianEpoch::usage = "EgyptianEpoch[] returns the fixed date of the start of the
Egyptian (Nabonasser) calendar."

(* ;;;; Section: Secular Egyptian Calendar *)

Calendrica`Private`CalendarUsage[Egyptian, "EgyptianSecular", "EgyptianSecular"]
Calendrica`Private`CalendarFields[EgyptianSecular,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

(* ;;;; Section: Sumerian Calendar *)

Calendrica`Private`CalendarUsage[Sumerian, "Sumerian", "Sumerian"]
Calendrica`Private`CalendarFields[
  Sumerian, {CYear, CMonth, CDay}, {Integer, Integer, Integer}]
  
SumerianEpoch::usage = "SumerianEpoch[] returns the fixed date of first Sumerian day at beginning of Julian Calendar"

(* ;;;; Section: Assyrian Calendar *)

Calendrica`Private`CalendarUsage[Assyrian, "Assyrian", "Assyrian"]
Calendrica`Private`CalendarFields[
  Assyrian, {CYear, CMonth, CDay}, {Integer, Integer, Integer}]

AssyrianEpoch::usage = "AssyrianEpoch[] returns the fixed date of the first Kuzallu of the first year of Tiglath-Pileser"

(* ;;;; Section: Canaanite Calendar *)

Calendrica`Private`CalendarUsage[Canaanite, "Canaanite", "Canaanite"]
Calendrica`Private`CalendarFields[
  Canaanite, {CYear, CMonth, CDay}, {Integer, Integer, Integer}]

CanaaniteEpoch::usage = "CanaaniteEpoch[] returns the fixed date of the first Canaanite day at beginning of Julian Calendar"

(* ;;;; Section: Phoenician Calendar *)

Calendrica`Private`CalendarUsage[Phoenician, "Phoenician", "Phoenician"]
Calendrica`Private`CalendarFields[
  Phoenician, {CYear, CMonth, CDay}, {Integer, Integer, Integer}]

PhoenicianEpoch::usage = "PhoenicianEpoch[] returns the fixed date of the first Phoenician day at beginning of Julian Calendar"


(* ;;;; Section: BabylonianLong Calendar *)
Calendrica`Private`CalendarUsage[BabylonianLong, "BabylonianLong", "BabylonianLong"]
Calendrica`Private`CalendarFields[BabylonianLong,
	{CYear, CMonth, CLeap, CDay},
	{Integer, Integer, Symbol, Integer}]

    
Babylon::usage = "Babylon[] returns the location of Babylon"
BabylonianEpoch::usage = "BabylonianEpoch[] returns the fixed date of the start of the Babylonian calendar."
BabylonianLeapYearQ::usage = "BabylonianLeapYear[byear] returns True if the Babylonian byear is a leap year"
MoonLag::usage = "MoonLag[date, location] returns the lag between moonset and sunset in fixed date at locationn"
BabylonianCriterionQ::usage = "BabylonianCriterionQ[date] is True if an approximation between astronomical newmoon 
and its observation in fixed date is found"
BabylonianNewMonthOnOrBefore::usage = "BabylonianNewMonthOnOrBefore[date] returns the fixed date of last new month"

Calendrica`Private`CalendarUsage[Babylonian, "Babylonian", 
  "Babylonian"]
Calendrica`Private`CalendarFields[
  Babylonian, {CYear, CMonth, CDay}, {Integer, Integer, Integer}]

(* ;;;; Section: Zoroastrian Calendar *)

Calendrica`Private`CalendarUsage[Zoroastrian, "Zoroastrian", "Zoroastrian"]
Calendrica`Private`CalendarFields[Zoroastrian,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

ZoroastrianEpoch::usage = "ZoroastrianEpoch[] returns the fixed date of the start of the
Zoroastrian calendar."


Calendrica`Private`CalendarUsage[ElephantineEgyptian, "ElephantineEgyptian", "ElephantineEgyptian"]
Calendrica`Private`CalendarFields[
  ElephantineEgyptian, {CYear, CMonth, CDay}, {Integer, Integer, Integer}]

Calendrica`Private`CalendarUsage[ElephantineHebrew, "ElephantineHebrew", "ElephantineHebrew"]
Calendrica`Private`CalendarFields[
  ElephantineHebrew, {CYear, CMonth, CDay}, {Integer, Integer, Integer}]
  
ElephantineHebrewEpoch::usage = "ElephantineHebrewEpoch[] is 12 days after the BabylonianEpoch, 
the month starts with a full moon"

(* ;;;; Section: Samaritan Calendar *)
Calendrica`Private`CalendarUsage[Samaritan, "Samaritan", "Samaritan"]
Calendrica`Private`CalendarFields[Samaritan,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]
	
	
SamaritanEpoch::usage = "SamaritanEpoch[] returns the fixed date of the start of the
Samaritan calendar."
SamaritanNoon::usage = "SamaritanNoon[date_] returns universal time of true noon in SamaritanLocation"
SamaritanNewMoonAfter::usage = "SamaritanNewMoonAfter[tee] returns the fixed date of first new moon after UT time tee"
SamaritanNewMoonAtOrBefore::usage = "SamaritanNewMoonAtOrBefore[tee] returns the fixed date of last new moon before UT time tee"
SamaritanNewYearOnOrBefore::usage = "SamaritanNewYearOnOrBefore[date] returns the fixed date of new year on or before fixed date"

(* ;;;; Section: Olympiad *)

Calendrica`Private`CalendarUsage[Olympiad, "Olympiad", "Olympiad"]

OlympiadStart::usage = "OlympiadStart[] returns the year in Julian calendar, when the old Olympiads started, 776 BCE"

OlympiadFromJulianYear::ussage = "OlympiadFromJulianYear[j] teturns for a given Julian year which Olympiad cycle happened and which year of this cycle. Warning: It returns also answers for dates where Olympiads were over"

JulianYearFromOlympiad::usage = "JulianYearFromOlympiad[cycle,year] returns from a given Olympiad cycle and it's year the Julian year it occured. Warning: It accepts also cycles that never happened"

OlympiadExact::usage = "OlympiadExact[cycle, year] returns from a given Olympiad cycle and it's year the exact day in Julian calendar it started. It doesn't accept unvalid cycles"

(* ;;;; Section: MacedonianSeleucid Calendar *)

Calendrica`Private`CalendarUsage[MacedonianSeleucid, "MacedonianSeleucid", "MacedonianSeleucid"]
Calendrica`Private`CalendarFields[
  MacedonianSeleucid, {CYear, CMonth, CDay}, {Integer, Integer, Integer}]
  
MacedonianSeleucidEpoch::usage = "MacedonianSeleucidEpoch[] returns the fixed date of 1.Dios  -312 B.C.E (victory of Seleucos)"

(* ;;;; Section: Qussay Calendar *)

Calendrica`Private`CalendarUsage[Qussay, "Qussay", "Qussay"]
Calendrica`Private`CalendarFields[
  Qussay, {CYear, CMonth, CDay}, {Integer, Integer, Integer}]
  
QussayEpoch::usage = "QussayEpoch[] returns the fixed date when Qussay invented his calendar"

(* ;;;; Section: Armenian Calendar *)

Calendrica`Private`CalendarUsage[Armenian, "Armenian", "Armenian"]
Calendrica`Private`CalendarFields[Armenian,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

ArmenianEpoch::usage = "ArmenianEpoch[] returns the fixed date of the start of the
Armenian calendar."

(* ;;;; Section: Coligny Calendar *)

Calendrica`Private`CalendarUsage[Coligny, "Coligny", "Coligny"]
Calendrica`Private`CalendarFields[Coligny,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

ColignyEpoch::usage = "ColignyEpoch[] returns the fixed date of the start of the
Coligny calendar."


(* ;;;; Section: Observational Hebrew Calendar *)

Calendrica`Private`CalendarUsage[ObservationalHebrew, "observational Hebrew", "Observational Hebrew"]
Calendrica`Private`CalendarFields[ObservationalHebrew,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

AstronomicalEaster::usage = "AstronomicalEaster[gYear] returns the date of
(proposed) astronomical Easter in Gregorian year $gYear$."

Jaffa::usage = "Jaffa[] returns the location of Jaffa, Israel."

ObservationalHebrewNewYear::usage = "ObservationalHebrewNewYear[gYear] returns the fixed date of the observational (classical) Nisan 1 occuring in Gregorian year gYear"

ClassicalPassoverEve::usage = "ClassicalPassoverEve[gYear] returns the fixed date
of Classical (observational) Passover Eve (Nisan 14) occurring in Gregorian year
$gYear$."

(* ;;;; Section: Hebrew Calendar *)

Calendrica`Private`CalendarUsage[Hebrew, "Hebrew (Jewish)", "Hebrew"]
Calendrica`Private`CalendarFields[Hebrew,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

Tishri::usage = "Tishri represents a month on the Hebrew calendar. Tishri[]
returns a corresponding numerical constant."

Nisan::usage = "Nisan represents a month on the Hebrew calendar. Nisan[] returns
a corresponding numerical constant."

HebrewEpoch::usage = "HebrewEpoch[] returns the fixed date of the start of the
Hebrew calendar, that is, Tishri 1, 1 AM"

HebrewLeapYearQ::usage = "HebrewLeapYearQ[hYear] returns True if $hYear$ is a leap
year on the Hebrew calendar, False otherwise."

SabbatYearQ::usage = "SabbatYearQ[year] returns True if year is a Sabbatical year"

LastMonthOfHebrewYear::usage = "LastMonthOfHebrewYear[hYear] returns the last month
of the Hebrew $hYear$."

LastDayOfHebrewMonth::usage = "LastDayOfHebrewMonth[hMonth, hYear] returns the last
day of $hMonth$ in Hebrew $hYear$."

HebrewCalendarElapsedDays::usage = "HebrewCalendarElapsedDays[hYear] returns the
number of days elapsed from the (Sunday) noon prior to the epoch of the Hebrew
calendar to the mean conjunction (molad) of Tishri of Hebrew year $h-year$, or
one day later."

HebrewNewYear::usage = "HebrewNewYear[hYear] returns the fixed date of the Hebrew
new year $hYear$."

HebrewNewYearDelay::usage = "HebrewNewYearDelay[hYear] returns delays to start of
Hebrew year to keep ordinary year in range 353-356 and leap year in range
383-386."

Molad::usage = "Molad[hMonth, hYear] returns the moment of mean conjunction of $h-month$ 
in Hebrew $h-year$."
  
DaysInHebrewYear::usage = "DaysInHebrewYear[hYear] returns the number of days in
Hebrew $hYear$."

LongMarheshvanQ::usage = "LongMarheshvanQ[hYear] returns True if Marheshvan is long
in Hebrew $hYear$, False otherwise."

ShortKislevQ::usage = "ShortKislevQ[hYear] returns True if Kislev is short in
Hebrew $hYear$, False otherwise."

YomKippur::usage = "YomKippur[gYear] returns the fixed date of te Yom Kippur occurring
in Gregorian $gYear$."

Gedaliah::usage = "Gedaliah[gYear] returns the fixed date of the fast of Gedaliah occurring
in Gregorian $gYear$."

Passover::usage = "Passover[gYear] returns the fixed date of Passover occurring in
Gregorian $gYear$."

Omer::usage = "Omer[date] returns a list of the form {weeks, days} containing the
number of elapsed weeks and days in the omer at the fixed $date$. Returns Bogus
if that date does not fall during the omer."

Purim::usage = "Purim[gYear] returns the fixed date of Purim occurring in Gregorian
$gYear$."

TaAnitEsther::usage = "TaAnitEsther[gYear] returns the fixed date of Ta'anit Esther
occurring in Gregorian $gYear$."

TishahBeAv::usage = "TishahBeAv[gYear] returns the fixed date of Tisha be-Av
occurring in Gregorian $gYear$."

BirkathHaHama::usage = "BirkathHaHama[gYear] returns a list of the fixed dates of
Birkath ha-Hama occurring in Gregorian $gYear$, if it occurs."

ShEla::usage = "ShEla[gYear] returns a list of the fixed dates of Sh'ela occurring
in Gregorian $gYear$."

YomHaZikkaron::usage = "YomHaZikkaron[gYear] returns the fixed date of Yom
ha-Zikkaron occurring in Gregorian $gYear$."

HebrewBirthday::usage = "HebrewBirthday[hBirthDate, hYear] returns the fixed date
of the anniversary of Hebrew $hBirthDate$ occurring in Hebrew $hYear$."

HebrewBirthdayInGregorian::usage = "HebrewBirthdayInGregorian[hBirthDate, gYear]
returns a list of the fixed dates of the anniversary of Hebrew $hBirthDate$
occurring in Gregorian $gYear$."

Yahrzeit::usage = "Yahrzeit[hDeathDate, hYear] returns the fixed date of the
anniversary of Hebrew $hDeathDate$ occurring in Hebrew $hYear$."

YahrzeitInGregorian::usage = "YahrzeitInGregorian[hDeathDate, gYear] returns a list
of the fixed dates of the anniversary of Hebrew $hDeathDate$ occurring in
Gregorian $gYear$."

JewishDusk::usage = "JewishDusk[date, locale] returns the standard time of Jewish
dusk on fixed $date$ at $locale$ (as per Vilna Gaon)."

JewishSabbathEnds::usage = "JewishSabbathEnds[date, locale] returns the standard
time of end of Jewish sabbath on fixed $date$ at $locale$ (as per Berthold
Cohn)."

TemporalHour::usage = "TemporalHour[date, locale] returns the length of daytime
temporal hour on fixed $date$ at $locale$."

StandardFromSundial::usage = "StandardFromSundial[date, hour, locale] returns the
standard time on fixed $date$ of temporal $hour$ at $locale$."

JewishMorningEnd::usage = "JewishMorningEnd[date, locale] returns the standard time
on fixed $date$ at $locale$ of the end of morning according to Jewish ritual."

(* ;;;; Section: Old Hindu Calendars *)

Calendrica`Private`CalendarUsage[OldHinduSolar, "old (mean) Hindu (Indian) solar", "old Hindu solar"]
Calendrica`Private`CalendarFields[OldHinduSolar,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

Calendrica`Private`CalendarUsage[OldHinduLunar, "old (mean) Hindu (Indian) lunisolar", "old Hindu lunisolar"]
Calendrica`Private`CalendarFields[OldHinduLunar,
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

(* ;;;; Section: Alexandrian Calendar *)
Calendrica`Private`CalendarUsage[Alexandrian, "Alexandrian", "Alexandrian"]
Calendrica`Private`CalendarFields[Alexandrian,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]


(* ;;;; Section: Julian Calendar *)

Calendrica`Private`CalendarUsage[Julian, "old civil (Julian)", "Julian"]
Calendrica`Private`CalendarFields[Julian,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

JulianEpoch::usage = "JulianEpoch[] returns the fixed date of start of the Julian
calendar."

BCE::usage = "BCE[n] returns the negation of $n$ and is used to mark BCE julian
years."

CE::usage = "CE[n] returns $n$ and is used to mark CE julian years."

JulianLeapYearQ::usage = "JulianLeapYearQ[jYear] returns True if $jYear$ is a leap
year on the Julian calendar, and False otherwise."


(* ;;;; Section: Julian calendar with Roman nomenclature *)

Calendrica`Private`CalendarUsage[Roman, "Roman nomenclature of the Julian", "Roman nomenclature"]
Calendrica`Private`CalendarFields[Roman,
	{CYear, CMonth, CEvent, CCount, CLeapDay},
	{Integer, Integer, Integer, Integer, Symbol}]

Kalends::usage = "Kalends represents the Kalends of the month according to Roman
nomenclature. Kalends[] returns a corresponding numeric constant."

Nones::usage = "Nones represents the Nones of the month according to Roman
nomenclature. Nones[] returns a corresponding numeric constant."

Ides::usage = "Ides represents the Ides of the month according to Roman
nomenclature. Nones[] returns a corresponding numeric constant."

IdesOfMonth::usage = "IdesOfMonth[month] returns the date of Ides in Roman
$month$."

NonesOfMonth::usage = "NonesOfMonth[month] returns the date of Nones in Roman
$month$."

(* ;;;; Section: Coptic Calendar *)

Calendrica`Private`CalendarUsage[Coptic, "Coptic", "Coptic"]
Calendrica`Private`CalendarFields[Coptic,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

CopticEpoch::usage = "CopticEpoch[] returns the fixed date of start of the Coptic
calendar."

CopticLeapYearQ::usage = "CopticLeapYearQ[cYear] returns True if $cYear$ is a leap
year on the Coptic calendar, False otherwise."

CopticInGregorian::usage = "CopticInGregorian[cMonth, cDay, gYear] returns a list
of the fixed dates of Coptic $cMonth$ and $cDay$ that occur in Gregorian
$gYear$."

CopticChristmas::usage = "CopticChristmas[gYear] returns a list of zero or one
fixed dates of Coptic Christmas in Gregorian $gYear$."

(* ;;;; Section: EgyptianNew Calendar *)

Calendrica`Private`CalendarUsage[EgyptianNew, "EgyptianNew", "EgyptianNew"]
Calendrica`Private`CalendarFields[EgyptianNew,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

(* ;;;; Section: Ethiopic Calendar *)

Calendrica`Private`CalendarUsage[Ethiopic, "Ethiopic", "Ethiopic"]
Calendrica`Private`CalendarFields[Ethiopic,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

EthiopicEpoch::usage = "EthiopicEpoch[] returns the fixed date of start of the
Ethiopic calendar."

(* ;;;; Section: Qumran Calendar *)
Calendrica`Private`CalendarUsage[Qumran, "Qumran", "Qumran"]
Calendrica`Private`CalendarFields[Qumran,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

QumranEpoch::usage = "QumranEpoch[] returns the fixed date of the start of the Qumran calendar"

PriesthoodWeek::usage = "PriesthoodWeek[date] returns the name of the Week and of the Day of the fixed date"

Calendrica`Private`CalendarUsage[Ezdra, "Ezdra", "Ezdra"]
Calendrica`Private`CalendarFields[Ezdra,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]
	
EzdraEpoch::usage = "EzdraEpoch[] returns the fixed date of the start of the 4Ezdra calendar"


(* ;;;; Section: BLC Calendar *)
Calendrica`Private`CalendarUsage[BLC, "BLC", "BLC"]
Calendrica`Private`CalendarFields[BLC,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

BLCNewYear::usage = "BLCNewYear[gYear] returns for the Gregorian Year gYear the Gregorian date that
represents BLC[gYear,1,1]"

(* ;;;; Section: Persian Calendar *)

Calendrica`Private`CalendarUsage[Persian, "Persian astronomical", "Persian"]
Calendrica`Private`CalendarFields[Persian,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

PersianEpoch::usage = "PersianEpoch[] returns the fixed date of the start of the
Persian calendar."

Tehran::usage = "Tehran[] returns the Location of Tehran, Iran.";

MiddayInTehran::usage = "MiddayInTehran[date] returns the Universal time of midday
on fixed $date$ in Tehran."

PersianNewYearOnOrBefore::usage = "PersianNewYearOnOrBefore[date] returns the fixed
date of the Astronomical Persian New Year on or before fixed $date$."

NawRuz::usage = "NawRuz[gYear] returns the fixed date of the Persian New Year
(Naw-Ruz) in Gregorian $gYear$."

(* ;;;; Section: Arithmetic Persian Calendar *)

Calendrica`Private`CalendarUsage[ArithmeticPersian, "arithmetic Persian", "arithmetic Persian"]
Calendrica`Private`CalendarFields[ArithmeticPersian,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

ArithmeticPersianLeapYearQ::usage = "ArithmeticPersianLeapYearQ[pYear] returns True
if $pYear$ is a leap year on the Persian calendar, False otherwise."

ArithmeticPersianYearFromFixed::usage = "ArithmeticPersianYearFromFixed[date]
returns the Persian year corresponding to the fixed $date$."


(* ;;;; Section: Observational Islamic Calendar *)

Calendrica`Private`CalendarUsage[ObservationalIslamic, "observational Islamic (Moslem)", "Observational Islamic"]
Calendrica`Private`CalendarFields[ObservationalIslamic,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

Cairo::usage = "Cairo[] returns the Location of Cairo, Egypt."

IslamicLocale::usage = "IslamicLocale[] returns a sample location for the
Observational Islamic calendar (Cairo, Egypt)."


(* ;;;; Section: Islamic Calendar *)

Calendrica`Private`CalendarUsage[Islamic, "arithmetic Islamic (Moslem)", "Islamic"]
Calendrica`Private`CalendarFields[Islamic,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

IslamicEpoch::usage = "IslamicEpoch[] returns the fixed date of the start of the
Islamic calendar."

IslamicLeapYearQ::usage = "IslamicLeapYearQ[iYear] returns True if $iYear$ is an
Islamic leap year, False otherwise."

IslamicInGregorian::usage = "IslamicInGregorian[iMonth, iDay, gYear] returns a list
of the fixed dates of Islamic $iMonth$ and $iDay$ that occur in Gregorian
$gYear$."

MawlidAnNabi::usage = "MawlidAnNabi[gYear] returns a list of the fixed dates of
Mawlid-an-Nabi occurring in Gregorian $gYear$."

Asr::usage = "Asr[date, locale] returns the standard time of asr on fixed $date$ at
$locale$."

(* ;;;; Section: Chinese Calendar *)

Calendrica`Private`CalendarUsage[Chinese, "Chinese", "Chinese"]
Calendrica`Private`CalendarFields[Chinese,
	{CCycle, CYear, CMonth, CLeapMonth, CDay},
	{Integer, Integer, Integer, Symbol, Integer}]

ChineseSolarLongitudeOnOrAfter::usage = "ChineseSolarLongitudeOnOrAfter[date,
theta] returns the Moment (Beijing time) of the first date on or after fixed $date$
(Beijing time) when the solar longitude will be $theta$ degrees."

MidnightInChina::usage = "MidnightInChina returns the Universal time of (clock)
midnight at the start of fixed $date$ in China."

ChineseWinterSolsticeOnOrBefore::usage = "ChineseWinterSolsticeOnOrBefore[date]
returns the Fixed date, in the Chinese zone, of the winter solstice on or before
fixed $date$."

ChineseNewYearInSui::usage = "ChineseNewYearInSui[date] returns the Fixed date of
Chinese New Year in sui (period from solstice to solstice) containing $date$."

ChineseNewYearOnOrBefore::usage = "ChineseNewYearOnOrBefore[date] returns the Fixed
date of Chinese New Year on or before fixed $date$."

ChineseNewYear::usage = "ChineseNewYear[gYear] returns the fixed date of Chinese
New Year in Gregorian $gYear$."

ChineseName::usage = "ChineseName[stem, branch] returns the Chinese name for the
stem/branch combination. Returns bogus if the stem/branch combination is
impossible."

ChineseStem::usage = "ChineseStem[name] returns the stem component of the Chinese
name."

ChineseBranch::usage = "ChineseBranch[name] returns the branch component of the
Chinese name."

ChineseDayNameEpoch::usage = "ChineseDayNameEpoch[] returns the index of Chinese
sexagesimal name of RD 1."

ChineseMonthNameEpoch::usage = "ChineseMonthNameEpoch[] returns the index of
Chinese sexagesimal name of month 1 of Chinese year 1."

ChineseNameDifference::usage = "ChineseNameDifference[name1, name2] returns the
number of names from Chinese name $name1$ to the next occurrence of Chinese name
$name2$."

ChineseDayNameOnOrBefore::usage = "ChineseDayNameOnOrBefore[name, date] returns the
fixed date of the latest date on or before fixed $date$ that has Chinese $name$."

CurrentMajorSolarTerm::usage = "CurrentMajorSolarTerm[date] returns the last
Chinese major solar term (zhongqi) before fixed $date$."

MajorSolarTermOnOrAfter::usage = "MajorSolarTermOnOrAfter[date] returns the Fixed
date (in Beijing) of the first Chinese major solar term (zhongqi) on or after
fixed $date$. The major terms begin when the sun's longitude is a multiple of 30
degrees."

CurrentMinorSolarTerm::usage = "CurrentMinorSolarTerm[date] returns the last
Chinese minor solar term (jieqi) before $date$."

MinorSolarTermOnOrAfter::usage = "MinorSolarTermOnOrAfter[date] returns the moment
(in Beijing) of the first Chinese minor solar term (jieqi) on or after fixed
$date$. The minor terms begin when the sun's longitude is an odd multiple of 15
degrees."

ChineseNewMoonBefore::usage = "ChineseNewMoonBefore[date] returns the Fixed date
(Beijing) of first new moon before fixed $date$."

ChineseNewMoonOnOrAfter::usage = "ChineseNewMoonOnOrAfter[date] returns the fixed
date (Beijing) of first new moon on or after fixed $date$."

ChineseNoMajorSolarTermQ::usage = "ChineseNoMajorSolarTermQ[date] is the same as NoMajorSolarTermQ"

ChinesePriorLeapMonthQ::usage = "ChinesePriorLeapMonthQ is the same as PriorLeapMonthQ"

ChineseEpoch::usage = "ChineseEpoch[] returns the fixed date of start of the
Chinese calendar."

NoMajorSolarTermQ::usage = "NoMajorSolarTermQ[date] returns True if the Chinese
lunar month starting on $date$ has no major solar term."

PriorLeapMonthQ::usage = "PriorLeapMonthQ[mPrime, m] returns True if there is a
Chinese leap month on or after the lunar month starting on fixed day $mPrime$ and
at or before the lunar month starting at fixed date $m$."

ChineseSexagesimalName::usage = "ChineseSexagesimalName[n] returns the the $n$-th
name of the Chinese sexagesimal cycle."

ChineseNameOfYear::usage = "ChineseNameOfYear[year] returns the Sexagesimal name
for Chinese $year$ of any cycle."

ChineseNameOfMonth::usage = "ChineseNameOfMonth[year, month] returns the
Sexagesimal name for $month$ of Chinese $year$."

ChineseNameOfDay::usage = "ChineseNameOfDay[date] returns the Chinese sexagesimal
name for $date$."

DragonFestival::usage = "DragonFestival[gYear] returns the fixed date of the
Chinese Dragon Festival in Gregorian $gYear$."

QingMing::usage = "QingMing[gYear] returns the fixed date of Qingming in Gregorian
$gYear$."

ChineseAge::usage = "ChineseAge[birthdate, date] returns the age at fixed $date$,
given Chinese $birthdate$, according to the Chinese custom."

Beijing::usage = "Beijing[tee] returns the Location of Beijing, China. The time
zone varies with $tee$."

ChineseLocation::usage = "ChineseLocation[tee] returns the Location of Beijing,
China. The time zone varies with $tee$."

Tokyo::usage = "Tokyo[date] returns the Location of Tokyo, Japan. Location varies
with $date$."

JapaneseLocation::usage = "JapaneseLocation[date] returns the Location of Tokyo,
Japan. Location varies with $date$."

KoreanLocation::usage = "KoreanLocation[date] returns the main Location of Korea, 
that varies with $date$."

VietnameseLocation::usage = "VietnameseLocation[date] returns the main Location of Vietnam, 
that varies with $date$."

(* Section: Dee calendar *)

Calendrica`Private`CalendarUsage[Dee, "Dee", "Dee"]
Calendrica`Private`CalendarFields[Dee,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

DeeLeapQ::usage = "DeeLeapQ[year] is true if year is a leap year in Dee calendar"
numDaysInDeeMonth::usage = "numDaysInDeeMonth[month] returns the number of days in a Dee month"


(* ;;;; Section: Modern Hindu Calendars *)

Calendrica`Private`CalendarUsage[HinduLunar, "new (true) Hindu (Indian) lunisolar", "new Hindu lunisolar"]
Calendrica`Private`CalendarFields[HinduLunar,
	{CYear, CMonth, CLeapMonth, CDay, CLeapDay},
	{Integer, Integer, Symbol, Integer, Symbol}]

Calendrica`Private`CalendarUsage[HinduSolar, "new (true) Hindu (Indian) solar", "new Hindu solar"]
Calendrica`Private`CalendarFields[HinduSolar,
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


(* ;;;; Section: Tibetan Calendar *)
Calendrica`Private`CalendarUsage[Tibetan, "Tibetan", "Tibetan"]
Calendrica`Private`CalendarFields[Tibetan,{CYear, CMonth,CLeapMonth, CDay,CLeapDay},
{Integer,Integer,Symbol,Integer,Symbol}]

TibetanEpoch::usage = "TibetanEpoch[] returns the fixed date of start of the Tibetan
 calendar."

TibetanSunEquation::usage = "TibetanSunEquation[alpha] returns the interpolated tabular sine of
solar anomaly alpha."

TibetanMoonEquation::usage = "TibetanMoonEquation[alpha] returns the interpolated tabular sine of
lunar anomaly alpha."

TibetanLeapMonthQ::usage = "TibetanLeapMonthQ[tmonth, tyear] returns True if tmonth is leap in 
Tibetan year tyear."

Losar::usage = "Losar[tyear] returns the fixed date of Tibetan New Year in Tibetan year tyear."

TibetanNewYear::usage = "TibetanNewYear[gyear] returns a list of fixed dates of Tibetan New Year
in Gregorian year gYear."

(* ;;;; Section: Mayan Calendars *)

Calendrica`Private`CalendarUsage[MayanLongCount, "Mayan long count", "long count"]
Calendrica`Private`CalendarFields[MayanLongCount,
	{CBaktun, CKatun, CTun, CUinal, CKin},
	{Integer, Integer, Integer, Integer, Integer}]

Calendrica`Private`CalendarUsage[MayanHaab, "Mayan haab", "haab"]
Calendrica`Private`CalendarFields[MayanHaab,
	{CMonth, CDay},
	{Integer, Integer}]

Calendrica`Private`CalendarUsage[MayanTzolkin, "Mayan tzolkin", "tzolkin"]
Calendrica`Private`CalendarFields[MayanTzolkin,
	{CNumber, CName},
	{Integer, Integer}]

MayanEpoch::usage = "MayanEpoch[] returns the fixed date of start of the Mayan
calendar, according to the Goodman-Martinez-Thompson correlation. That is, August
11, -3113."

MayanHaabOrdinal::usage = "MayanHaabOrdinal[hDate] returns the number of days into
the cycle of Mayan haab date $hDate$."

MayanHaabEpoch::usage = "MayanHaabEpoch[] returns the fixed date of the start of
the haab cycle."

MayanHaabOnOrBefore::usage = "MayanHaabOnOrBefore[hDate, date] returns the fixed
date of the latest date on or before the $date$ that is Mayan haab $hDate$."

MayanTzolkinOrdinal::usage = "MayanTzolkinOrdinal[tDate] returns the number of days
into the Mayan tzolkin cycle of $tDate$."

MayanTzolkinEpoch::usage = "MayanTzolkinEpoch[] returns the fixed date of the start
of the tzolkin date cycle."

MayanTzolkinOnOrBefore::usage = "MayanTzolkinOnOrBefore[tzolkin, date] returns the
fixed date of the latest date on or before the fixed $date$ that is Mayan tzolkin
date $tzolkin$."

MayanCalendarRoundOnOrBefore::usage = "MayanCalendarRoundOnOrBefore[haab,
tzolkin, date] returns the fixed date of the latest date on or before $date$, that
is Mayan haab date $haab$ and tzolkin date $tzolkin$. Returns Bogus if such a
haab-tzolkin combination is impossible."

(* ;;;; Section: Aztec Calendars *)

Calendrica`Private`CalendarUsage[AztecXihuitl, "AztecXihuitl", "AztecXihuitl"]
Calendrica`Private`CalendarFields[AztecXihuitl,
	{CMonth, CDay},
	{Integer, Integer}]

Calendrica`Private`CalendarUsage[AztecTonalpohualli, "AztecTonalpohualli", "AztecTonalpohualli"]
Calendrica`Private`CalendarFields[AztecTonalpohualli,
	{CNumber, CName},
	{Integer, Integer}]

AztecXihuitlOnOrBefore::usage= "AztecXihuitlOnOrBefore[xihuitl, date] returns the
fixed date on or before the input date where the given xihuitl month-day appears"

AztecTonalpohualliOnOrBefore::usage= "AztecTonalpohualliOnOrBefore[tonalpohualli, date] returns the
fixed date on or before the input date where the given tonalpohualli number-name appears"

AztecXiuhmolpilli::usage=" AztecXiuhmolpilli[date] returns the time for xihuitl and tonalpohualli to realign,
output in tonalpohualli"

AztecXihuitlTonalpohualliOnOrBefore::usage= "AztecXihuitlTonalpohualliOnOrBefore[xihuitl, 
 tonalpohualli, date] returns the fixed date on or before the input date where both the
given xihuitl month-day and the given tonalpohualli number-name appear"

(* ;;;; Section: Balinese Calendar *)

Calendrica`Private`CalendarUsage[Balinese, "Balinese Pawukon", "Balinese Pawukon"]
Calendrica`Private`CalendarFields[Balinese,
	{CLuang, CDwiwara, CTriwara, CCaturwara, CPancawara, CSadwara, CSaptawara, CAsatawara, CSangawara, CDasawara},
	{Symbol, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer}]

BaliEpoch::usage = "BaliEpoch[] returns the fixed date of start of a Balinese
Pawukon cycle."

BaliDayFromFixed::usage = "BaliDayFromFixed[date] returns the position of $date$ in
the 210-day Pawukon cycle."

BaliLuangFromFixed::usage = "BaliLuangFromFixed[date] returns True if $date$ is a
member of the \"1-day\" Balinese cycle, False otherwise."

BaliDwiwaraFromFixed::usage = "BaliDwiwaraFromFixed[date] returns the position of
$date$ in the 2-day Balinese cycle."

BaliTriwaraFromFixed::usage = "BaliTriwaraFromFixed[date] returns the position of
$date$ in the 3-day Balinese cycle."

BaliCaturwaraFromFixed::usage = "BaliCaturwaraFromFixed[date] returns the position
of $date$ in the 4-day Balinese cycle."

BaliPancawaraFromFixed::usage = "BaliPancawaraFromFixed[date] returns the position
of $date$ in the 5-day Balinese cycle."

BaliSadwaraFromFixed::usage = "BaliSadwaraFromFixed[date] returns the position of
$date$ in the 6-day Balinese cycle."

BaliSaptawaraFromFixed::usage = "BaliSaptawaraFromFixed[date] returns the position
of $date$ in the 7-day Balinese cycle."

BaliAsatawaraFromFixed::usage = "BaliAsatawaraFromFixed[date] returns the position
of $date$ in the 8-day Balinese cycle."

BaliSangawaraFromFixed::usage = "BaliSangawaraFromFixed[date] returns the position
of $date$ in the 9-day Balinese cycle."

BaliDasawaraFromFixed::usage = "BaliDasawaraFromFixed[date] returns the position of
$date$ in the 10-day Balinese cycle."

BaliWeekFromFixed::usage = "BaliWeekFromFixed[date] returns the week number of
$date$ in the Balinese cycle."

BaliOnOrBefore::usage = "BaliOnOrBefore[bDate, date] returns the last fixed date on
or before $date$ with Pawukon $bDate$."

BaliDay::usage = "BaliDay[bDate] returns the position of $bDate$ in the 210-day
Pawukon cycle."

BaliWeek::usage = "BaliWeek[bDate] returns the week number of $bDate$ in the
Balinese cycle."

PositionsInInterval::usage = "PositionsInInterval[n, c, capDelta, start, end]
returns a list of occurrences of the $n$-th day of $c$-day cycle between $start$
and $end$ dates (inclusive). $cap-Delta$ is position in cycle of RD 0."

KajengKeliwonInGregorian::usage = "KajengKeliwonInGregorian[gYear] returns a list
of occurrences of Kajeng Keliwon (9th day of each 15-day subcycle of Pawukon) in
Gregorian $gYear$."

TumpekInGregorian::usage = "TumpekInGregorian[gYear] returns a list of Occurrences
of Tumpek (14th day of Pawukon and every 35th subsequent day) within Gregorian
$gYear$."

(* ;;;; Section: Icelandic Calendar *)

Calendrica`Private`CalendarUsage[Icelandic, "Icelandic", "Icelandic"]
Calendrica`Private`CalendarFields[Icelandic,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

IcelandicEpoch::usage = "IcelandicEpoch[] returns the fixed date of the start of the
Icelandic calendar."

(* ;;;; Section: Gregorian Calendar *)

Calendrica`Private`CalendarUsage[Gregorian, "present civil (Gregorian)", "Gregorian"]
Calendrica`Private`CalendarFields[Gregorian,
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

DaylightSavingStart::usage = "DaylightSavingStart[gYear] returns the fixed date of
the start of United States daylight saving time in Gregorian $gYear$-- the first
Sunday in April."

DaylightSavingEnd::usage = "DaylightSavingEnd[gYear] returns the fixed date of the
end of United States daylight saving time in Gregorian $gYear$-- the last Sunday
in October."

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


(* ;;;; Section: French Revolutionary Calendar *)

Calendrica`Private`CalendarUsage[French, "original form of the French Revolutionary", "French Revolutionary"]
Calendrica`Private`CalendarFields[French,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

FrenchEpoch::usage = "FrenchEpoch[] returns the fixed date of start of the French
Revolutionary calendar."

Paris::usage = "Paris[] returns the Location of Paris, France."

MidnightInParis::usage = "MidnightInParis[date] returns the Universal time of true
midnight at the end of fixed $date$ in Paris."

FrenchNewYearOnOrBefore::usage = "FrenchNewYearOnOrBefore[date] returns the fixed
date of the French Revolutionary New Year on or before fixed $date$."


(* ;;;; Section: Modified French Revolutionary Calendar *)

Calendrica`Private`CalendarUsage[ModifiedFrench, "modified form of the French Revolutionary", "modified French Revolutionary"]
Calendrica`Private`CalendarFields[ModifiedFrench,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]

ModifiedFrenchLeapYearQ::usage = "ModifiedFrenchLeapYearQ[fYear] returns True if
$fYear$ is a leap year on the French Revolutionary calendar, False otherwise."

(* ;;;; Section: Yazdegerd Calendar *)

Calendrica`Private`CalendarUsage[Yazdegerd, "Yazdegerd", "Yazdegerd"]
Calendrica`Private`CalendarFields[Yazdegerd,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]
	
	(* ;;;; Section: Illuminati Calendar *)

Calendrica`Private`CalendarUsage[Illuminati, "Illuminati", "Illuminati"]
Calendrica`Private`CalendarFields[Illuminati,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]
	
illuInfo::usage= "illuInfo{illuminatidate] returns infos about the seasons"

(* ;;;; Section: Bahai Calendar *)

Calendrica`Private`CalendarUsage[Bahai, "Baha'i", "Baha'i"]
Calendrica`Private`CalendarFields[Bahai,
	{CMajor, CCycle, CYear, CMonth, CDay},
	{Integer, Integer, Integer, Integer, Integer}]

BahaiEpoch::usage = "BahaiEpoch[] returns the fixed date of the start of the Baha'i
calendar."

AyyamIHa::usage = "AyyamIHa represents an intercalary period of 4 or 5 days on
the Baha'i calendar. AyyamIHa[] returns a corresponding numerical constant."

BahaiNewYear::usage = "BahaiNewYear[gYear] returns the fixed date of the Baha'i New
Year in Gregorian $gYear$."

(* ;;;; Section: JW Calendar *)
Calendrica`Private`CalendarUsage[JW, "JW", "JW"]
Calendrica`Private`CalendarFields[JW,
	{CYear, CMonth, CDay},
	{Integer, Integer, Integer}]


(* ;;;; Section: ISO Calendar *)

Calendrica`Private`CalendarUsage[ISO, "ISO commercial", "ISO"]
Calendrica`Private`CalendarFields[ISO,
	{CYear, CWeek, CDay},
	{Integer, Integer, Integer}]

(* ;;;; Section: Future Bahai Calendar *)

Calendrica`Private`CalendarUsage[FutureBahai, "Future Baha'i", "Future Baha'i"]
Calendrica`Private`CalendarFields[FutureBahai,
	{CMajor, CCycle, CYear, CMonth, CDay},
	{Integer, Integer, Integer, Integer, Integer}]

Haifa::usage = "Haifa[] returns the Location of Haifa, Israel."

SunsetInHaifa::usage = "SunsetInHaifa[date] returns the Universal time of sunset of
evening before fixed $date$ in Haifa."

FutureBahaiNewYearOnOrBefore::usage = "FutureBahaiNewYearOnOrBefore[date] returns
the Fixed date of the Future Bahai New Year on or before fixed $date$."

FeastOfRidvan::usage = "FeastOfRidvan[gYear] returns the fixed date of the Baha'i
Feast of Ridvan in Gregorian $gYear$."


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

Sonnenaufgang::"Sonnenaufgang[date, locale] returns the standard time not-gms of sunrise on
$date$ at $locale$."

Sonnenuntergang::"Sonnenuntergang[date, locale] returns the standard time not-gms of sunset on
$date$ at $locale$."

fruehesterSonnenaufgang::"fruehesterSonnenaufgang[year, locale] returns the date when the earliest 
sunrise in year occurs."

fruehesterSonnenuntergang::"fruehesterSonnenuntergang[year, locale] returns the date when the earliest 
sunset in year occurs."

spaetesterSonnenaufgang::"spaetesterSonnenaufgang[year, locale] returns the date when the latest 
sunrise in year occurs."

spaetesterSonnenuntergang::"spaetesterSonnenuntergang[year, locale] returns the date when the latest 
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

CalendricaTest::usage = "CalendricaTest[] runs a series of tests on the date
conversion algorithms, comparing the results against test data transcribed from
Appendix C of _Calendrical Calculations_ and elsewhere. As it runs, it prints a
list of tests performed and either \"OK\" if the algorithms appear to be working
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

(*
;;;; Section: Basic Code

888888b.                     d8b               .d8888b.                888          
888  "88b                    Y8P              d88P  Y88b               888          
888  .88P                                     888    888               888          
8888888K.   8888b.  .d8888b  888  .d8888b     888         .d88b.   .d88888  .d88b.  
888  "Y88b     "88b 88K      888 d88P"        888        d88""88b d88" 888 d8P  Y8b 
888    888 .d888888 "Y8888b. 888 888          888    888 888  888 888  888 88888888 
888   d88P 888  888      X88 888 Y88b.        Y88b  d88P Y88..88P Y88b 888 Y8b.     
8888888P"  "Y888888  88888P' 888  "Y8888P      "Y8888P"   "Y88P"   "Y88888  "Y8888  
                                                                                    
*)

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
;;;; Section: Egyptian Calendar

8888888888                            888    d8b                   
888                                   888    Y8P                   
888                                   888                          
8888888     .d88b.  888  888 88888b.  888888 888  8888b.  88888b.  
888        d88P"88b 888  888 888 "88b 888    888     "88b 888 "88b 
888        888  888 888  888 888  888 888    888 .d888888 888  888 
888        Y88b 888 Y88b 888 888 d88P Y88b.  888 888  888 888  888 
8888888888  "Y88888  "Y88888 88888P"   "Y888 888 "Y888888 888  888 
                888      888 888                                   
           Y8b d88P Y8b d88P 888                                   
            "Y88P"   "Y88P"  888                                   
*)

  
MonthNames[EgyptianSecular, ASCII] = {"I Akhet", "II Akhet", "III Akhet", 
  "IV Akhet", "I Peret", "II Peret", "III Peret", "IV Peret", "I Shemu", 
  "II Shemu", "III Shemu", "IV Shemu"}

ToFixed[date_?EgyptianSecularQ] := ToFixed[Apply[Egyptian, date]] 
   
EgyptianSecular[date_Integer] := Apply[EgyptianSecular, Egyptian[date]]
 
Format[date_EgyptianSecular] := 
 If[EgyptianSecularQ[date], 
  StringForm["`` `` `` ``",
  CDay[date], 
  NameFromMonth[CMonth[date], EgyptianSecular], 
  CYear[date],
  "A.N."], 
  ToString[InputForm[date]]]

MonthNames[Egyptian, ASCII] = {
	"Thoth", 
	"Phaophi", 
	"Athyr", 
	"Choiak", 
	"Tybi", 
	"Mechir", 
	"Phamenoth", 
	"Pharmuthi", 
	"Pachon", 
	"Payni", 
	"Epiphi", 
	"Mesori"}


(** egyptian-epoch **)

EgyptianEpoch[] = -272787

(** fixed-from-egyptian **)

ToFixed[date_?EgyptianQ] :=
	EgyptianEpoch[] + 365 (CYear[date] - 1) + 30 (CMonth[date] - 1) + CDay[date] - 1;


(** egyptian-from-fixed **)

Egyptian[date_Integer] :=
	Module[{days, year, month, day},
		days = date - EgyptianEpoch[];
		year = 1 + Quotient[days, 365];
		month = 1 + Quotient[Mod[days, 365], 30];
		day = days - 365 (year - 1) - 30 (month - 1) + 1;
		Egyptian[year, month, day]
	]

Format[date_Egyptian] :=
	If[EgyptianQ[date],
		StringForm["`` `` `` ``",
		    CDay[date],
		    NameFromMonth[CMonth[date], Egyptian],
		    CYear[date],
			"A.N."
		],
		ToString[InputForm[date]]
	]

 (* ;;;; Section: BabylonianLong Calendar *)
 
Babylon[] = Location["Babylon", Deg[32.4794], Deg[44.4328], Mt[26], 3]

BabylonianEpoch[] = ToFixed[Julian[-311, 4, 3]]

BabylonianLeapYearQ[byear_] := If[byear >0, (Mod[7*byear + 13, 19] < 7), (Mod[7*(byear+1) + 13, 19] < 7)] 

BabylonianCriterionQ[date_] :=
 Module[{set, t, phase},
  set = SunsetC[ToFixed[date] - 1, Babylon[]];
  t = UniversalFromStandard[set, Babylon[]];
  phase = LunarPhase[t];
  (0 < phase < 90) && (NewMoonBefore[t] <= 
     t - 1) && (MoonLag[date - 1, Babylon[]]*60 > 48)]

BabylonianNewMonthOnOrBefore[date_] :=
 Module[{moon, age, tau, erg = {}}, 
  moon = FixedFromMoment[LunarPhaseBefore[ToFixed[date], 0]];
  age = date - moon;
  If[(age <= 3) && Not[BabylonianCriterionQ[ToFixed[date]]], tau = moon - 30, 
   tau = moon]; d = tau - 1;
   Do[d = d + 1; If[BabylonianCriterionQ[d], erg = d; Break[]], {30}];
  erg]

ToFixed[date_?BabylonianLongQ] :=
  Module[{month1, months, midmonth},
   If[CLeap[date] || (Mod[CYear[date], 19] == 18) &&  (CMonth[date] > 6), month1 = CMonth[date], 
    month1 = CMonth[date] - 1];
   months = Floor[ 1/19*((CYear[date] - 1)*235 + 13)] + month1;
   midmonth = 
    BabylonianEpoch[] + Round[MeanSynodicMonth[]*months] + 15;
   BabylonianNewMonthOnOrBefore[midmonth] + CDay[date] - 1]

BabylonianLong[date_Integer] :=
 Module[{crescent, months, year, approx, newyear, month1, special, 
   leap, month, day},
  crescent = BabylonianNewMonthOnOrBefore[date];
  months = Round[(crescent - BabylonianEpoch[])/MeanSynodicMonth[]];
  year = Floor[1/235*(19*months + 5)] + 1;
  approx = 
   BabylonianEpoch[] + 
    Round[Floor[ 1/19*((year - 1)*235 + 13)]*MeanSynodicMonth[]];
  newyear = BabylonianNewMonthOnOrBefore[approx + 15];
  month1 = Round[1/29.5*(crescent - newyear)] + 1;
  special = Mod[year, 19] == 18;
  If[special, leap = (month1 == 7), leap = (month1 == 13)];
  If[leap || (special && (month1 > 6)), month = month1 - 1, 
   month = month1];
  day = date - crescent + 1;
  BabylonianLong[year, month, leap, day]]

Format[date_BabylonianLong] :=
	If[BabylonianLongQ[date],
		StringForm["`` `` `` ``",
		    CDay[date],
		    NameFromMonth[CMonth[date], Babylonian],
            If[CLeap[date], " II", ""],
		    CYear[date]
		],
		ToString[InputForm[date]]
	] 

MonthNames[Babylonian, ASCII] = {"Nisanu", "Ayaru", "Simanu", "Duuzu",
    "Abu", "Ululu", "Tashritu", "Arakhsamna", "Kislimu", "Tebetu", 
   "Shabatu", "Adaru"}

Format[date_Babylonian] := 
  If[BabylonianQ[date], 
   StringForm["`` `` ``", CDay[date], 
    NameFromMonth[CMonth[date], Babylonian], CYear[date]], 
   ToString[InputForm[date]]]

Babylonian[date_Integer] := 
  Module[{akt, akt2}, akt = BabylonianLong[date]; 
   Babylonian[akt[[1]], akt[[2]], akt[[4]] ]]

ToFixed[date_?BabylonianQ] := 
  Module[{akt}, 
   akt = ConvertDateTo[Julian[CYear[date] - 312, 5, 1], 
     BabylonianLong]; 
   ToFixed[
    BabylonianLong[akt[[1]], CMonth[date], akt[[3]], CDay[date]]]]

(* ;;;; Section: Sumerian Calendar *)

MonthNames[Sumerian, ASCII] = {"BARA-ZAG-GAR", "GUD-SI-SA", "SIG-GA", 
   "SHU-NUMUN-NA", "NE-IZI-GAR", "KIN-INNINA", "DU-KU", "APIN-DU-A", 
   "GAN-GAN-E", "AB-BA-E", "ZIZ-AM", "SHE-KIN-KU"}
Format[date_Sumerian] := 
  If[SumerianQ[date], 
   StringForm["`` `` ``", CDay[date], 
    NameFromMonth[CMonth[date], Sumerian], CYear[date]], 
   ToString[InputForm[date]]]
   
SumerianEpoch[] = -283

ToFixed[date_?SumerianQ] := 
  SumerianEpoch[] + ToFixed[Apply[Babylonian, date]] - 
   BabylonianEpoch[]
   
Sumerian[date_Integer] := 
  Apply[Sumerian, 
   Babylonian[date + BabylonianEpoch[] - SumerianEpoch[]]]
   
   (* ;;;; Section: Assyrian Calendar *)

MonthNames[Assyrian, ASCII] = {"Sippu", "Qarratu","Kalmartu", "Sin", "Kuzallu", 
   "Allanatu", "Belat elalle", "Sa sarrate", "Sa kenate", "Muhur-ilani", "Abu-sarrani", 
   "Hibur"}
Format[date_Assyrian] := 
  If[AssyrianQ[date], 
   StringForm["`` `` ``", CDay[date], 
    NameFromMonth[CMonth[date], Assyrian], CYear[date]], 
   ToString[InputForm[date]]]

AssyrianEpoch[] = -407006

ToFixed[date_?AssyrianQ] := 
  AssyrianEpoch[] + ToFixed[Apply[Islamic, date]] - 
   IslamicEpoch[]

Assyrian[date_Integer] := 
  Apply[Assyrian, 
   Islamic[date + IslamicEpoch[] - AssyrianEpoch[]]]

(* ;;;; Section: Canaanite Calendar *)

MonthNames[Canaanite, ASCII] = {"EThaNiM", "BUL", "MeRaPeH", 
   "PeGaRiM", "PhaaLoTh", "ChIRam", "ABiV", "ZiV", "ZeBaCh ShaMaSh", 
   "KaRaR", "MaThaN", "MaPhiaa"}
Format[date_Canaanite] := 
  If[CanaaniteQ[date], 
   StringForm["`` `` ``", CDay[date], 
    NameFromMonth[CMonth[date], Canaanite], CYear[date]], 
   ToString[InputForm[date]]]

CanaaniteEpoch[] = -106

ToFixed[date_?CanaaniteQ] := 
  CanaaniteEpoch[] + ToFixed[Apply[Babylonian, date]] - 
   BabylonianEpoch[]

Canaanite[date_Integer] := 
  Apply[Canaanite, 
   Babylonian[date + BabylonianEpoch[] - CanaaniteEpoch[]]]
   
   (* ;;;; Section: Phoenician Calendar *)

MonthNames[Phoenician, ASCII] = {"ABiV", "ZiV", "ZeBaCh ShaMaSh", 
   "KaRaR", "MaThaN", "MaPhiaa", "EThaNiM", "BUL", "MeRaPeH", 
   "PeGaRiM", "PhaaLoTh", "ChIRam"}
   
Format[date_Phoenician] := 
  If[PhoenicianQ[date], 
   StringForm["`` `` ``", CDay[date], 
    NameFromMonth[CMonth[date], Phoenician], CYear[date]], 
   ToString[InputForm[date]]]

PhoenicianEpoch[] = BabylonianEpoch[] 

ToFixed[date_?PhoenicianQ] := 
  ToFixed[Apply[Babylonian, date]] 

Phoenician[date_Integer] := 
  Apply[Phoenician, 
   Babylonian[date ]]
   
    
 (* Section: ElephantineHebrew Calendar *)
  
ElephantineHebrewEpoch[] = BabylonianEpoch[] + 12
	
ToFixed[date_?ElephantineHebrewQ] := 
  ElephantineHebrewEpoch[] + ToFixed[Apply[Babylonian, date]] - 
   BabylonianEpoch[]
   
ElephantineHebrew[date_Integer] := 
  Apply[ElephantineHebrew, 
   Babylonian[date + BabylonianEpoch[] - ElephantineHebrewEpoch[]]]
   
   Format[date_ElephantineHebrew] :=
	Format[Apply[Samaritan, date]]

         
 (* Section: ElephantineEgyptian Calendar *)
   MonthNames[ElephantineEgyptian, ASCII] = {
	"Tybi", 
	"Mechir", 
	"Phamenoth", 
	"Pharmuthi", 
	"Pachon", 
	"Payni", 
	"Epiphi", 
	"Mesori",
	"Thoth", 
	"Phaophi", 
	"Athyr", 
	"Choiak"}
	
ToFixed[date_?ElephantineEgyptianQ] := 
  ToFixed[Apply[ElephantineHebrew, date]]
  
ElephantineEgyptian[date_Integer] := 
  Apply[ElephantineEgyptian, ElephantineHebrew[date]]  
  
   Format[date_ElephantineEgyptian] :=
	If[ElephantineEgyptianQ[date],
		StringForm["`` `` ``",
		    CDay[date],
		    NameFromMonth[CMonth[date], ElephantineEgyptian],
		    CYear[date]
		],
		ToString[InputForm[date]]
	] 

 (* ;;;; Section: Samaritan Calendar *)
 
  MonthNames[Samaritan, ASCII] = {
	"Nisan",
	"Iyyar",
	"Sivan",
	"Tammuz",
	"Av",
	"Elul",
	"Tishri",
	"Marheshvan",
	"Kislev",
	"Tevet",
	"Shevat",
	"Adar"}
    
SamaritanLocation[] = 
  Location["Mt. Gerizim", Deg[32.1994], Deg[35.2728], Mt[881], 2];

SamaritanEpoch[] = -598573

SamaritanNoon[date_Integer] := Midday[date, SamaritanLocation[]]

SamaritanNewMoonAfter[tee_] := 
  Ceiling[N[
    ApparentFromUniversal[NewMoonAfter[tee], SamaritanLocation[]] - 
     Hr[12]]]
     
SamaritanNewMoonAtOrBefore[tee_] := 
  Ceiling[N[
    ApparentFromUniversal[NewMoonBefore[tee], SamaritanLocation[]] - 
     Hr[12]]]
     
SamaritanNewYearOnOrBefore[date_Integer] := Module[{gyear, dates, n},
   gyear = ConvertDateTo[date, Gregorian][[1]];
   dates = {ConvertDateTo[Gregorian[gyear - 1, 3, 11], Julian], 
     ConvertDateTo[Gregorian[gyear, 3, 11], Julian], date + 1}; 
   n = LengthWhile[
     dates, (SamaritanNewMoonAfter[SamaritanNoon[ToFixed[#]]] <=  
        date) & ]; 
  SamaritanNewMoonAfter[SamaritanNoon[ToFixed[dates[[n]]] ]]  ]

 ToFixed[date_?SamaritanQ] := 
 Module[{ny, nm},
   ny =  SamaritanNewYearOnOrBefore[
     Floor[SamaritanEpoch[] + 50 + 
       365.25*(CYear[date] - Ceiling[(CMonth[date] - 5)/8])]];
   nm = SamaritanNewMoonAtOrBefore[ny + 29.5 *(CMonth[date] - 1) + 15];
   nm + CDay[date] - 1 ]

Samaritan[date_Integer] := Module[{moon, newyear, month, year, day},
   moon = SamaritanNewMoonAtOrBefore[date];
   newyear = SamaritanNewYearOnOrBefore[moon];
   month = Round[(moon - newyear)/29.5] + 1;
   year = 
    Round[1/365.25*(newyear - SamaritanEpoch[])] + 
     Ceiling[(month - 5)/8];
   day = date - moon  + 1;
   Samaritan[year, month, day]]
     
   Format[date_Samaritan] :=
	If[SamaritanQ[date],
		StringForm["`` `` ``",
		    CDay[date],
		    NameFromMonth[CMonth[date], Samaritan],
		    CYear[date]
		],
		ToString[InputForm[date]]
	] 

  
 (*   ;;;; Section: Zoroastrian Calendar *)

MonthNames[Zoroastrian, ASCII] = {
	"Farvadin", 
	"Ardibeheshts", 
	"Khordad", 
	"Tir", 
	"Amardad", 
	"Sherevar", 
	"Mehr", 
	"Aban", 
	"Azar", 
	"Dae", 
	"Bahman", 
	"Asfand"}

(** zoroastrian-epoch **)

ZoroastrianEpoch[] =  230638

(** fixed-from-zoroastrian **)

ToFixed[date_?ZoroastrianQ] :=
	ZoroastrianEpoch[] + ToFixed[Apply[Egyptian, date]] - EgyptianEpoch[]

(* zoroastrian-from-fixed *)

Zoroastrian[date_Integer] :=
	Apply[Zoroastrian, Egyptian[date + EgyptianEpoch[] - ZoroastrianEpoch[]]]

Format[date_Zoroastrian] :=
	If[ZoroastrianQ[date],
		StringForm["`` `` ``",
		    CDay[date],
		    NameFromMonth[CMonth[date], Zoroastrian],
		    CYear[date]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: Armenian Calendar

       d8888                                         d8b                   
      d88888                                         Y8P                   
     d88P888                                                               
    d88P 888 888d888 88888b.d88b.   .d88b.  88888b.  888  8888b.  88888b.  
   d88P  888 888P"   888 "888 "88b d8P  Y8b 888 "88b 888     "88b 888 "88b 
  d88P   888 888     888  888  888 88888888 888  888 888 .d888888 888  888 
 d8888888888 888     888  888  888 Y8b.     888  888 888 888  888 888  888 
d88P     888 888     888  888  888  "Y8888  888  888 888 "Y888888 888  888 

*)


MonthNames[Armenian, ASCII] = {
	"Nawasardi", 
	"Hori", 
	"Sahmi", 
	"Tre", 
	"Kaloch", 
	"Arach", 
	"Mehekani", 
	"Areg", 
	"Ahekani", 
	"Mareri", 
	"Margach", 
	"Hrotich"}


(** armenian-epoch **)

ArmenianEpoch[] = 201443


(** fixed-from-armenian **)

ToFixed[date_?ArmenianQ] :=
	ArmenianEpoch[] + ToFixed[Apply[Egyptian, date]] - EgyptianEpoch[]


(* armenian-from-fixed *)

Armenian[date_Integer] :=
	Apply[Armenian, Egyptian[date + EgyptianEpoch[] - ArmenianEpoch[]]]


Format[date_Armenian] :=
	If[ArmenianQ[date],
		StringForm["`` `` ``",
		    CDay[date],
		    NameFromMonth[CMonth[date], Armenian],
		    CYear[date]
		],
		ToString[InputForm[date]]
	]
	
	MonthNames[Coligny, ASCII] = {
	"Samonios", 
	"Dummannios", 
	"Rivros", 
	"Anagantios", 
	"Ogronios", 
	"Cutios", 
	"Giamonios", 
	"Simivissonios", 
	"Equos", 
	"Elembivios", 
	"Edrinios", 
	"Cantios"}


(** Coligny-epoch **)

ColignyEpoch[] =  ToFixed[Gregorian[-1018, 11, 1]]


(** fixed-from-Coligny **)

ToFixed[date_?ColignyQ] :=
 Module[{approx, approx2, ca, ya, ma, da},
  approx = Floor[CDay[date] + 29.5*CMonth[date] + 12*29.5*CYear[date] + ColignyEpoch[]];
  ca = Coligny[approx]; ya = ca[[1]]; ma = ca[[2]]; da = ca[[3]];
  approx2 = Floor[da + 29.5*ma + 12*29.5*ya + ColignyEpoch[]];
  2*approx - approx2]

(* Coligny-from-fixed *)

Coligny[fixed_] := 
  Module[{ColignyMonthDays = 29.5, ColignyYearDays = 29.5*12, 
    deltaDays = fixed - ColignyEpoch[], colignyYear, colignyMonth, 
    colignyDay},
   colignyYear = Quotient[deltaDays, Floor[ColignyYearDays]];
   colignyMonth = 
    Quotient[Mod[deltaDays, Floor[ColignyYearDays]], 
     Floor[ColignyMonthDays]];
   colignyDay = 
    Floor[Mod[Mod[deltaDays, Floor[ColignyYearDays]], 
      Floor[ColignyMonthDays]]];
   Coligny[colignyYear, colignyMonth, colignyDay]
   ];

Format[date_Coligny] :=
	If[ColignyQ[date],
		StringForm["`` `` ``",
		    CDay[date],
		    NameFromMonth[CMonth[date], Coligny],
		    CYear[date]
		],
		ToString[InputForm[date]]
	]


(* ;;; Ssection Olympiad *)
 
 OlympiadStart[] := -776
 
 OlympiadFromJulianYear[j_] := 
 Module[{years},
  years = j - OlympiadStart[];
  If[j >= 0, years = years - 1];
  {Floor[years/4] + 1, Mod[years, 4] + 1} ]
  
 JulianYearFromOlympiad[{cycle_, year_}] :=
 Module[{years},
  years = OlympiadStart[] + 4*(cycle - 1) + year - 1;
   If[years >= 0, years = years + 1];
  years]
  
  OlympiadExact[z_, p_] := 
 Module[{j = -776 + (z - 1)*4 + p - 1, start, fi, erg = {}},
  If[ j < 394, start = ToFixed[Gregorian[j + 1, 6, 21]]; 
   fi = FullMoonAfter[start];
   erg = Julian[Floor[fi]], 
   Print["394 C.E. were Antic Olympic games over"]]; erg]
   
     (* ;;;; Section: Macedonian Seleucid Calendar *)
   
   MonthNames[MacedonianSeleucid, ASCII] ={"Dios", "Apellaios", "Audynaios", "Perytios", "Dystros", "Xanthikos", "Artemisios", "Daisios", "Panemos", "Lhoios", "Gorpiaios", "Hyperberetaios"}

Format[date_MacedonianSeleucid] := 
  If[MacedonianSeleucidQ[date], 
   StringForm["`` `` ``", CDay[date], 
    NameFromMonth[CMonth[date], MacedonianSeleucid], CYear[date]], 
   ToString[InputForm[date]]]
   
MacedonianSeleucidEpoch[] =  -113680

ToFixed[date_?MacedonianSeleucidQ] := 
  MacedonianSeleucidEpoch[] + ToFixed[Apply[Babylonian, date]] - 
   BabylonianEpoch[]
   
MacedonianSeleucid[date_Integer] := 
  Apply[MacedonianSeleucid, 
   Babylonian[date + BabylonianEpoch[] - MacedonianSeleucidEpoch[]]]
   
(* ;;;; Section: Qussay Calendar *)

Format[date_Qussay]:=
	If[QussayQ[date],
		StringForm["``, `` `` ``",
			NameFromDayOfWeekC[ToFixed[date], Islamic], 
			CDay[date],
			NameFromMonth[CMonth[date], Islamic],
			CYear[date]
		],
		ToString[InputForm[date]]
	]
 
QussayEpoch[] = 153603;

ToFixed[date_?QussayQ] := 
  QussayEpoch[] + ToFixed[Apply[Babylonian, date]] - BabylonianEpoch[]
  
Qussay[date_Integer] := 
  Apply[Qussay, Babylonian[date + BabylonianEpoch[] - QussayEpoch[]]]
   
    (*   ;;;; Section: Icelandic Calendar *)

MonthNames[Icelandic, ASCII] = {
	"Harpa", 
	"Skerpia", 
	"Sólmánuður", 
	"Samarauki", 
	"Heyannir", 
	"Tvímánuður", 
	"Haustmánuður", 
	"Gormánuður", 
	"Ýlir", 
	"Mörsugur",
    "Þorri",
    "Góa",
	"Einmánuður"}

(** Icelandic-epoch **)

IcelandicEpoch[] = ToFixed[Gregorian[1, 4, 19]]

(** fixed-from-Icelandic **)

 ToFixed[date_?IcelandicQ]:= Module[{erg},
  Which[(CMonth[date] == 1) && (CDay[date]==1), 
   erg = KDayOnOrAfter[ToFixed[Gregorian[CYear[date], 4, 19]], 4],
  (CMonth[date] == 5) && (CDay[date]==1),
   erg = NthKDay[14, SundayC[], 
   KDayOnOrAfter[ToFixed[Gregorian[CYear[date], 4, 19]], 4]],
   CMonth[date] >= 5, 
   erg = ToFixed[Icelandic[CYear[date], 5, 1]] + (CMonth[date] - 5)*30 - 1 + CDay[date],
   True, 
   erg =  ToFixed[Icelandic[CYear[date], 1, 1]] + (CMonth[date] - 1)*30 - 1 + CDay[date]];
  erg] 

(* Icelandic-from-fixed *)

 Icelandic[date_Integer] := Module[{jahr, monat, tag},
   jahr = Gregorian[date][[1]];
   If[earlierQ[date, ToFixed[Icelandic[jahr, 1, 1]]],
    jahr = jahr - 1]; 
   monat = 13;
   While[(monat > 0) && 
     earlierQ[date, ToFixed[Icelandic[jahr, monat, 1]]], 
    monat = monat - 1];
   tag = date - ToFixed[Icelandic[jahr, monat, 1]] + 1;
   Icelandic[jahr, monat, tag]] 
    
  Format[date_Icelandic] :=
	If[IcelandicQ[date],
		StringForm["`` `` ``",
		    CDay[date],
		    NameFromMonth[CMonth[date], Icelandic],
		    CYear[date]
		],
		ToString[InputForm[date]]
	] 




(*
;;;; Section: Gregorian Calendar

 .d8888b.                                             d8b                   
d88P  Y88b                                            Y8P                   
888    888                                                                  
888        888d888  .d88b.   .d88b.   .d88b.  888d888 888  8888b.  88888b.  
888  88888 888P"   d8P  Y8b d88P"88b d88""88b 888P"   888     "88b 888 "88b 
888    888 888     88888888 888  888 888  888 888     888 .d888888 888  888 
Y88b  d88P 888     Y8b.     Y88b 888 Y88..88P 888     888 888  888 888  888 
 "Y8888P88 888      "Y8888   "Y88888  "Y88P"  888     888 "Y888888 888  888 
                                 888                                        
                            Y8b d88P                                        
                             "Y88P"                                         
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
;;;; Section: Julian calendar with Roman nomenclature

8888888b.                                           
888   Y88b                                          
888    888                                          
888   d88P  .d88b.  88888b.d88b.   8888b.  88888b.  
8888888P"  d88""88b 888 "888 "88b     "88b 888 "88b 
888 T88b   888  888 888  888  888 .d888888 888  888 
888  T88b  Y88..88P 888  888  888 888  888 888  888 
888   T88b  "Y88P"  888  888  888 "Y888888 888  888 

*)


(** kalends **)
(** nones **)
(** ides **)

Kalends[] = 1
Nones[] = 2
Ides[] = 3


(** ides-of-month **)

IdesOfMonth[month_] :=
	If[MemberQ[{March[], May[], July[], October[]}, month], 15, 13]


(** nones-of-month **)

NonesOfMonth[month_] :=
	IdesOfMonth[month] - 8


(** fixed-from-roman **)

ToFixed[date_?RomanQ] :=
	Module[{},
		leap = CLeapDay[date];
		count = CCount[date];
		event = CEvent[date];
		month = CMonth[date];
		year = CYear[date];
		Which[
			event == Kalends[],
				ToFixed[Julian[year, month, 1]],
			event == Nones[],
				ToFixed[Julian[year, month, NonesOfMonth[month]]],
			event == Ides[],
				ToFixed[Julian[year, month, IdesOfMonth[month]]]
		]
			- count
			+ If[JulianLeapYearQ[year] && month == March[] && event == Kalends[] && 16 >= count >= 6, 0, 1]
			+ If[leap, 1, 0]
	]

(** roman-from-fixed **)

Roman[date_Integer] :=
	Module[{j, month, day, year, monthPrime, yearPrime, kalends1},
		j = Julian[date];
		month = CMonth[j];
		day = CDay[j];
		year = CYear[j];
		monthPrime = AdjustedMod[month + 1, 12];
		yearPrime = If[monthPrime == 1, year + 1, year];
		kalends1 = ToFixed[Roman[yearPrime, monthPrime, Kalends[], 1, False]];
		Which[
			day == 1,
				Roman[year, month, Kalends[], 1, False],
			day <= NonesOfMonth[month],
				Roman[year, month, Nones[], NonesOfMonth[month] - day + 1, False],
			day <= IdesOfMonth[month],
				Roman[year, month, Ides[], IdesOfMonth[month] - day + 1, False],
			month != February[] || !JulianLeapYearQ[year],
				Roman[yearPrime, monthPrime, Kalends[], kalends1 - date + 1, False],
			day < 25,
				Roman[year, March[], Kalends[], 30 - day, False],
			True,
				Roman[year, March[], Kalends[], 31 - day, day == 25]
		]
	]
	
	MonthNames[Roman, ASCII] = {
	"Ianuarias", 
	"Februarias", 
	"Martii", 
	"Apriles", 
	"Maias", 
	"Iunii", 
	"Iulias", 
	"Augusti", 
	"Septembris", 
	"Octobris", 
	"Novembris", 
	"Decembris"}


CountNames[Roman, ASCII] = {
	"",
	"pridie ",
	"ante diem III ",
	"ante diem IV ",
	"ante diem V ",
	"ante diem VI ",
	"ante diem VII ",
	"ante diem VIII ",
	"ante diem IX ",
	"ante diem X ",
	"ante diem XI ",
	"ante diem XII ",
	"ante diem XIII ",
	"ante diem XIV ",
	"ante diem XV ",
	"ante diem XVI ",
	"ante diem XVII ",
	"ante diem XVIII ",
	"ante diem XIX "
}


EventNames[Roman, ASCII] = {
	"Kalenda",
	"Nonas",
	"Idus"
}


Format[date_Roman] :=
	If[RomanQ[date],
		StringForm["```` ``, `` ``",
			If[CLeapDay[date],
				"ante diem bis VI ",
				NameFromNumber[CCount[date], CountNames[Roman, ASCII]]
			],
			NameFromNumber[CEvent[date], EventNames[Roman, ASCII]],
			NameFromMonth[CMonth[date], Roman],
			If[CYear[date] < 0, RomanNumeral[-CYear[date]], RomanNumeral[CYear[date]]],
			If[CYear[date] < 0, "B.C.E.", " "]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: Alexandrian Calendar *)


ConvertDateTo[Alexandrian[j_, m_, d_], Egyptian] := 
  Module[{x = j - 392, dd, erg},
   dd = Round[243 + 89/310*x]; erg = DaysPlusC[Egyptian[j, m, d], dd]]

ConvertDateTo[Egyptian[j_, m_, d_], Alexandrian] := 
  Module[{x = j - 392, dd, erg},
   dd = Round[243 + 89/310*x]; 
   erg = DaysPlusC[Egyptian[j, m, d], -dd] /. Egyptian -> Alexandrian]

ConvertDateTo[Alexandrian[j_, m_, d_], cal_] := 
  ConvertDateTo[ConvertDateTo[Alexandrian[j, m, d], Egyptian], cal] /; 
   cal =!= Egyptian

ConvertDateTo[cal_[j_, m_, d_], Alexandrian] := 
  ConvertDateTo[ConvertDateTo[cal[j, m, d], Egyptian], Alexandrian] /; 
   cal =!= Egyptian 

(*
;;;; Section: Coptic Calendar

 .d8888b.                    888    d8b          
d88P  Y88b                   888    Y8P          
888    888                   888                 
888         .d88b.  88888b.  888888 888  .d8888b 
888        d88""88b 888 "88b 888    888 d88P"    
888    888 888  888 888  888 888    888 888      
Y88b  d88P Y88..88P 888 d88P Y88b.  888 Y88b.    
 "Y8888P"   "Y88P"  88888P"   "Y888 888  "Y8888P 
                    888                          
                    888                          
                    888                          
*)


(** coptic-epoch **)

CopticEpoch[] = ToFixed[Julian[CE[284], August[], 29]]


(** coptic-leap-year? **)

CopticLeapYearQ[cYear_] :=
	Mod[cYear, 4] == 3


(** fixed-from-coptic **)

ToFixed[date_?CopticQ] :=
	Module[{year},
		year = CYear[date];
		CopticEpoch[] - 1
		+ 365 (year - 1)
		+ Quotient[year, 4]
		+ 30 (CMonth[date] - 1)
		+ CDay[date]
	]
	
ToFixed[date_?EgyptianNewQ] := ToFixed[Coptic[date[[1]]-284,date[[2]],date[[3]]]]

(** coptic-from-fixed **)

Coptic[date_Integer] :=
	Module[{year, month, day},
		year = Quotient[4 (date - CopticEpoch[]) + 1463, 1461];
		month = Quotient[date - ToFixed[Coptic[year, 1, 1]], 30] + 1;
		day = date + 1 - ToFixed[Coptic[year, month, 1]];
		Coptic[year, month, day]
	]
	
EgyptianNew[date_Integer]:= Module[{c},c=Coptic[date]; EgyptianNew[c[[1]]+284,c[[2]],c[[3]]]]

(** coptic-in-gregorian **)

CopticInGregorian[cMonth_, cDay_, gYear_] :=
	Module[{jan1, dec31, y, date1, date2, result},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		dec31 = ToFixed[Gregorian[gYear, December[], 31]];
		y = CYear[Coptic[jan1]];
		date1 = ToFixed[Coptic[y, cMonth, cDay]];
		date2 = ToFixed[Coptic[y + 1, cMonth, cDay]];
		result = {};
		If[jan1 <= date1 <= dec31, result = Append[result, date1]];
		If[jan1 <= date2 <= dec31, result = Append[result, date2]];
		result
	]


(** coptic-christmas **)

CopticChristmas[gYear_] :=
	CopticInGregorian[4, 29, gYear]


MonthNames[Coptic, ASCII] = {
	"Tut",
	"Babah",
	"Hatur",
	"Kiyahk",
	"Tubah",
	"Amshir",
	"Baramhat",
	"Baramundah",
	"Bashans",
	"Ba'unah",
	"Abib",
	"Misra",
	"al-Nasi"}


Format[date_Coptic]:=
	If[CopticQ[date],
		StringForm["`` `` `` A.M.", 
			CDay[date],
			NameFromMonth[CMonth[date], Coptic],
			CYear[date]
		],
		ToString[InputForm[date]]
	]
	
Format[date_EgyptianNew]:=
	If[EgyptianNewQ[date],
		StringForm["`` `` `` C.E.", 
			CDay[date],
			NameFromMonth[CMonth[date], Egyptian],
			CYear[date]
		],
		ToString[InputForm[date]]
	]

	
	(*
;;;; Section: Ethiopic Calendar

8888888888 888    888      d8b                   d8b          
888        888    888      Y8P                   Y8P          
888        888    888                                         
8888888    888888 88888b.  888  .d88b.  88888b.  888  .d8888b 
888        888    888 "88b 888 d88""88b 888 "88b 888 d88P"    
888        888    888  888 888 888  888 888  888 888 888      
888        Y88b.  888  888 888 Y88..88P 888 d88P 888 Y88b.    
8888888888  "Y888 888  888 888  "Y88P"  88888P"  888  "Y8888P 
                                        888                   
                                        888                   
                                        888                   
*)



(** ethiopic-epoch **)

EthiopicEpoch[] = ToFixed[Julian[CE[8], August[], 29]]


(** fixed-from-ethiopic **)

ToFixed[date_?EthiopicQ] :=
	ToFixed[Coptic[CYear[date], CMonth[date], CDay[date]]] - CopticEpoch[] + EthiopicEpoch[]


(** ethiopic-from-fixed **)

Ethiopic[date_Integer] :=
	Apply[Ethiopic, Coptic[date + CopticEpoch[] - EthiopicEpoch[]]]


DayOfWeekCNames[Ethiopic, ASCII] = {
	"Ihud", 
	"Sanyo", 
	"Maksanyo", 
	"Rob", 
	"Hamus", 
	"Arb", 
	"Kidamme"}


MonthNames[Ethiopic, ASCII] = {
	"Maskaram",
	"Teqemt",
	"Kehdar",
	"Takhsas",
	"Ter",
	"Yakatit",
	"Magabit",
	"Miyazya",
	"Genbot",
	"Sane",
	"Hamle",
	"Nahase",
	"Paguemen"}


Format[date_Ethiopic]:=
	If[EthiopicQ[date],
		StringForm["``, `` `` `` E.E.",
			NameFromDayOfWeekC[ToFixed[date], Ethiopic], 
			CDay[date],
			NameFromMonth[CMonth[date], Ethiopic],
			CYear[date]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: ISO Calendar

8888888  .d8888b.   .d88888b.  
  888   d88P  Y88b d88P" "Y88b 
  888   Y88b.      888     888 
  888    "Y888b.   888     888 
  888       "Y88b. 888     888 
  888         "888 888     888 
  888   Y88b  d88P Y88b. .d88P 
8888888  "Y8888P"   "Y88888P"  
                               
*)


(** fixed-from-iso **)

ToFixed[date_?ISOQ] :=
	NthKDay[CWeek[date], SundayC[], Gregorian[CYear[date] - 1, December[], 28]] + CDay[date]


(** iso-from-fixed **)

ISO[date_Integer] :=
	Module[{approx, year, week, day},
		approx = GregorianYearFromFixed[date - 3];
		year = If[
			date >= ToFixed[ISO[approx + 1, 1, 1]],
			approx + 1,
			approx];
		week = Quotient[date - ToFixed[ ISO[year, 1, 1] ], 7] + 1;
		day = AdjustedMod[date, 7];
		ISO[year, week, day]
	]


Format[date_ISO]:=
	If[ISOQ[date],
		StringForm["``, Week ``, ``",
			NameFromDayOfWeekC[ToFixed[date]], 
			CWeek[date], 
			CYear[date]
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
;;;; Section: Hebrew Calendar

888    888          888                                     
888    888          888                                     
888    888          888                                     
8888888888  .d88b.  88888b.  888d888  .d88b.  888  888  888 
888    888 d8P  Y8b 888 "88b 888P"   d8P  Y8b 888  888  888 
888    888 88888888 888  888 888     88888888 888  888  888 
888    888 Y8b.     888 d88P 888     Y8b.     Y88b 888 d88P 
888    888  "Y8888  88888P"  888      "Y8888   "Y8888888P"  

*)


(** tishri **)

Tishri[] = 7


(** nisan **)

Nisan[] = 1


(** hebrew-epoch **)

HebrewEpoch[] =
	ToFixed[Julian[BCE[3761], October[], 7]]


(** hebrew-leap-year? **)

HebrewLeapYearQ[hYear_Integer] :=
	Mod[1 + 7 hYear, 19] < 7
	
SabbatYearQ[n_] := Module[{erg = False},
   If[n < 0 && Mod[n, 7] == 5, erg = True];
   If[n > 0 && Mod[n, 7] == 6, erg = True];
   erg]; 

(** last-month-of-hebrew-year **)

LastMonthOfHebrewYear[hYear_Integer] :=
	If[HebrewLeapYearQ[hYear], 13, 12]


(** last-day-of-hebrew-month **)

LastDayOfHebrewMonth[hMonth_Integer, hYear_Integer] :=
	If[MemberQ[{2, 4, 6, 10, 13}, hMonth]
		|| ((hMonth == 12) && !HebrewLeapYearQ[hYear])
		|| ((hMonth == 8) && !LongMarheshvanQ[hYear])
		|| ((hMonth == 9) && ShortKislevQ[hYear]),
		29, 30]


(** hebrew-calendar-elapsed-days **)

HebrewCalendarElapsedDays[hYear_Integer] :=
	Module[{monthsElapsed, partsElapsed, day},
		monthsElapsed = Quotient[235 hYear - 234, 19];
		partsElapsed = 12084 + 13753 monthsElapsed;
		day = 29 monthsElapsed + Quotient[partsElapsed, 25920];
		If[Mod[3 (day + 1), 7] < 3, day + 1, day]
	]


(** hebrew-new-year **)

HebrewNewYear[hYear_Integer] :=
	(HebrewEpoch[]
		+ HebrewCalendarElapsedDays[hYear]
		+ HebrewNewYearDelay[hYear])


(** hebrew-new-year-delay **)

HebrewNewYearDelay[hYear_Integer] :=
	Module[{ny0, ny1, ny2},
		ny0 = HebrewCalendarElapsedDays[hYear - 1];
		ny1 = HebrewCalendarElapsedDays[hYear];
		ny2 = HebrewCalendarElapsedDays[hYear + 1];
		Which[ny2 - ny1 == 356, 2,
			ny1 - ny0 == 382, 1,
			True, 0]
	]


(** molad **)

Molad[hMonth_Integer, hYear_Integer] :=
	    Module[{y,monthsElapsed},
	            y = If[hMonth < Tishri[], hYear + 1, hYear];
	            monthsElapsed = hMonth - Tishri[] + Quotient[ 235 y -234, 19];
	            hebrewEpoch[] - 876/25920 + monthsElapsed (29 + Hr[12] + 793/25920)
	]

	
(** days-in-hebrew-year **)

DaysInHebrewYear[hYear_Integer] :=
	HebrewNewYear[hYear + 1] - HebrewNewYear[hYear]


(** long-marheshvan? **)

LongMarheshvanQ[hYear_Integer] :=
	MemberQ[{355, 385}, DaysInHebrewYear[hYear]]


(** short-kislev? **)

ShortKislevQ[hYear_Integer] :=
	MemberQ[{353, 383}, DaysInHebrewYear[hYear]]


(** fixed-from-hebrew **)

ToFixed[date_?HebrewQ] :=
	Module[{month, year},
		month = CMonth[date];
		year = CYear[date];
		HebrewNewYear[year]
		+ CDay[date] - 1
		+ If[month < Tishri[],
			MSum[(LastDayOfHebrewMonth[#, year])&, Tishri[], (# <= LastMonthOfHebrewYear[year])&] + MSum[(LastDayOfHebrewMonth[#, year])&, Nisan[], (# < month)&],
			MSum[(LastDayOfHebrewMonth[#, year])&, Tishri[], (# < month)&]]
	]


(** hebrew-from-fixed **)

Hebrew[date_Integer] :=
	Module[{approx, year, start, month, day},
		approx = 1 + Quotient[date - HebrewEpoch[], 35975351/98496];
		year = MFinal[approx - 1, (HebrewNewYear[#] <= date)&];
		start = If[date < ToFixed[Hebrew[year, 1, 1]], Tishri[], Nisan[]];
		month = MNext[start, (date <= ToFixed[Hebrew[year, #, LastDayOfHebrewMonth[#, year]]])&];
		day = 1 + date - ToFixed[Hebrew[year, month, 1]];
		Hebrew[year, month, day]
	]


(** yom-kippur **)

YomKippur[gYear_Integer] :=
	Module[{hYear},
		hYear = 1 + gYear - GregorianYearFromFixed[HebrewEpoch[]];
		ToFixed[Hebrew[hYear, Tishri[], 10]]
	]

(* fast of gedaliah *)
Gedaliah[gYear_Integer] := YomKippur[gYear] - 7

(** passover **)

Passover[gYear_Integer] :=
	Module[{hYear},
		hYear = gYear - GregorianYearFromFixed[HebrewEpoch[]];
		ToFixed[Hebrew[hYear, Nisan[], 15]]
	]


(** omer **)

Omer[date_Integer] :=
	Module[{c},
		c = date - Passover[GregorianYearFromFixed[date]];
		If[1 <= c <= 49, {Quotient[c, 7], Mod[c, 7]}, Bogus]
	]


(** purim **)

Purim[gYear_Integer] :=
	Module[{hYear, lastMonth},
		hYear = gYear - GregorianYearFromFixed[HebrewEpoch[]];
		lastMonth = LastMonthOfHebrewYear[hYear];
		ToFixed[Hebrew[hYear, lastMonth, 14]]
	]


(** ta-anit-esther **)

TaAnitEsther[gYear_Integer] :=
	Module[{purimDate},
		purimDate = Purim[gYear];
		If[DayOfWeekCFromFixed[purimDate] == SundayC[], purimDate - 3, purimDate - 1]
	]


(** tishah-be-av **)

TishahBeAv[gYear_Integer] :=
	Module[{hYear, ninthOfAv},
		hYear = gYear - GregorianYearFromFixed[HebrewEpoch[]];
		ninthOfAv = ToFixed[Hebrew[hYear, 5, 9]];
		If[DayOfWeekCFromFixed[ninthOfAv] == SaturdayC[], ninthOfAv + 1, ninthOfAv]
	]


(** birkath-ha-hama **)

BirkathHaHama[gYear_Integer] :=
	Module[{dates},
		dates = CopticInGregorian[7, 30, gYear];
		If[dates =!= {} && Mod[CYear[Coptic[First[dates]]], 28] == 17, dates, {}]
	]


(** sh-ela **)

ShEla[gYear_Integer] := 
	CopticInGregorian[3, 26, gYear];


(** yom-ha-zikkaron **)

YomHaZikkaron[gYear_Integer] :=
	Module[{hYear, h},
		hYear = gYear - GregorianYearFromFixed[HebrewEpoch[]];
		iyar4 = ToFixed[Hebrew[hYear, 2, 4]];
		If[WednesdayC[] < DayOfWeekCFromFixed[iyar4], KDayBefore[iyar4, WednesdayC[]], iyar4]
	]


(** hebrew-birthday **)

HebrewBirthday[birthDate_?HebrewQ, hYear_Integer] :=
	Module[{birthDay, birthMonth, birthYear},
		birthDay = CDay[birthDate];
		birthMonth = CMonth[birthDate];
		birthYear = CYear[birthDate];
		If[birthMonth == LastMonthOfHebrewYear[birthYear],
			ToFixed[Hebrew[hYear, LastMonthOfHebrewYear[hYear], birthDay]],
			ToFixed[Hebrew[hYear, birthMonth, 1]] + birthDay - 1]
	]


(** hebrew-birthday-in-gregorian **)

HebrewBirthdayInGregorian[birthdate_?HebrewQ, gYear_Integer] :=
	Module[{jan1, dec31, y, date1, date2},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		dec31 = ToFixed[Gregorian[gYear, December[], 31]];
		y = CYear[Hebrew[jan1]];
		date1 = HebrewBirthday[birthdate, y];
		date2 = HebrewBirthday[birthdate, y + 1];
		Join[
			If[jan1 <= date1, {date1}, {}],
			If[date2 <= dec31, {date2}, {}]
		]
	]


(** yahrzeit **)

Yahrzeit[deathDate_?HebrewQ, hYear_Integer] :=
	Module[{deathDay, deathMonth, deathYear},
		deathDay = CDay[deathDate];
		deathMonth = CMonth[deathDate];
		deathYear = CMonth[deathDate];
		Which[
			deathMonth == 8 && deathDay == 30 && !LongMarheshvanQ[deathYear + 1],
				ToFixed[Hebrew[hYear, 9, 1]] - 1,
			deathMonth == 9 && deathDay == 30 && ShortKislevQ[deathYear + 1],
				ToFixed[Hebrew[hYear, 10, 1]] - 1,
			deathMonth == 13,
				ToFixed[Hebrew[hYear, LastMonthOfHebrewYear[hYear], deathDay]],
			deathDay == 30 && deathMonth == 12 && !HebrewLeapYearQ[hYear],
				ToFixed[Hebrew[hYear, 11, 30]],
			True,
				ToFixed[Hebrew[hYear, deathMonth, 1]] + deathDay - 1
		]
	]


(** yahrzeit-in-gregorian **)

YahrzeitInGregorian[deathDate_?HebrewQ, gYear_Integer] :=
	Module[{jan1, dec31, y, date1, date2},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		dec31 = ToFixed[Gregorian[gYear, December[], 31]];
		y = CYear[Hebrew[jan1]];
		date1 = Yahrzeit[deathDate, y];
		date2 = Yahrzeit[deathDate, y + 1];
		Join[
			If[jan1 <= date1, {date1}, {}],
			If[date2 <= dec31, {date2}, {}]
		]
	]


(** jewish-dusk **)

JewishDusk[date_Integer, locale_Location] :=
	Dusk[date, locale, Angle[4, 40, 0]];


(** jewish-sabbath-ends **)

JewishSabbathEnds[date_Integer, locale_Location] :=
	Dusk[date, locale, Angle[7, 5, 0]];


(** temporal-hour **)

TemporalHour[date_Integer, locale_Location] :=
	Module[{sunrise, sunset},
		sunrise = SunriseC[date, locale];
		sunset = SunsetC[date, locale];
		If[sunrise === Bogus || sunset === Bogus,
			Bogus,
			(sunset - sunrise) / 12
		]
	]


(** standard-from-sundial **)

StandardFromSundial[date_Integer, hour_, locale_Location] :=
	Module[{tee},
		tee = TemporalHour[date, locale];
		If[tee === Bogus,
			Bogus,
			SunriseC[date, locale] +
			If[6 <= hour <= 18,
				(hour - 6) tee,
				(hour - 6) (1/12 - tee)
			]
		]
	]


(** jewish-morning-end **)

JewishMorningEnd[date_Integer, locale_Location] :=
	StandardFromSundial[date, 10, locale]


DayOfWeekCNames[Hebrew, ASCII] = {
	"yom rishon", 
	"yom sheni", 
	"yom shelishi", 
	"yom revi`i", 
	"yom hamishi", 
	"yom shishi", 
	"yom shabbat"}


MonthNames[Hebrew, ASCII, False] = {
	"Nisan",
	"Iyyar",
	"Sivan",
	"Tammuz",
	"Av",
	"Elul",
	"Tishri",
	"Marheshvan",
	"Kislev",
	"Tevet",
	"Shevat",
	"Adar"}


MonthNames[Hebrew, ASCII, True] = {
	"Nisan",
	"Iyyar",
	"Sivan",
	"Tammuz",
	"Av",
	"Elul",
	"Tishri",
	"Marheshvan",
	"Kislev",
	"Tevet",
	"Shevat",
	"Adar I",
	"Adar II"}


Format[date_Hebrew] :=
	If[HebrewQ[date],
		StringForm["``, `` `` `` A.M.",
			NameFromDayOfWeekC[ToFixed[date], Hebrew], 
			CDay[date],
			NameFromNumber[CMonth[date], MonthNames[Hebrew, ASCII, HebrewLeapYearQ[CYear[date]]]],
			CYear[date]
		],
		ToString[InputForm[date]]
	]

(*
;;;; Section: Qumran Calendar *)

QumranEpoch[] = ToFixed[Julian[BCE[42], 3, 27]]

Qumran[date_Integer] :=
 Module[{zahl, year, ueber1, 
   monate = {0, 30, 60, 91, 121, 151, 182, 212, 242, 273, 303, 333, 
     364}, month, day},
  zahl = date - QumranEpoch[] + 1; year = Quotient[zahl, 364] + 1; 
  ueber1 = Mod[zahl, 364];
  Do[If[monate[[i]] < ueber1 <= monate[[i + 1]], month = i], {i, 1, 
    12}]; day = ueber1 - monate[[month]];
  Qumran[year, month , day]]

ToFixed[date_?QumranQ] := 
 Module[{ monate = {0, 30, 60, 91, 121, 151, 182, 212, 242, 273, 303, 333}},
  QumranEpoch[] + (CYear[date] - 1)*364 + monate[[CMonth[date] ]] + CDay[date] - 1]

PriesthoodWeek[date_Integer] :=
 Module[{basis = -552000 (* This fixed date is a back projection to a time
    where no priesthood existed. The first sure date where PriesthoodWeek can be
    applied is -15257 *)
    , abstand, wo, ta, 
   namen = {"1 = Jehoiarib", "2 = Jedaiah", "3 = Harim", 
     "4 = Seorim",
     "5 = Malchijah", "6 = Mijamin", "7 = Hakkoz", "8 = Abijah", 
     "9 = Jeshua", "10 = Shecaniah", "11 = Eliashib",
     "12 = Jakim", "13 = Huppah", "14 = Jeshebeab", "15 = Bilgah", 
     "16 = Immer", "17 = Hezir", "18 = Aphses",
     "19 = Pethahiah", "20 = Jehezekel", "21 = Jachin", "22 = Gamul", 
     "23 = Delaiah", "24 = Maaziah"}}, If[date > -552001,
   abstand = date - basis; wo = Mod[Quotient[abstand, 7], 24] + 1; 
   ta = DayOfWeekC[date]; {namen[[wo]], ta}, {"At this time was no priesthood in Israel"}]]
   
EzdraEpoch[] = ToFixed[Julian[BCE[42], 3, 24]]

ToFixed[date_?EzdraQ] :=
	EzdraEpoch[] + ToFixed[Apply[Qumran, date]] - QumranEpoch[]

Ezdra[date_Integer] :=
	Apply[Ezdra, Qumran[date + QumranEpoch[] - EzdraEpoch[]]]

  
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
;;;; Section: Mayan Calendars

888b     d888                                     
8888b   d8888                                     
88888b.d88888                                     
888Y88888P888  8888b.  888  888  8888b.  88888b.  
888 Y888P 888     "88b 888  888     "88b 888 "88b 
888  Y8P  888 .d888888 888  888 .d888888 888  888 
888   "   888 888  888 Y88b 888 888  888 888  888 
888       888 "Y888888  "Y88888 "Y888888 888  888 
                            888                   
                       Y8b d88P                   
                        "Y88P"                    
*)


(** mayan-epoch **)

MayanEpoch[] = FixedFromJD[584283]


(** fixed-from-mayan-long-count **)

ToFixed[date_?MayanLongCountQ] :=
		MayanEpoch[] +
		CBaktun[date] 144000 +
		CKatun[date] 7200 +
		CTun[date] 360 +
		CUinal[date] 20 +
		CKin[date]


(** mayan-long-count-from-fixed **)

MayanLongCount[date_Integer] :=
	Module[{longCount, baktun, dayOfBaktun, katun, dayOfKatun, tun, dayOfTun, uinal, kin},
		longCount = date - MayanEpoch[];
		baktun = Quotient[longCount, 144000];
		dayOfBaktun = Mod[longCount, 144000];
		katun = Quotient[dayOfBaktun, 7200];
		dayOfKatun = Mod[dayOfBaktun, 7200];
		tun = Quotient[dayOfKatun, 360];
		dayOfTun = Mod[dayOfKatun, 360];
		uinal = Quotient[dayOfTun, 20];
		kin = Mod[dayOfTun, 20];
		MayanLongCount[baktun, katun, tun, uinal, kin]
	]


(** mayan-haab-ordinal **)

MayanHaabOrdinal[hDate_?MayanHaabQ] :=
	(CMonth[hDate] - 1) 20 + CDay[hDate];


(** mayan-haab-epoch **)

MayanHaabEpoch[] =
	MayanEpoch[] - MayanHaabOrdinal[MayanHaab[18, 8]]


(** mayan-haab-from-fixed **)

MayanHaab[date_Integer] :=
	Module[{count, day, month},
		count = Mod[date - MayanHaabEpoch[], 365];
		day = Mod[count, 20];
		month = 1 + Quotient[count, 20];
		MayanHaab[month, day]
	]


(** mayan-haab-on-or-before **)

MayanHaabOnOrBefore[haab_?MayanHaabQ, date_Integer] :=
	date - Mod[date - MayanHaabEpoch[] - MayanHaabOrdinal[haab], 365]


(** mayan-tzolkin-ordinal **)

MayanTzolkinOrdinal[tDate_?MayanTzolkinQ] :=
	Module[{number, name},
		number = CNumber[tDate];
		name = CName[tDate];
		Mod[number - 1 + 39 (number - name), 260]
	]


(** mayan-tzolkin-epoch **)

MayanTzolkinEpoch[] =
	MayanEpoch[] - MayanTzolkinOrdinal[MayanTzolkin[4, 20]]


(** mayan-tzolkin-from-fixed **)

MayanTzolkin[date_Integer] :=
	Module[{count, number, name},
		count = date - MayanTzolkinEpoch[] + 1;
		number = AdjustedMod[count, 13];
		name = AdjustedMod[count, 20];
		MayanTzolkin[number, name]
	]


(** mayan-tzolkin-on-or-before **)

MayanTzolkinOnOrBefore[tzolkin_?MayanTzolkinQ, date_Integer] :=
	date - Mod[date - MayanTzolkinEpoch[] - MayanTzolkinOrdinal[tzolkin], 260]


(** mayan-calendar-round-on-or-before **)

MayanCalendarRoundOnOrBefore[haab_?MayanHaabQ, tzolkin_?MayanTzolkinQ, date_Integer] :=
	Module[{haabCount, tzolkinCount, diff},
		haabCount = MayanHaabOrdinal[haab] + MayanHaabEpoch[];
		tzolkinCount = MayanTzolkinOrdinal[tzolkin] + MayanTzolkinEpoch[];
		diff = tzolkinCount - haabCount;
		If[Mod[diff, 5] == 0,
			date - Mod[date - haabCount - 365 diff, 18980],
			Bogus]
	]


MonthNames[MayanHaab, ASCII] = {
	"Pop (Mat)",
	"Uo (Frog)",
	"Zip (Stag)",
	"Zotz (Bat)",
	"Tzec (Skull)",
	"Xul (End)",
	"Yaxkin (Green time)",
	"Mol (Gather)",
	"Chen (Well)",
	"Yax (Green)",
	"Zac (White)",
	"Ceh (Deer)",
	"Mac (Cover)",
	"Kankin (Yellow Time)",
	"Muan (Owl)",
	"Pax (Drum)",
	"Kayab (Turtle)",
	"Cumku (Dark God)",
	"Uayeb (5-day unlucky period)"}


MNames[MayanTzolkin, ASCII] = {
	"Imix (Alligator)",
	"Ik (Wind)",
	"Akbal (Night)",
	"Kan (Iguana)",
	"Chicchan (Serpent)",
	"Cimi (Death)",
	"Manik (Deer)",
	"Lamat (Rabbit)",
	"Muluc (Rain)",
	"Oc (Dog)",
	"Chuen (Monkey)",
	"Eb (Tooth)",
	"Ben (Cane)",
	"Ix (Jaguar)",
	"Men (Eagle)",
	"Cib (Owl)",
	"Caban (Quake)",
	"Etznab (Flint)",
	"Cauac (Storm)",
	"Ahau (Lord)"}


Format[date_MayanLongCount]:=
	If[MayanLongCountQ[date],
		StringForm["``.``.``.``.``",
			CBaktun[date],
			CKatun[date],
			CTun[date],
			CUinal[date],
			CKin[date]
		],
		ToString[InputForm[date]]
	]


Format[date_MayanHaab] :=
	If[MayanHaabQ[date],
		StringForm["`` ``",
			CDay[date],
			NameFromMonth[CMonth[date], MayanHaab]
		],
		ToString[InputForm[date]]
	]


Format[date_MayanTzolkin] :=
	If[MayanTzolkinQ[date],
		StringForm["`` ``",
			CNumber[date],
			NameFromNumber[CName[date], MNames[MayanTzolkin, ASCII]]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: Aztec Calendars *)

AztecCorrelation[] = ToFixed[Julian[1521, 8, 13]]

AztecXihuitlOrdinal[xDate_?AztecXihuitlQ] := (CMonth[xDate] - 1)*20 + CDay[xDate] - 1

AztecXihuitlCorrelation[] = 555202 

AztecXihuitl[date_Integer] := Module[{count, day, month},
  count = Mod[date - AztecXihuitlCorrelation[], 365]; 
  day = Mod[count, 20] + 1; month = Quotient[count,20] + 1;
  AztecXihuitl[month, day]]

AztecXihuitlOnOrBefore[xihuitl_?AztecXihuitlQ, date_Integer] :=
 date - Mod[
   date - AztecXihuitlCorrelation[] - AztecXihuitlOrdinal[xihuitl], 
   365]

AztecTonalpohualliCorrelation[]= 555299

AztecTonalpohualliOrdinal[tDate_?AztecTonalpohualliQ] := 
   Mod[CNumber[tDate] - 1 + 39*(CNumber[tDate] - CName[tDate]), 260]

AztecTonalpohualli[date_Integer] := Module[{count, number, name},
  count = date - AztecTonalpohualliCorrelation[] + 1; 
  number = AdjustedMod[count, 13]; name = AdjustedMod[count, 20];
  AztecTonalpohualli[number, name]]

AztecTonalpohualliOnOrBefore[tonalpohualli_?AztecTonalpohualliQ, 
  date_Integer] :=
 date - Mod[
   date - AztecTonalpohualliCorrelation[] - 
    AztecTonalpohualliOrdinal[tonalpohualli], 260]

AztecXiuhmolpilli[date_Integer] := 
 Module[{x = 
    AztecXihuitlOnOrBefore[AztecXihuitl[18, 20], date + 364],
   month = AztecXihuitl[date][[1]]}, 
  If[month == 19, Bogus, AztecTonalpohualli[x]]] 

AztecXihuitlTonalpohualliOnOrBefore[xihuitl_?AztecXihuitlQ, 
  tonalpohualli_?AztecTonalpohualliQ, date_Integer] :=
 Module[{xihuitlcount = 
    AztecXihuitlOrdinal[xihuitl] + AztecXihuitlCorrelation[],
   tonalpohuallicount = 
    AztecTonalpohualliOrdinal[tonalpohualli] + 
     AztecTonalpohualliCorrelation[], diff},
  diff = tonalpohuallicount - xihuitlcount; 
  If[Mod[diff, 5] == 0, 
   date - Mod[date - xihuitlcount - 365*diff, 18980], Bogus]]

MonthNames[AztecXihuitl, ASCII] = {
	"Quecholli",
        "Panquetzaliztli",
         "Atemoztli",
         "Tititl",
         "Izcalli",
         "Cuahuitleua",
         "Tlacaxipehualiztli",
         "Tozoztontli",
         "Huei Tozoztli",
         "Toxcatl", 
         "Etzalcualiztli",
         "Tecuilhuitonli",
         "Huei Tecuilhuitl", 
         "Miccailhuitonli",
         "Huei Miccailhuitl", 
         "Ochpasniztli",
         "Pachtontli",
         "Huei Pachtli",
         "Nemontemi"}

MNames[AztecTonalpohualli, ASCII] = {
        "Cipactli (Alligator)",
	"Ehecatl (Wind)",
	"Calli (House)",
	"Cuetzpallin (Iguana)",
	"Coatl (Serpent)",
	"Miquiztli (Death)",
	"Mazatl (Deer)",
	"Tochtli (Rabbit)",
	"Atl (Water)",
	"Itzcuintli (Dog)",
	"Ozomatli (Monkey)",
	"Malinalli (Grass)",
	"Acatl (Cane)",
	"Ocelotl (Jaguar)",
	"Quauhtli (Eagle)",
	"Cozcaquauhtli (Buzzard)",
	"Ollin (Quake)",
	"Tecpatl (Flint)",
	"Quiahuitl (Storm)",
	"Xochitl (Flower)"}

Format[date_AztecXihuitl] :=
	If[AztecXihuitlQ[date],
		StringForm["`` ``",
			CDay[date],
			NameFromMonth[CMonth[date], AztecXihuitl]
		],
		ToString[InputForm[date]]
	]


Format[date_AztecTonalpohualli] :=
	If[AztecTonalpohualliQ[date],
		StringForm["`` ``",
			CNumber[date],
			NameFromNumber[CName[date], MNames[AztecTonalpohualli, ASCII]]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: Bahai Calendar

888888b.            888               d8b 
888  "88b           888               Y8P 
888  .88P           888                   
8888888K.   8888b.  88888b.   8888b.  888 
888  "Y88b     "88b 888 "88b     "88b 888 
888    888 .d888888 888  888 .d888888 888 
888   d88P 888  888 888  888 888  888 888 
8888888P"  "Y888888 888  888 "Y888888 888 

*)


(** bahai-epoch **)

BahaiEpoch[] = ToFixed[Gregorian[1844, March[], 21]]


(** ayyam-i-ha **)

AyyamIHa[] = 0


(** fixed-from-bahai **)

ToFixed[date_?BahaiQ] :=
	Module[{month, gYear},
		month = CMonth[date];
		gYear = 361 (CMajor[date] - 1)
			+ 19 (CCycle[date] - 1)
			+ CYear[date]
			- 1
			+ GregorianYearFromFixed[BahaiEpoch[]];
		ToFixed[Gregorian[gYear, March[], 20]]
			+ Which[
				month == AyyamIHa[], 342,
				month == 19, If[GregorianLeapYearQ[gYear + 1], 347, 346],
				True, 19 (month - 1)
			]
			+ CDay[date]
	]


(** bahai-from-fixed **)

Bahai[date_Integer] :=
	Module[{gYear, start, years, major, cycle, year, days, month, day},
		gYear = GregorianYearFromFixed[date];
		start = GregorianYearFromFixed[BahaiEpoch[]];
		years = gYear
			- start
			- If[date <= ToFixed[Gregorian[gYear, March[], 20]], 1, 0];
		major = 1 + Quotient[years, 361];
		cycle = 1 + Quotient[Mod[years, 361], 19];
		year = 1 + Mod[years, 19];
		days = date - ToFixed[Bahai[major, cycle, year, 1, 1]];
		month = Which[
			date >= ToFixed[Bahai[major, cycle, year, 19, 1]], 19,
			date >= ToFixed[Bahai[major, cycle, year, AyyamIHa[], 1]], AyyamIHa[],
			True, 1 + Quotient[days, 19]
		];
		day = date + 1 - ToFixed[Bahai[major, cycle, year, month, 1]];
		Bahai[major, cycle, year, month, day]
	]


(** bahai-new-year **)

BahaiNewYear[gYear_Integer] :=
	ToFixed[Gregorian[gYear, March[], 21]]


DayOfWeekCNames[Bahai, ASCII] = {
	"Jalal", 
	"Jamal", 
	"Kamal", 
	"Fidal", 
	"Idal", 
	"Istijlal", 
	"Istiqlal"}


DayOfMonthNames[Bahai, ASCII] = {
	"Baha'",
	"Jalal",
	"Jamal",
	"`Azamat",
	"Nur",
	"Rahmat",
	"Kalimat",
	"Kamal",
	"Asma'",
	"`Izzat",
	"Mashiyyat",
	"`Ilm",
	"Qudrat",
	"Qawl",
	"Masa'il",
	"Sharaf",
	"Sultan",
	"Mulk",
	"`Ala'"}


MonthNames[Bahai, ASCII] = {
	"Ayyam-i-Ha",
	"Baha'",
	"Jalal",
	"Jamal",
	"`Azamat",
	"Nur",
	"Rahmat",
	"Kalimat",
	"Kamal",
	"Asma'",
	"`Izzat",
	"Mashiyyat",
	"`Ilm",
	"Qudrat",
	"Qawl",
	"Masa'il",
	"Sharaf",
	"Sultan",
	"Mulk",
	"`Ala'"}


YearNames[Bahai, ASCII] = {
	"Alif",
	"Ba'",
	"Ab",
	"Dal",
	"Bab",
	"Vav",
	"Abad",
	"Jad",
	"Baha",
	"Hubb",
	"Bahhaj",
	"Javab",
	"Ahad",
	"Vahhab",
	"Vidad",
	"Badi'",
	"Bahi",
	"Abha",
	"Vahid"}


Format[date_Bahai] :=
	If[BahaiQ[date],
		StringForm["``, `` ``, `` of Vahid ``, Kull-i-Shay `` B.E.", 
			NameFromDayOfWeekC[ToFixed[date], Bahai],
			NameFromNumber[CDay[date], DayOfMonthNames[Bahai, ASCII]],
			NameFromNumber[CMonth[date] + 1, MonthNames[Bahai, ASCII]],
			NameFromNumber[CYear[date], YearNames[Bahai, ASCII]],
			CCycle[date],
			CMajor[date]
		],
		ToString[InputForm[date]]
	]



(*
;;;; Section: Arithmetic Persian Calendar

       d8888         d8b 888    888                             888    d8b              8888888b.                            d8b                   
      d88888         Y8P 888    888                             888    Y8P              888   Y88b                           Y8P                   
     d88P888             888    888                             888                     888    888                                                 
    d88P 888 888d888 888 888888 88888b.  88888b.d88b.   .d88b.  888888 888  .d8888b     888   d88P  .d88b.  888d888 .d8888b  888  8888b.  88888b.  
   d88P  888 888P"   888 888    888 "88b 888 "888 "88b d8P  Y8b 888    888 d88P"        8888888P"  d8P  Y8b 888P"   88K      888     "88b 888 "88b 
  d88P   888 888     888 888    888  888 888  888  888 88888888 888    888 888          888        88888888 888     "Y8888b. 888 .d888888 888  888 
 d8888888888 888     888 Y88b.  888  888 888  888  888 Y8b.     Y88b.  888 Y88b.        888        Y8b.     888          X88 888 888  888 888  888 
d88P     888 888     888  "Y888 888  888 888  888  888  "Y8888   "Y888 888  "Y8888P     888         "Y8888  888      88888P' 888 "Y888888 888  888 

*)


(** arithmetic-persian-leap-year? **)

ArithmeticPersianLeapYearQ[pYear_Integer] :=
	Module[{y, year},
		y = If[0 < pYear, pYear - 474, pYear - 473];
		year = Mod[y, 2820] + 474;
		Mod[(year + 38) 682, 2816] < 682
	]


(** fixed-from-arithmetic-persian **)

ToFixed[date_?ArithmeticPersianQ] :=
	Module[{day, month, pYear, y, year},
		day = CDay[date];
		month = CMonth[date];
		pYear = CYear[date];
		y = If[0 < pYear, pYear - 474, pYear - 473];
		year = Mod[y, 2820] + 474;
		PersianEpoch[] - 1
			+ 1029983 Quotient[y, 2820]
			+ 365 (year - 1)
			+ Quotient[682 year - 110, 2816]
			+ If[month <= 7, 31 (month - 1), 30 (month - 1) + 6]
			+ day
	]


(** arithmetic-persian-year-from-fixed **)

ArithmeticPersianYearFromFixed[date_Integer] :=
	Module[{l0, n2820, d1, y2820, year},
		l0 = date - ToFixed[ArithmeticPersian[475, 1, 1]];
		n2820 = Quotient[l0, 1029983];
		d1 = Mod[l0, 1029983];
		y2820 = If[d1 == 1029982, 2820, Quotient[2816 d1 + 1031337, 1028522]];
		year = 474 + 2820 n2820 + y2820;
		If[0 < year, year, year - 1]
	]


(** arithmetic-persian-from-fixed **)

ArithmeticPersian[date_Integer] :=
	Module[{year, dayOfYear, month, day},
		year = ArithmeticPersianYearFromFixed[date];
		dayOfYear = 1 + date - ToFixed[ArithmeticPersian[year, 1, 1]];
		month = If[dayOfYear < 186, Ceiling[dayOfYear / 31], Ceiling[(dayOfYear - 6) / 30]];
		day = date - (ToFixed[ArithmeticPersian[year, month, 1]] - 1);
		ArithmeticPersian[year, month, day]
	]


Format[date_ArithmeticPersian] :=
	Format[Apply[Persian, date]]


(*
;;;; Section: Modified French Revolutionary Calendar

888b     d888               888 d8b  .d888 d8b               888     8888888888                                   888      
8888b   d8888               888 Y8P d88P"  Y8P               888     888                                          888      
88888b.d88888               888     888                      888     888                                          888      
888Y88888P888  .d88b.   .d88888 888 888888 888  .d88b.   .d88888     8888888   888d888  .d88b.  88888b.   .d8888b 88888b.  
888 Y888P 888 d88""88b d88" 888 888 888    888 d8P  Y8b d88" 888     888       888P"   d8P  Y8b 888 "88b d88P"    888 "88b 
888  Y8P  888 888  888 888  888 888 888    888 88888888 888  888     888       888     88888888 888  888 888      888  888 
888   "   888 Y88..88P Y88b 888 888 888    888 Y8b.     Y88b 888     888       888     Y8b.     888  888 Y88b.    888  888 
888       888  "Y88P"   "Y88888 888 888    888  "Y8888   "Y88888     888       888      "Y8888  888  888  "Y8888P 888  888 

*)


(** modified-french-leap-year? **)

ModifiedFrenchLeapYearQ[fYear_Integer] :=
	Mod[fYear, 4] == 0 &&
	!MemberQ[{100, 200, 300}, Mod[fYear, 400]] &&
	!Mod[fYear, 4000] == 0


(** fixed-from-modified-french **)

ToFixed[date_?ModifiedFrenchQ] :=
	Module[{year},
		year = CYear[date];
		FrenchEpoch[] - 1 +
		365 (year - 1) +
		Quotient[year - 1, 4] -
		Quotient[year - 1, 100] +
		Quotient[year - 1, 400] -
		Quotient[year - 1, 4000] +
		30 (CMonth[date] - 1) +
		CDay[date]
	]


(** modified-french-from-fixed **)

ModifiedFrench[date_Integer] :=
	Module[{approx, year, month, day},
		approx = 1 + Quotient[date - FrenchEpoch[] + 2, 1460969/4000];
		year = If[date < ToFixed[ModifiedFrench[approx, 1, 1]], approx - 1, approx];
		month = Quotient[date - ToFixed[ModifiedFrench[year, 1, 1]], 30] + 1;
		day = date - ToFixed[ModifiedFrench[year, month, 1]] + 1;
		ModifiedFrench[year, month, day]
	]


Format[date_ModifiedFrench] :=
	Format[Apply[French, date]]


(*
;;;; Section: Balinese Calendar

888888b.            888 d8b                                     
888  "88b           888 Y8P                                     
888  .88P           888                                         
8888888K.   8888b.  888 888 88888b.   .d88b.  .d8888b   .d88b.  
888  "Y88b     "88b 888 888 888 "88b d8P  Y8b 88K      d8P  Y8b 
888    888 .d888888 888 888 888  888 88888888 "Y8888b. 88888888 
888   d88P 888  888 888 888 888  888 Y8b.          X88 Y8b.     
8888888P"  "Y888888 888 888 888  888  "Y8888   88888P'  "Y8888  

*)


(** bali-epoch **)

BaliEpoch[] = FixedFromJD[146]


(** bali-day-from-fixed **)

BaliDayFromFixed[date_Integer] :=
	Mod[date - BaliEpoch[], 210]


(** bali-luang-from-fixed **)

BaliLuangFromFixed[date_Integer] :=
	EvenQ[BaliDasawaraFromFixed[date]]


(** bali-dwiwara-from-fixed **)

BaliDwiwaraFromFixed[date_Integer] :=
	AdjustedMod[BaliDasawaraFromFixed[date], 2]


(** bali-triwara-from-fixed **)

BaliTriwaraFromFixed[date_Integer] :=
	Mod[BaliDayFromFixed[date], 3] + 1


(** bali-caturwara-from-fixed **)

BaliCaturwaraFromFixed[date_Integer] :=
	AdjustedMod[BaliAsatawaraFromFixed[date], 4]


(** bali-pancawara-from-fixed **)

BaliPancawaraFromFixed[date_Integer] :=
	Mod[BaliDayFromFixed[date] + 1, 5] + 1


(** bali-sadwara-from-fixed **)

BaliSadwaraFromFixed[date_Integer] :=
	Mod[BaliDayFromFixed[date], 6] + 1


(** bali-saptawara-from-fixed **)

BaliSaptawaraFromFixed[date_Integer] :=
	Mod[BaliDayFromFixed[date], 7] + 1


(** bali-asatawara-from-fixed **)

BaliAsatawaraFromFixed[date_Integer] :=
	Module[{day},
		day = BaliDayFromFixed[date];
		Mod[Max[6, 4 + Mod[day - 70, 210]], 8] + 1
	]


(** bali-sangawara-from-fixed **)

BaliSangawaraFromFixed[date_Integer] :=
	Mod[Max[0, BaliDayFromFixed[date] - 3], 9] + 1


(** bali-dasawara-from-fixed **)

BaliDasawaraFromFixed[date_Integer] :=
	Module[{i, j},
		i = BaliPancawaraFromFixed[date];
		j = BaliSaptawaraFromFixed[date];
		Mod[Part[{5, 9, 7, 4, 8}, i] + Part[{5, 4, 3, 7, 8, 6, 9}, j] + 1, 10]
	]


(** bali-pawukon-from-fixed **)

Balinese[date_Integer] :=
	Balinese[
		BaliLuangFromFixed[date],
		BaliDwiwaraFromFixed[date],
		BaliTriwaraFromFixed[date],
		BaliCaturwaraFromFixed[date],
		BaliPancawaraFromFixed[date],
		BaliSadwaraFromFixed[date],
		BaliSaptawaraFromFixed[date],
		BaliAsatawaraFromFixed[date],
		BaliSangawaraFromFixed[date],
		BaliDasawaraFromFixed[date]
	]


(** bali-week-from-fixed **)

BaliWeekFromFixed[date_Integer] :=
	Quotient[BaliDayFromFixed[date], 7] + 1


(** bali-on-or-before **)

BaliOnOrBefore[bDate_?BalineseQ, date_Integer] :=
	Module[{a5, a6, b7, b35, days, capDelta},
		a5 = CPancawara[bDate] - 1;
		a6 = CSadwara[bDate] - 1;
		b7 = CSaptawara[bDate] - 1;
		b35 = Mod[a5 + 14 + 15 (b7 - a5), 35];
		days = a6 + 36 (b35 - a6);
		capDelta = BaliDayFromFixed[0];
		date - Mod[(date + capDelta) - days, 210]
	]


BaliDay[bDate_Balinese] :=
	BaliOnOrBefore[bDate, BaliEpoch[] + 209] - BaliEpoch[] + 1


BaliWeek[bDate_Balinese] :=
	Quotient[BaliDay[bDate] - 1, 7] + 1


(** positions-in-interval **)

PositionsInInterval[n_Integer, c_Integer, capDelta_Integer, start_Integer, end_Integer] :=
	Module[{pos, result},
		result = {};
		pos = start;
		While[(pos = pos + Mod[n - start - capDelta - 1, c]; pos <= end),
			AppendTo[result, pos];
			pos = pos + 1;
		];
		result
	]


(** kajeng-keliwon-in-gregorian **)

KajengKeliwonInGregorian[gYear_Integer] :=
	Module[{jan1, dec31, capDelta},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		dec31 = ToFixed[Gregorian[gYear, December[], 31]];
		capDelta = BaliDayFromFixed[0];
		PositionsInInterval[9, 15, capDelta, jan1, dec31]
	]


(** tumpek-in-gregorian **)

TumpekInGregorian[gYear_Integer] :=
	Module[{jan1, dec31},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		dec31 = ToFixed[Gregorian[gYear, December[], 31]];
		capDelta = BaliDayFromFixed[0];
		PositionsInInterval[14, 35, capDelta, jan1, dec31]
	]


DwiwaraNames[Balinese, ASCII] = {
	"Menga",
	"Pepet"}


TriwaraNames[Balinese, ASCII] = {
	"Pasah",
	"Beteng",
	"Kajeng"}


CaturwaraNames[Balinese, ASCII] = {
	"Sri",
	"Laba",
	"Jaya",
	"Menala"}


PancawaraNames[Balinese, ASCII] = {
	"Umanis",
	"Paing",
	"Pon",
	"Wage",
	"Keliwon"}


SadwaraNames[Balinese, ASCII] = {
	"Tungleh",
	"Aryang",
	"Urukung",
	"Paniron",
	"Was",
	"Maulu"}


SaptawaraNames[Balinese, ASCII] = {
	"Redite",
	"Coma",
	"Anggara",
	"Buda",
	"Wraspati",
	"Sukra",
	"Saniscara"}


AsatawaraNames[Balinese, ASCII] = {
	"Sri",
	"Indra",
	"Guru",
	"Yama",
	"Ludra",
	"Brahma",
	"Kala",
	"Uma"}


SangawaraNames[Balinese, ASCII] = {
	"Dangu",
	"Jangur",
	"Gigis",
	"Nohan",
	"Ogan",
	"Erangan",
	"Urungan",
	"Tulus",
	"Dadi"}


DasawaraNames[Balinese, ASCII] = {
	"Pandita",
	"Pati",
	"Suka",
	"Duka",
	"Sri",
	"Manuh",
	"Manusa",
	"Raja",
	"Dewa",
	"Raksasa"}


WeekNames[Balinese, ASCII] = {
	"Sinta",
	"Landep",
	"Ukir",
	"Kulantir",
	"Taulu",
	
	"Gumbreg",
	"Wariga",
	"Warigadian",
	"Jukungwangi",
	"Sungsang",
	
	"Dunggulan",
	"Kuningan",
	"Langkir",
	"Medangsia",
	"Pujut",
	
	"Pahang",
	"Krulut",
	"Merakih",
	"Tambir",
	"Medangkungan",
	
	"Matal",
	"Uye",
	"Menail",
	"Parangbakat",
	"Bala",
	
	"Ugu",
	"Wayang",
	"Kelawu",
	"Dukut",
	"Watugunung"}


Format[date_Balinese]:=
	If[BalineseQ[date],
		StringForm["```` `` `` `` `` `` `` `` `` (``)",
			If[CLuang[date], "Luang ", ""],
			NameFromNumber[CDwiwara[date], DwiwaraNames[Balinese, ASCII]],
			NameFromNumber[CTriwara[date], TriwaraNames[Balinese, ASCII]],
			NameFromNumber[CCaturwara[date], CaturwaraNames[Balinese, ASCII]],
			NameFromNumber[CPancawara[date], PancawaraNames[Balinese, ASCII]],
			NameFromNumber[CSadwara[date], SadwaraNames[Balinese, ASCII]],
			NameFromNumber[CSaptawara[date], SaptawaraNames[Balinese, ASCII]],
			NameFromNumber[CAsatawara[date], AsatawaraNames[Balinese, ASCII]],
			NameFromNumber[CSangawara[date], SangawaraNames[Balinese, ASCII]],
			NameFromNumber[CDasawara[date], DasawaraNames[Balinese, ASCII]],
			NameFromNumber[BaliWeek[date], WeekNames[Balinese, ASCII]]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: Time and Astronomy

88888888888 d8b                             .d8888b.                d8888          888                                                              
    888     Y8P                            d88P  "88b              d88888          888                                                              
    888                                    Y88b. d88P             d88P888          888                                                              
    888     888 88888b.d88b.   .d88b.       "Y8888P"             d88P 888 .d8888b  888888 888d888  .d88b.  88888b.   .d88b.  88888b.d88b.  888  888 
    888     888 888 "888 "88b d8P  Y8b     .d88P88K.d88P        d88P  888 88K      888    888P"   d88""88b 888 "88b d88""88b 888 "888 "88b 888  888 
    888     888 888  888  888 88888888     888"  Y888P"        d88P   888 "Y8888b. 888    888     888  888 888  888 888  888 888  888  888 888  888 
    888     888 888  888  888 Y8b.         Y88b .d8888b       d8888888888      X88 Y88b.  888     Y88..88P 888  888 Y88..88P 888  888  888 Y88b 888 
    888     888 888  888  888  "Y8888       "Y8888P" Y88b    d88P     888  88888P'  "Y888 888      "Y88P"  888  888  "Y88P"  888  888  888  "Y88888 
                                                                                                                                                888 
                                                                                                                                           Y8b d88P 
                                                                                                                                            "Y88P"  
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
;;;; Section: Observational Islamic Calendar

 .d88888b.  888                                                  888    d8b                            888     8888888          888                        d8b          
d88P" "Y88b 888                                                  888    Y8P                            888       888            888                        Y8P          
888     888 888                                                  888                                   888       888            888                                     
888     888 88888b.  .d8888b   .d88b.  888d888 888  888  8888b.  888888 888  .d88b.  88888b.   8888b.  888       888   .d8888b  888  8888b.  88888b.d88b.  888  .d8888b 
888     888 888 "88b 88K      d8P  Y8b 888P"   888  888     "88b 888    888 d88""88b 888 "88b     "88b 888       888   88K      888     "88b 888 "888 "88b 888 d88P"    
888     888 888  888 "Y8888b. 88888888 888     Y88  88P .d888888 888    888 888  888 888  888 .d888888 888       888   "Y8888b. 888 .d888888 888  888  888 888 888      
Y88b. .d88P 888 d88P      X88 Y8b.     888      Y8bd8P  888  888 Y88b.  888 Y88..88P 888  888 888  888 888       888        X88 888 888  888 888  888  888 888 Y88b.    
 "Y88888P"  88888P"   88888P'  "Y8888  888       Y88P   "Y888888  "Y888 888  "Y88P"  888  888 "Y888888 888     8888888  88888P' 888 "Y888888 888  888  888 888  "Y8888P 

*)


(** islamic-locale **)

Cairo[] = Location["Cairo, Egypt", Deg[30.1], Deg[31.3], Mt[200], 2]
IslamicLocale[] = Cairo[]


(** fixed-from-observational-islamic **)

ToFixed[iDate_?ObservationalIslamicQ] :=
	Module[{midmonth},
		midmonth = IslamicEpoch[] + Floor[((CYear[iDate] - 1) 12 + CMonth[iDate] - 1/2) MeanSynodicMonth[]];
		PhasisOnOrBefore[midmonth, IslamicLocale[]] + CDay[iDate] - 1
	]


(** observational-islamic-from-fixed **)

ObservationalIslamic[date_Integer] :=
	Module[{crescent, elapsedMonths, year, month, day},
		crescent = PhasisOnOrBefore[date, IslamicLocale[]];
		elapsedMonths = Round[(crescent - IslamicEpoch[]) / MeanSynodicMonth[]];
		year = Quotient[elapsedMonths, 12] + 1;
		month = Mod[elapsedMonths, 12] + 1;
		day = date - crescent + 1;
		ObservationalIslamic[year, month, day]
	]


Format[date_ObservationalIslamic] :=
	Format[Apply[Islamic, date]]


(*
;;;; Section: Observational Hebrew Calendar *)

(** astronomical-easter **)

AstronomicalEaster[gYear_Integer] :=
	Module[{jan1, equinox, paschalMoon},
		jan1 = ToFixed[Gregorian[gYear, January[], 1]];
		equinox = SolarLongitudeAfter[jan1, Spring[]];
		paschalMoon = Floor[ApparentFromLocal[LocalFromUniversal[LunarPhaseAfter[equinox, FullLunar[]], Jerusalem[]]]];
		KDayAfter[paschalMoon, SundayC[]];
	]


Jaffa[]=Location["Jaffa, Israel", Deg[32.033],Deg[34.75],Mt[0],2]

ObservationalHebrewNewYear[gYear_Integer] := 
 Module[{jan1, equinox, set}, jan1 = GregorianNewYear[gYear];
  equinox = SolarLongitudeAfter[jan1, Spring[]]; 
  set = UniversalFromStandard[SunsetC[Floor[equinox], Jaffa[]], 
    Jaffa[]];
  PhasisOnOrAfter[Floor[equinox] - If[equinox < set, 14, 13], 
   Jaffa[]]]

ObservationalHebrew[date_Integer] := 
 Module[{crescent, gYear, ny, newYear, month, year, day},
  crescent = PhasisOnOrBefore[date, Jaffa[]]; 
  gYear = GregorianYearFromFixed[date]; 
  ny = ObservationalHebrewNewYear[gYear];
  newYear = If[date < ny, ObservationalHebrewNewYear[gYear - 1], ny]; 
  month = Round[(crescent - newYear)/29.5] + 1;
  year = Hebrew[newYear][[1]] + If[month >= Tishri[], 1, 0]; 
  day = date - crescent + 1; ObservationalHebrew[year, month, day]]

ToFixed[date_?ObservationalHebrewQ] := 
 Module[{year = CYear[date], month = CMonth[date], day = CDay[date], year1, 
   start, gYear, newYear,
   midmonth},
  year1 = If[month >= Tishri[], year - 1, year]; 
  start = ToFixed[Hebrew[year1, Nisan[], 1]]; 
  gYear = GregorianYearFromFixed[start + 60];
  newYear = ObservationalHebrewNewYear[gYear]; 
  midmonth = newYear + Round[29.5*(month - 1)] + 15;
  PhasisOnOrBefore[midmonth, Jaffa[]] + day - 1]


(** classical-passover-eve **)

ClassicalPassoverEve[gYear_Integer] := 
 ObservationalHebrewNewYear[gYear] + 13


Format[date_ObservationalHebrew] :=
	Format[Apply[Hebrew, date]]


(*
;;;; Section: BLC Calendar *)
BLCNewYear[gYear_Integer] := 
 Module[{d, d1, as, erg = {}}, d = ToFixed[Gregorian[gYear, 3, 22]];
  d1 = d;
  Do[d = d - 1; as = Abs[LunarPhase[d]];
   If[(as < 7.5) ~Or~ (as > 352.5), erg = -1*Floor[d1 - d]; 
    Break[]], {i, 1, 15}];
  If[erg == {}, d = d1 - 1;
   Do[d = d + 1; as = Abs[LunarPhase[d]];
    If[(as < 7.5) ~Or~ (as > 352.5), erg = Floor[d - d1]; 
     Break[]], {i, 1, 15}]];
  ToFixed[Gregorian[gYear, 3, 22]]+erg + 1]


BLC[date_Integer] := 
  Module[{crescent, gYear, ny, newYear, month, year, day},
     crescent = PhasisOnOrBefore[date, Jaffa[]];
     gYear = GregorianYearFromFixed[date];
     ny = BLCNewYear[gYear];
     newYear = If[date < ny, BLCNewYear[gYear - 1], ny];
	 year = If[date < ny, gYear -1, gYear];
	 month = Round[(crescent - newYear)/29.5] + 1;
     day = date - crescent + 1; BLC[year, month, day]];
ToFixed[date_BLC] :=
  Module[{year = CYear[date], month = CMonth[date], day = CDay[date], 
   year1, start, gYear, newYear, midmonth}, newYear = BLCNewYear[year];
    midmonth = newYear + Round[29.5*(month - 1)] + 15;
    PhasisOnOrBefore[midmonth, Jaffa[]] + day - 1]

Format[date_BLC] :=
	Format[Apply[Samaritan, date]]


(*
;;;; Section: Persian Calendar

8888888b.                            d8b                   
888   Y88b                           Y8P                   
888    888                                                 
888   d88P  .d88b.  888d888 .d8888b  888  8888b.  88888b.  
8888888P"  d8P  Y8b 888P"   88K      888     "88b 888 "88b 
888        88888888 888     "Y8888b. 888 .d888888 888  888 
888        Y8b.     888          X88 888 888  888 888  888 
888         "Y8888  888      88888P' 888 "Y888888 888  888 

*)


(** persian-epoch **)

PersianEpoch[] =
	ToFixed[Julian[CE[622], March[], 19]]


(** tehran **)

Tehran[] = Location["Tehran, Iran", Deg[35.68], Deg[51.42], Mt[1100], 3.5]


(** midday-in-tehran **)

MiddayInTehran[date_Integer] :=
	UniversalFromStandard[Midday[date, Tehran[]], Tehran[]]


(** persian-new-year-on-or-before **)

PersianNewYearOnOrBefore[date_Integer] :=
	Module[{approx},
		approx = EstimatePriorSolarLongitude[MiddayInTehran[date], Spring[]];
		MNext[Floor[approx] - 1, (SolarLongitudeC[MiddayInTehran[#]] <= Spring[] + Deg[2])&]
	]


(** fixed-from-persian **)

ToFixed[date_?PersianQ] :=
	Module[{month, day, year, newYear},
		month = CMonth[date];
		day = CDay[date];
		year = CYear[date];
		newYear = PersianNewYearOnOrBefore[PersianEpoch[] + 180 + Floor[MeanTropicalYear[] If[0 < year, year - 1, year]]];
		(newYear - 1)
			+ If[month <= 7, 31 (month - 1), 30 (month - 1) + 6]
			+ day
	]


(** persian-from-fixed **)

Persian[date_Integer] :=
	Module[{newYear, y, year, dayOfYear, month, day},
		newYear = PersianNewYearOnOrBefore[date];
		y = 1 + Round[(newYear - PersianEpoch[]) / MeanTropicalYear[]];
		year = If[0 < y, y, y - 1];
		dayOfYear = 1 + date - ToFixed[Persian[year, 1, 1]];
		month = If[dayOfYear < 186, Ceiling[dayOfYear / 31], Ceiling[(dayOfYear - 6) / 30]];
		day = date - (ToFixed[Persian[year, month, 1]] - 1);
		Persian[year, month, day]
	]


(** naw-ruz **)

NawRuz[gYear_Integer] :=
	Module[{persianYear},
		persianYear = 1 + gYear - GregorianYearFromFixed[PersianEpoch[]];
		ToFixed[Persian[If[persianYear <= 0, persianYear - 1, persianYear], 1, 1]]
	]


MonthNames[Persian, ASCII] = {
	"Farvardin",
	"Ordibehesht",
	"Xordad",
	"Tir",
	"Mordad",
	"Shahrivar",
	"Mehr",
	"Aban",
	"Azar",
	"Dey",
	"Bahman",
	"Esfand"}


Format[date_Persian] :=
	If[PersianQ[date],
		StringForm["`` `` `` A.P.", 
			CDay[date],
			NameFromMonth[CMonth[date], Persian],
			CYear[date]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: Future Bahai Calendar

8888888888         888                                  888888b.            888               d8b 
888                888                                  888  "88b           888               Y8P 
888                888                                  888  .88P           888                   
8888888   888  888 888888 888  888 888d888  .d88b.      8888888K.   8888b.  88888b.   8888b.  888 
888       888  888 888    888  888 888P"   d8P  Y8b     888  "Y88b     "88b 888 "88b     "88b 888 
888       888  888 888    888  888 888     88888888     888    888 .d888888 888  888 .d888888 888 
888       Y88b 888 Y88b.  Y88b 888 888     Y8b.         888   d88P 888  888 888  888 888  888 888 
888        "Y88888  "Y888  "Y88888 888      "Y8888      8888888P"  "Y888888 888  888 "Y888888 888 

*)


(** haifa **)

Haifa[] = Location["Haifa, Israel", Deg[32.82], Deg[35], Mt[0], 2]


(** sunset-in-haifa **)

SunsetInHaifa[date_Integer] :=
	UniversalFromStandard[SunsetC[date, Haifa[]], Haifa[]]


(** future-bahai-new-year-on-or-before **)

FutureBahaiNewYearOnOrBefore[date_Integer] :=
	Module[{approx},
		approx = EstimatePriorSolarLongitude[SunsetInHaifa[date], Spring[]];
		MNext[Floor[approx] - 1, (SolarLongitudeC[SunsetInHaifa[#]] <= Spring[] + Deg[2])&]
	]


(** fixed-from-future-bahai **)

ToFixed[date_?FutureBahaiQ] :=
	Module[{month, day, years},
		month = CMonth[date];
		day = CDay[date];
		years = 361 (CMajor[date] - 1) +
			19 (CCycle[date] - 1) +
			CYear[date];
		Which[
			month == 19,
				FutureBahaiNewYearOnOrBefore[BahaiEpoch[] + Floor[MeanTropicalYear[] (years + 1/2)]] - 19 + day - 1,
			month == AyyamIHa[],
				FutureBahaiNewYearOnOrBefore[BahaiEpoch[] + Floor[MeanTropicalYear[] (years - 1/2)]] + 342 + day - 1,
			True,
				FutureBahaiNewYearOnOrBefore[BahaiEpoch[] + Floor[MeanTropicalYear[] (years - 1/2)]] + (month - 1) 19 + day - 1
		]
	]


(** future-bahai-from-fixed **)

FutureBahai[date_Integer] :=
	Module[{newYear, years, major, cycle, year, days, month, day},
		newYear = FutureBahaiNewYearOnOrBefore[date];
		years = Round[(newYear - BahaiEpoch[]) / MeanTropicalYear[]];
		major = Quotient[years, 361] + 1;
		cycle = Quotient[Mod[years, 361], 19] + 1;
		year = Mod[years, 19] + 1;
		days = date - newYear;
		month = Which[
			date >= ToFixed[FutureBahai[major, cycle, year, 19, 1]],
				19,
			date >= ToFixed[FutureBahai[major, cycle, year, AyyamIHa[], 1]],
				AyyamIHa[],
			True,
				Quotient[days, 19] + 1
		];
		day = date + 1 - ToFixed[FutureBahai[major, cycle, year, month, 1]];
		FutureBahai[major, cycle, year, month, day]
	]


(** feast-of-ridvan **)

FeastOfRidvan[gYear_Integer] :=
	Module[{years, major, cycle, year},
		years = gYear - GregorianYearFromFixed[BahaiEpoch[]];
		major = 1 + Quotient[years, 361];
		cycle = 1 + Quotient[Mod[years, 361], 19];
		year = 1 + Mod[years, 19];
		ToFixed[FutureBahai[major, cycle, year, 2, 13]]
	]


Format[date_FutureBahai] :=
	Format[Apply[Bahai, date]]


(*
;;;; Section: French Revolutionary Calendar

8888888888                                   888      
888                                          888      
888                                          888      
8888888   888d888  .d88b.  88888b.   .d8888b 88888b.  
888       888P"   d8P  Y8b 888 "88b d88P"    888 "88b 
888       888     88888888 888  888 888      888  888 
888       888     Y8b.     888  888 Y88b.    888  888 
888       888      "Y8888  888  888  "Y8888P 888  888 

*)


(** french-epoch **)

FrenchEpoch[] = ToFixed[Gregorian[1792, September[], 22]]


(** paris **)

Paris[] = Location["Paris, France", Angle[48, 50, 11], Angle[2, 20, 15], Mt[27], 1]


(** midnight-in-paris **)

MidnightInParis[date_Integer] :=
	UniversalFromStandard[Midnight[date + 1, Paris[]], Paris[]]


(** french-new-year-on-or-before **)

FrenchNewYearOnOrBefore[date_Integer] :=
	Module[{approx},
		approx = EstimatePriorSolarLongitude[MidnightInParis[date], Autumn[]];
		MNext[Floor[approx] - 1, (Autumn[] <= SolarLongitudeC[MidnightInParis[#]])&]
	]


(** fixed-from-french **)

ToFixed[date_?FrenchQ] :=
	Module[{month, day, year, newYear},
		month = CMonth[date];
		day = CDay[date];
		year = CYear[date];
		newYear = FrenchNewYearOnOrBefore[
			Floor[FrenchEpoch[] + 180 + MeanTropicalYear[] * (year - 1)]];
		newYear - 1 + 30 (month - 1) + day
	]


(** french-from-fixed **)

French[date_Integer] :=
	Module[{newYear, year, month, day},
		newYear = FrenchNewYearOnOrBefore[date];
		year = Round[(newYear - FrenchEpoch[]) / MeanTropicalYear[]] + 1;
		month = Quotient[date - newYear, 30] + 1;
		day = Mod[date - newYear, 30] + 1;
		French[year, month, day]
	]


MonthNames[French, ASCII] = {
	"Vendemiaire",
	"Brumaire",
	"Frimaire",
	"Nivose",
	"Pluviose",
	"Ventose",
	"Germinal",
	"Floreal",
	"Prairial",
	"Messidor",
	"Thermidor",
	"Fructidor"}


DayOfWeekCNames[French, ASCII] = {
	"Primidi",
	"Duodi",
	"Tridi",
	"Quartidi",
	"Quintidi",
	"Sextidi",
	"Septidi",
	"Octidi",
	"Nonidi",
	"Decadi"}


SpecialDayNames[French, ASCII] = {
	"Jour de la Vertu",
	"Jour du Genie",
	"Jour du Labour",
	"Jour de la Raison",
	"Jour de la Recompense",
	"Jour de la Revolution"}


Format[date_French] :=
	If[FrenchQ[date],
		If[CMonth[date] == 13,
			StringForm["`` de l'Annee `` de la Revolution",
				NameFromNumber[CDay[date], SpecialDayNames[French, ASCII]],
				CYear[date]
			],
			StringForm["Decade ``, `` de `` de l'Annee `` de la Revolution",
				{"I", "II", "III"}[[Quotient[CDay[date] - 1, 10] + 1]],
				NameFromNumber[CDay[date], DayOfWeekCNames[French, ASCII]],
				NameFromMonth[CMonth[date], French],
				CYear[date]
			]
		],
		ToString[InputForm[date]]
	]


(*
;;;; Section: Chinese Calendar

 .d8888b.  888      d8b                                     
d88P  Y88b 888      Y8P                                     
888    888 888                                              
888        88888b.  888 88888b.   .d88b.  .d8888b   .d88b.  
888        888 "88b 888 888 "88b d8P  Y8b 88K      d8P  Y8b 
888    888 888  888 888 888  888 88888888 "Y8888b. 88888888 
Y88b  d88P 888  888 888 888  888 Y8b.          X88 Y8b.     
 "Y8888P"  888  888 888 888  888  "Y8888   88888P'  "Y8888  

*)


(** chinese-solar-longitude-on-or-after **)

ChineseSolarLongitudeOnOrAfter[date_, theta_] :=
	Module[{tee},
		tee = SolarLongitudeAfter[UniversalFromStandard[date, ChineseLocation[date]], theta];
		StandardFromUniversal[tee, ChineseLocation[tee]]
	]


(** midnight-in-china **)

MidnightInChina[date_Integer] :=
	UniversalFromStandard[date, ChineseLocation[date]]


(** chinese-winter-solstice-on-or-before **)

ChineseWinterSolsticeOnOrBefore[date_Integer] :=
	Module[{approx},
		approx = EstimatePriorSolarLongitude[MidnightInChina[date + 1], Winter[]];
		MNext[Floor[approx] - 1, (Winter[] <= SolarLongitudeC[MidnightInChina[# + 1]])&]
	]


(** chinese-new-year-in-sui **)

ChineseNewYearInSui[date_Integer] :=
	Module[{s1, s2, m12, m13, nextM11},
		s1 = ChineseWinterSolsticeOnOrBefore[date];
		s2 = ChineseWinterSolsticeOnOrBefore[s1 + 370];
		m12 = ChineseNewMoonOnOrAfter[s1 + 1];
		m13 = ChineseNewMoonOnOrAfter[m12 + 1];
		nextM11 = ChineseNewMoonBefore[s2 + 1];
		If[Round[(nextM11 - m12) / MeanSynodicMonth[]] == 12 && (NoMajorSolarTermQ[m12] || NoMajorSolarTermQ[m13]),
			ChineseNewMoonOnOrAfter[m13 + 1],
			m13
		]
	]


(** chinese-new-year-on-or-before **)

ChineseNewYearOnOrBefore[date_Integer] :=
	Module[{newYear},
		newYear = ChineseNewYearInSui[date];
		If[date >= newYear,
			newYear,
			ChineseNewYearInSui[date - 180]
		]
	]


(** chinese-new-year **)

ChineseNewYear[gYear_Integer] :=
	ChineseNewYearOnOrBefore[ToFixed[Gregorian[gYear, July[], 1]]]


(** chinese-name **)

ChineseName[stem_Integer, branch_Integer] :=
	If[Mod[stem, 2] == Mod[branch, 2], {stem, branch}, Bogus]


(** chinese-stem **)

ChineseStem[name_List] :=
	name[[1]]


(** chinese-branch **)

ChineseBranch[name_List] :=
	name[[2]]


(** chinese-day-name-epoch **)

ChineseDayNameEpoch[] = 15


(** chinese-month-name-epoch **)

ChineseMonthNameEpoch[] = 3


(** chinese-name-difference **)

ChineseNameDifference[name1_List, name2_List] :=
	Module[{stem1, stem1, branch1, branch2, stemDifference, branchDifference},
		stem1 = ChineseStem[name1];
		stem2 = ChineseStem[name2];
		branch1 = ChineseBranch[name1];
		branch2 = ChineseBranch[name2];
		stemDifference = stem2 - stem1;
		branchDifference = branch2 - branch1;
		1 + Mod[(stemDifference - 1) + 25 (branchDifference - stemDifference), 60]
	]


(** chinese-day-name-on-or-before **)

ChineseDayNameOnOrBefore[name_List, date_Integer] :=
	date - Mod[date + ChineseNameDifference[name, ChineseSexagesimalName[ChineseDayNameEpoch[]]], 60]


(** current-major-solar-term **)

CurrentMajorSolarTerm[date_Integer] :=
	Module[{s},
		s = SolarLongitudeC[UniversalFromStandard[date, ChineseLocation[date]]];
		AdjustedMod[2 + Quotient[s, Deg[30]], 12]
	]


(** major-solar-term-on-or-after **)

MajorSolarTermOnOrAfter[date_Integer] :=
	Module[{l},
		l = Mod[30 Ceiling[SolarLongitudeC[MidnightInChina[date]] / 30], 360];
		ChineseSolarLongitudeOnOrAfter[date, l]
	]


(** current-minor-solar-term **)

CurrentMinorSolarTerm[date_Integer] :=
	Module[{s},
		s = SolarLongitudeC[MidnightInChina[date]];
		AdjustedMod[3 + Quotient[s - Deg[15], Deg[30]], 12]
	]


(** minor-solar-term-on-or-after **)

MinorSolarTermOnOrAfter[date_Integer] :=
	Module[{l},
		l = Mod[30 Ceiling[(SolarLongitudeC[MidnightInChina[date]] - Deg[15]) / 30] + Deg[15], 360];
		ChineseSolarLongitudeOnOrAfter[date, l]
	]

ChineseNoMajorSolarTermQ[date_Integer]:= NoMajorSolarTermQ[date]
 
ChinesePriorLeapMonthQ[mp_, m_]:= PriorLeapMonthQ[mp,m]

(** chinese-new-moon-before **)

ChineseNewMoonBefore[date_Integer] :=
	Module[{tee},
		tee = NewMoonBefore[MidnightInChina[date]];
		Floor[StandardFromUniversal[tee, ChineseLocation[tee]]]
	]


(** chinese-new-moon-on-or-after **)

ChineseNewMoonOnOrAfter[date_Integer] :=
	Module[{tee},
		tee = NewMoonAfter[MidnightInChina[date]];
		Floor[StandardFromUniversal[tee, ChineseLocation[tee]]]
	]


(** chinese-epoch **)

ChineseEpoch[] = ToFixed[Gregorian[-2636, February[], 15]]


(** no-major-solar-term? **)

NoMajorSolarTermQ[date_Integer] :=
	CurrentMajorSolarTerm[date] == CurrentMajorSolarTerm[ChineseNewMoonOnOrAfter[date + 1]]


(** fixed-from-chinese **)

ToFixed[date_?ChineseQ] :=
	Module[{month, midYear, newYear, p, d, priorNewMoon},
		month = CMonth[date];
		midYear = Floor[ChineseEpoch[] + ((CCycle[date] - 1) 60 + (CYear[date] - 1) + .5) MeanTropicalYear[]];
		newYear = ChineseNewYearOnOrBefore[midYear];
		p = ChineseNewMoonOnOrAfter[newYear + 29 (month - 1)];
		d = Chinese[p];
		priorNewMoon = If[CMonth[date] == CMonth[d] && CLeapMonth[date] == CLeapMonth[d],
			p,
			ChineseNewMoonOnOrAfter[p + 1]];
		priorNewMoon + CDay[date] - 1
	]


(** chinese-from-fixed **)

Chinese[date_Integer] :=
	Module[{s1, s2, m12, nextM11, m, leapYear, month, leapMonth, elapsedYears, cycle, year, day},
		s1 = ChineseWinterSolsticeOnOrBefore[date];
		s2 = ChineseWinterSolsticeOnOrBefore[s1 + 370];
		m12 = ChineseNewMoonOnOrAfter[s1 + 1];
		nextM11 = ChineseNewMoonBefore[s2 + 1];
		m = ChineseNewMoonBefore[date + 1];
		leapYear = Round[(nextM11 - m12) / MeanSynodicMonth[]] == 12;
		month = AdjustedMod[
			Round[(m - m12) / MeanSynodicMonth[]] -
			If[leapYear && PriorLeapMonthQ[m12, m], 1, 0],
			12];
		leapMonth = leapYear &&
			NoMajorSolarTermQ[m] &&
			!PriorLeapMonthQ[m12, ChineseNewMoonBefore[m]];
		elapsedYears = Floor[1.5 - (month / 12) + (date - ChineseEpoch[]) / MeanTropicalYear[]];
		cycle = Quotient[elapsedYears - 1, 60] + 1;
		year = AdjustedMod[elapsedYears, 60];
		day = date - m + 1;
		Chinese[cycle, year, month, leapMonth, day]
	]


(** prior-leap-month? **)

(* RECURSIVE *)
PriorLeapMonthQ[mPrime_Integer, m_Integer] :=
	m >= mPrime && (NoMajorSolarTermQ[m] || PriorLeapMonthQ[mPrime, ChineseNewMoonBefore[m]])


(** chinese-sexagesimal-name **)

ChineseSexagesimalName[n_Integer] :=
	ChineseName[AdjustedMod[n, 10], AdjustedMod[n, 12]]


(** chinese-name-of-year **)

ChineseNameOfYear[year_Integer] :=
	ChineseSexagesimalName[year]


(** chinese-name-of-month **)

ChineseNameOfMonth[year_Integer, month_Integer] :=
	Module[{elapsedMonths},
		elapsedMonths = 12 (year - 1) + (month - 1);
		ChineseSexagesimalName[elapsedMonths + ChineseMonthNameEpoch[]]
	]


(** chinese-name-of-day **)

ChineseNameOfDay[date_Integer] :=
	ChineseSexagesimalName[date + 15]


(** dragon-festival **)

DragonFestival[gYear_Integer] :=
	Module[{elapsedYears, cycle, year},
		elapsedYears = gYear - GregorianYearFromFixed[ChineseEpoch[]] + 1;
		cycle = Quotient[elapsedYears - 1, 60] + 1;
		year = AdjustedMod[elapsedYears, 60];
		ToFixed[Chinese[cycle, year, 5, False, 5]]
	]


(** qing-ming **)

QingMing[gYear_Integer] :=
	Floor[MinorSolarTermOnOrAfter[ToFixed[Gregorian[gYear, March[], 30]]]]


(** chinese-age **)

ChineseAge[birthdate_Chinese, date_Integer] :=
	Module[{today},
		today = Chinese[date];
		If[date >= ToFixed[birthdate],
			60 (CCycle[today] - CCycle[birthdate]) + (CYear[today] - CYear[birthdate]) + 1,
			Bogus
		]
	]


(** chinese-location **)

Beijing[tee_] :=
	Location["Beijing, China", Deg[39.55], Angle[116, 25, 0], Mt[43.5], If[GregorianYearFromFixed[tee] < 1929, 1397/180, 8]]

ChineseLocation[tee_] :=
	Beijing[tee]


(** japanese-location **)

Tokyo[date_Integer] :=
	If[GregorianYearFromFixed[date] < 1888,
		Location["Tokyo, Japan", Deg[35.7], Angle[139, 46, 0], Mt[24], 9 + 143/450]
	,
		Location["Tokyo, Japan", Deg[35], Deg[135], Mt[0], 9]
	]

JapaneseLocation[date_Integer] :=
	Tokyo[date]
	
KoreanLocation[t_] := Module[{z},
   Which[earlierQ[t, Gregorian[1908, 4, 1]], z = 3809/450,
    earlierQ[t, Gregorian[1912, 1, 1]], t = 8.5,
    earlierQ[t, Gregorian[1954, 3, 21]], z = 9,
    earlierQ[t, Gregorian[1961, 8, 10]], z = 8.5,
    True, z = 9];
   Location["KoreanLocation", Angle[37, 34, 0], Angle[126, 58, 0], 
    Mt[0], z]]
	
KoreanYear[cycle_, year_] := 6 \.080*cycle + year - 364;

VietnameseLocation[date_Integer] := 
 If[GregorianYearFromFixed[date] < 1968,
  Location["VietnameseLocation", Angle[21, 2, 0], Angle[105, 51, 0], 
   Mt[12], 8],
  Location["VietnameseLocation", Angle[21, 2, 0], Angle[105, 51, 0], 
   Mt[12], 7]]

YearNames[Chinese, ASCII, Stem] = {
	"Jia",
	"Yi",
	"Bing",
	"Ding",
	"Wu",
	"Ji",
	"Geng",
	"Xin",
	"Ren",
	"Gui"}


YearNames[Chinese, ASCII, Branch] = {
	"Zi",
	"Chou",
	"Yin",
	"Mao",
	"Chen",
	"Si",
	"Wu",
	"Wei",
	"Shen",
	"You",
	"Xu",
	"Hai"}


Format[date_Chinese]:=
	If[ChineseQ[date],
		Module[{nameOfYear},
			nameOfYear = ChineseNameOfYear[CYear[date]];
			StringForm["cycle ``, year ``-``, ``month ``, day ``",
				CCycle[date],
				NameFromNumber[ChineseStem[nameOfYear], YearNames[Chinese, ASCII, Stem]],
				NameFromNumber[ChineseBranch[nameOfYear], YearNames[Chinese, ASCII, Branch]],
				If[CLeapMonth[date], "leap ", ""],
				CMonth[date],
				CDay[date]
			]
		],
		ToString[InputForm[date]]
	]

(* Dee Calender *)
DeeLeapQ[j_] := 
  If[j >= 1, Mod[Mod[j - 1, 33], 4] == 3, Mod[Mod[-j, 33], 4] == 1]
  
numDaysInDeeMonth[j_, m_] := Module[{erg},
   If[(m < 1) || (m > 12), Return[0 ]];
   Which[m == 2,
    If[DeeLeapQ[j], erg = 29, erg = 28],
    (m == 4) || (m == 6) || (m == 9) || (m == 11), erg = 30, 
    True, erg = 31]; 
   erg]
   
ToFixed[Dee[j_, m_, d_]] := Module[{erg, cycleNum, y, x, gm},
   If[Not[(d >= 1) && (d <= numDaysInDeeMonth[j, m ])], Return[{}]];
   If[j >= 1, cycleNum = Quotient[j - 1, 33]; y = Mod[j - 1, 33],
                      cycleNum = -Quotient[-j, 33] - 1; 
    y = 32 - Mod[-j, 33]];
   x = cycleNum *12053 + y*365 + Quotient[y, 4];
   Do[x = x + numDaysInDeeMonth[j, gm], {gm, 1, m - 1}];
   erg = x + d - 1;
   erg]
   
Dee[x_] := Module[{erg, j, m, d, gd, numDaysInYear, numDaysInMonth},
   If[x >= 0, j = 1 + Quotient[x, 12053]*33; 
    gd = Mod[x, 12053], 
    j = -(Quotient[-x - 1, 12053]*33) - 32; 
    gd = 12052 - Quotient[-x - 1, 12053]];
   Do[If[DeeLeapQ[i], numDaysInYear = 366, numDaysInYear = 365];
    If[gd < numDaysInYear, Break[], j = j + 1; 
     gd = gd - numDaysInYear], {i, 1, 33}];
   m = 1; 
   Do[numDaysInMonth = numDaysInDeeMonth[j, i]; 
    If[gd < numDaysInMonth, Break[], m = m + 1; 
     gd = gd - numDaysInMonth], {i, 1, 12}];
   d = gd + 1;
   Dee[j, m, d]]
   
   (* Yazdegerd calendar *)
ToFixed[date_?YazdegerdQ] := Module[{j,m,d,jg, mg, dg},
   j = CYear[date]; m = CMonth[date]; d= CDay[date];
   Which[m == 12, jg = j + 631; mg = 3; dg = d,
              m == 1 && d < 12, jg = j + 630; mg = 3; dg = d + 20,
              m == 1 && d > 11, jg = j + 630; mg = 4; dg = d - 11,
             1 < m < 10, jg = j + 630; mg = m + 3; dg = d,
             9 < m < 12, jg = j + 631; mg = m - 9; dg = d];
   ToFixed[Gregorian[jg, mg, dg]]
   ]

Yazdegerd[fixed_Integer] := Module[{g, j, m, d, jy, my, dy},
  g = Gregorian[fixed]; j = g[[1]]; m = g[[2]]; d = g[[3]];
  Which[m == 3 && d < 21, jy = j - 631; my = 12; dy = d,
   m == 3 && d > 20, jy = j - 630; my = 1; dy = d - 20,
   m == 4, jy = j - 630; my = 1; dy = d + 11,
   m > 4, jy = j - 630; my = m - 3; dy = d,
   m < 3, jy = j - 631; my = m + 8; dy = d];
  Yazdegerd[jy, my, dy]]
  
  MonthNames[Yazdegerd, ASCII] = {
	"Fharvardin",
	"Adarpahascht",
	"Chardad",
	"Thirmeh",
	"Merdedmeh",
	"Schaharimeh",
	"Meharmeh",
	"Abenmeh",
	"Azarmeh",
	"Dimeh",
	"Benmeh",
	"Asphandar"}


Format[date_Yazdegerd] :=
	If[YazdegerdQ[date],
		StringForm["`` `` `` Y.E.", 
			CDay[date],
			NameFromMonth[CMonth[date], Yazdegerd],
			CYear[date]
		],
		ToString[InputForm[date]]
	]
	
	(* Iluminati calendar *)
	
	ToFixed[Illuminati_] := 
  Module[{grund = {{1, 0}, {1, 15}, {1, 30}, {2, 14}, {3, 0}, {3, 
       14}, {3, 29}, {4, 13}, {4, 28}, {5, 12}, {5, 26}, {6, 10}, {6, 
       25}, {7, 10}, {7, 24}, {8, 7}, {8, 22}, {9, 6}, {9, 21}, {10, 
       5}, {10, 19}, {11, 3}, {11, 18}, {12, 3}, {12, 17}}, 
    jahr = Illuminati[[1]] - 4000}, 
   startmon = grund[[Illuminati[[2]], 1]];
   starttag = grund[[Illuminati[[2]], 2]];
   ToFixed[
    DaysPlusC[Gregorian[jahr, startmon, starttag], 
     Illuminati[[3]]]]]
	 
Illuminati[fixed_] := 
  Module[{grund = {{1, 0}, {1, 15}, {1, 30}, {2, 14}, {3, 0}, {3, 
       14}, {3, 29}, {4, 13}, {4, 28}, {5, 12}, {5, 26}, {6, 10}, {6, 
       25}, {7, 10}, {7, 24}, {8, 7}, {8, 22}, {9, 6}, {9, 21}, {10, 
       5}, {10, 19}, {11, 3}, {11, 18}, {12, 3}, {12, 17}}, 
    gregor = Gregorian[fixed], klasse = 0, erfolg = False, datum1, 
    datum2},
   While[erfolg == False,
    klasse += 1;
    datum1 = 
     Gregorian[CYear[gregor], grund[[klasse, 1]], 
      grund[[klasse, 2]] + 1];
    datum2 = 
     Gregorian[CYear[gregor], grund[[klasse + 1, 1]], 
      grund[[klasse + 1, 2]] + 1];
    erfolg = (DateDistanceC[datum1, gregor] + 1) >= 
       0 && (DateDistanceC[datum2, gregor] + 1) < 0 ];
   ja = CYear[gregor] + 4000; mo = klasse;
   ta = DateDistanceC[
     Gregorian[CYear[gregor], grund[[klasse, 1]], grund[[klasse, 2]]],
      gregor];
   Illuminati[ja, mo, ta]]
   
illuInfo[Illuminati_] := 
 Module[{namen = {"Verwirrung", "Zwietracht", "Unordnung", 
     "Beamtenherrschaft", "Grummet"}, nr, rad, jz, heisst}, 
  nr = Mod[Illuminati[[3]], 5]; 
  If[nr == 0 || nr == 4, rad = "Zweirad", rad = "Dreirad"];
  jz = Ceiling[Illuminati[[3]]/5];
  heisst = namen[[jz]];
  {jz, heisst, rad}]


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
;;;; Section: JW Calendar *)

JW[date_Integer] := 
 Module[{year = First[Gregorian[date]], start, dd, month, day},
  start = ToFixed[BLCNewYear[year]];
  If[date < start, year = year - 1; start = ToFixed[BLCNewYear[year]]];
 dd = date - start; 
  month = Quotient[dd, 30] + 1; day = Mod[dd, 30] + 1;
  JW[year, month, day]]

ToFixed[date_?JWQ] := ToFixed[BLCNewYear[CYear[date]]] + (CMonth[date] - 1)*30 + CDay[date] - 1

Format[date_JW] :=
	Format[Apply[Samaritan, date]]

(*
;;;; Section: Tibetan Calendar
*)

TibetanEpoch[] = ToFixed[Gregorian[-127, 12, 7]]

TibetanSunEquation[alpha_] :=
 Which[alpha > 6, -TibetanSunEquation[alpha - 6], alpha > 3, 
  TibetanSunEquation[6 - alpha], alpha == 0, 0,
  IntegerQ[alpha], Part[{0, 6/60, 10/60, 11/60}, alpha], True, 
  Mod[alpha, 1]*TibetanSunEquation[Ceiling[alpha]] + 
   Mod[-alpha, 1]*TibetanSunEquation[Floor[alpha]]]

TibetanMoonEquation[alpha_] :=
 Which[alpha > 14, -TibetanMoonEquation[alpha - 14], alpha > 7, 
  TibetanMoonEquation[14 - alpha], alpha == 0, 0,
  IntegerQ[alpha], 
  Part[{0, 5/60, 10/60, 15/60, 19/60, 22/60, 24/60, 25/60}, alpha], 
  True,
  Mod[alpha, 1]*TibetanMoonEquation[Ceiling[alpha]] + 
   Mod[-alpha, 1]*TibetanMoonEquation[Floor[alpha]]]


ToFixed[date_?TibetanQ] :=
 Module[{year = CYear[date], month = CMonth[date], leapMonth = CLeapMonth[date], 
   day = CDay[date], leapDay = CLeapDay[date],
   months, days, mean, solarAnomaly, lunarAnomaly, sun, moon},
  months = 
   Floor[804/65*(year - 1) + 67/65*month + If[leapMonth, -1, 0] + 
     64/65];
  days = 30*months + day;
  mean = days*11135/11312 - 30 + If[leapDay, 0, -1] + 1071/1616;
  solarAnomaly = Mod[days*13/4824 + 2117/4824, 1];
  lunarAnomaly = Mod[days*3781/105840 + 2837/15120, 1];
  sun = -TibetanSunEquation[12*solarAnomaly];
  moon = TibetanMoonEquation[28*lunarAnomaly];
  Floor[TibetanEpoch[] + mean + sun + moon]]

Tibetan[date_Integer] := 
  Module[{capY, years, year0, month0, est, day0, leapMonth, day, 
    month, year, leapDay},
   capY = 365 + 4975/18382; 
   years = Ceiling[(date - TibetanEpoch[])/capY];
   year0 = 
    MFinal[years, date >= ToFixed[Tibetan[#, 1, False, 1, False]] &];
   month0 = 
    MFinal[1, date >= ToFixed[Tibetan[year0, #, False, 1, False]] &];
   est = date - ToFixed[Tibetan[year0, month0, False, 1, False]];
   day0 = 
    MFinal[est - 2, 
     date >= ToFixed[Tibetan[year0, month0, False, #, False]] &];
   leapMonth = (day0 > 30);
   day = AdjustedMod[day0, 30];
   month = 
    Which[day > day0, month0 - 1, leapMonth, month0 + 1, True, 
     month0]; month = AdjustedMod[month, 12];
   year = 
    Which[(day > day0) && (month0 == 1), year0 - 1, 
     leapMonth && (month0 == 12), year0 + 1, True, year0];
   leapDay = (date == 
      ToFixed[Tibetan[year, month, leapMonth, day, True]]);
   Tibetan[year, month, leapMonth, day, leapDay]]

TibetanLeapMonthQ[tmonth_, tyear_] :=
 tmonth == 
  CMonth[Tibetan[ToFixed[Tibetan[tyear, tmonth, True, 2, False]]]]

Losar[tyear_] := 
 Module[{tleap = TibetanLeapMonthQ[1, tyear]}, 
  ToFixed[Tibetan[tyear, 1, tleap, 1, False]]]

TibetanNewYear[gyear_] := 
 Module[{dec31 = GregorianYearEnd[gyear], tyear}, 
  tyear = CYear[Tibetan[dec31]];
  ListRange[{Losar[1 - tyear], Losar[tyear]}, 
   GregorianYearRange[gyear]]]

(* The month names, first in Sanskrit, and then in Tibetan *)

MonthNames[Tibetan, ASCII] = {
	"sk:Phalguna    tb:dbo",
	"sk:Citra       tb:nag pa",
	"sk:Vishakha    tb:sa ga",
	"sk:Jyoshita    tb:snron",
	"sk:Purvashadha tb:chu stod",
	"sk:Shravana    tb:gro bzhin",
	"sk:Bhadrapada  tb:khrums",
	"sk:Ashvini     tb:tha skar",
	"sk:Krittika    tb:smin drug",
	"sk:Mrigashira  tb:mgo",
	"sk:Pushya      tb:rgyal",
	"sk:Magha       tb:mchu"}


DayOfWeekCNames[Tibetan, ASCII] = {
	"gza' nyi ma", 
	"gza' zla ba", 
	"gza' mig dmar", 
	"gza' lhag pa", 
	"gza' phur bu", 
	"gza' pa sangs", 
	"gza' spen pa"}


Format[date_Tibetan]:=
	If[TibetanQ[date],
		StringForm["``, `` `` `` `` `` ",
			NameFromDayOfWeekC[ToFixed[date], Tibetan],
			CYear[date],
			NameFromNumber[CMonth[date], MonthNames[Tibetan, ASCII]],
			CLeapMonth[date],
                        CDay[date],
			CLeapDay[date]
		],
		ToString[InputForm[date]]
	]




(*
;;;; Section: Test Code

88888888888                  888         .d8888b.                888          
    888                      888        d88P  Y88b               888          
    888                      888        888    888               888          
    888     .d88b.  .d8888b  888888     888         .d88b.   .d88888  .d88b.  
    888    d8P  Y8b 88K      888        888        d88""88b d88" 888 d8P  Y8b 
    888    88888888 "Y8888b. 888        888    888 888  888 888  888 88888888 
    888    Y8b.          X88 Y88b.      Y88b  d88P Y88..88P Y88b 888 Y8b.     
    888     "Y8888   88888P'  "Y888      "Y8888P"   "Y88P"   "Y88888  "Y8888  
                                                                              
*)

(* These test tables (except where specified otherwise) were transcribed from Appendix C of _Calendrical Calculations_ *)

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

TestDates[Egyptian] = {{161, 7, 15}, {580, 3, 6}, {818, 2, 22}, {883, 3, 15}, 
	{1217, 9, 15}, {1324, 2, 18}, {1442, 9, 10}, {1761, 5, 8}, 
	{1844, 6, 28}, {1938, 5, 18}, {1988, 5, 18}, {2036, 6, 23}, 
	{2046, 7, 20}, {2139, 9, 28}, {2184, 5, 29}, {2240, 8, 19}, 
	{2302, 2, 11}, {2308, 7, 30}, {2396, 11, 29}, {2428, 12, 27}, 
	{2465, 1, 24}, {2517, 1, 2}, {2568, 2, 27}, {2587, 10, 29}, 
	{2651, 12, 7}, {2678, 4, 17}, {2690, 5, 25}, {2691, 12, 17}, 
	{2692, 6, 3}, {2740, 11, 27}, {2744, 11, 7}, {2787, 8, 1}, 
	{2843, 4, 20}}

TestDates[Armenian] = {{-1138, 4, 10}, {-720, 12, 6}, {-482, 11, 22}, {-417, 12, 15}, {-82, 6, 10}, {24, 11, 18}, 
	{143, 6, 5}, {462, 2, 3}, {545, 3, 23}, {639, 2, 13}, {689, 2, 13}, {737, 3, 18}, {747, 4, 15}, 
	{840, 6, 23}, {885, 2, 24}, {941, 5, 14}, {1002, 11, 11}, {1009, 4, 25}, {1097, 8, 24}, 
	{1129, 9, 22}, {1165, 10, 24}, {1217, 10, 2}, {1268, 11, 27}, {1288, 7, 24}, {1352, 9, 2}, 
	{1379, 1, 12}, {1391, 2, 20}, {1392, 9, 12}, {1393, 2, 28}, {1441, 8, 22}, {1445, 8, 2}, 
	{1488, 4, 26}, {1544, 1, 15}}

TestDates[Gregorian] = {
	{-586, 7, 24}, {-168, 12, 5}, {70, 9, 24}, {135, 10, 2}, {470, 1, 8}, {576, 5, 20}, {694, 11, 10}, {1013, 4, 25}, {1096, 5, 24}, {1190, 3, 23}, {1240, 3, 10},
	{1288, 4, 2}, {1298, 4, 27}, {1391, 6, 12}, {1436, 2, 3}, {1492, 4, 9}, {1553, 9, 19}, {1560, 3, 5}, {1648, 6, 10}, {1680, 6, 30}, {1716, 7, 24}, {1768, 6, 19},
	{1819, 8, 2}, {1839, 3, 27}, {1903, 4, 19}, {1929, 8, 25}, {1941, 9, 29}, {1943, 4, 19}, {1943, 10, 7}, {1992, 3, 17}, {1996, 2, 25}, {2038, 11, 10}, {2094, 7, 18}}

TestDates[Julian] = {
	{-587, 7, 30}, {-169, 12, 8}, {70, 9, 26}, {135, 10, 3}, {470, 1, 7}, {576, 5, 18}, {694, 11, 7}, {1013, 4, 19}, {1096, 5, 18}, {1190, 3, 16}, {1240, 3, 3}, 
	{1288, 3, 26}, {1298, 4, 20}, {1391, 6, 4}, {1436, 1, 25}, {1492, 3, 31}, {1553, 9, 9}, {1560, 2, 24}, {1648, 5, 31}, {1680, 6, 20}, {1716, 7, 13}, {1768, 6, 8}, 
	{1819, 7, 21}, {1839, 3, 15}, {1903, 4, 6}, {1929, 8, 12}, {1941, 9, 16}, {1943, 4, 6}, {1943, 9, 24}, {1992, 3, 4}, {1996, 2, 12}, {2038, 10, 28}, {2094, 7, 5}}

TestDates[Roman] = {
	{-587, 8, 1, 3, False}, {-169, 12, 3, 6, False}, {70, 10, 1, 6, False}, {135, 10, 2, 5, False}, {470, 1, 3, 7, False}, {576, 6, 1, 15, False}, 
	{694, 11, 3, 7, False}, {1013, 5, 1, 13, False}, {1096, 6, 1, 15, False}, {1190, 4, 1, 17, False}, {1240, 3, 2, 5, False}, {1288, 4, 1, 7, False}, 
	{1298, 5, 1, 12, False}, {1391, 6, 2, 2, False}, {1436, 2, 1, 8, False}, {1492, 4, 1, 2, False}, {1553, 9, 3, 5, False}, {1560, 3, 1, 6, False}, 
	{1648, 6, 1, 2, False}, {1680, 7, 1, 12, False}, {1716, 7, 3, 3, False}, {1768, 6, 3, 6, False}, {1819, 8, 1, 12, False}, {1839, 3, 3, 1, False}, 
	{1903, 4, 3, 8, False}, {1929, 8, 3, 2, False}, {1941, 10, 1, 16, False}, {1943, 4, 3, 8, False}, {1943, 10, 1, 8, False}, {1992, 3, 2, 4, False}, 
	{1996, 2, 3, 2, False}, {2038, 11, 1, 5, False}, {2094, 7, 2, 3, False}}

TestDates[Coptic] = {
	{-870, 12, 6}, {-451, 4, 12}, {-213, 1, 29}, {-148, 2, 5}, {186, 5, 12}, {292, 9, 23}, {411, 3, 11}, {729, 8, 24}, {812, 9, 23}, {906, 7, 20}, {956, 7, 7}, 
	{1004, 7, 30}, {1014, 8, 25}, {1107, 10, 10}, {1152, 5, 29}, {1208, 8, 5}, {1270, 1, 12}, {1276, 6, 29}, {1364, 10, 6}, {1396, 10, 26}, {1432, 11, 19}, {1484, 10, 14}, 
	{1535, 11, 27}, {1555, 7, 19}, {1619, 8, 11}, {1645, 12, 19}, {1658, 1, 19}, {1659, 8, 11}, {1660, 1, 26}, {1708, 7, 8}, {1712, 6, 17}, {1755, 3, 1}, {1810, 11, 11}}

TestDates[Ethiopic] = {
	{-594, 12, 6}, {-175, 4, 12}, {63, 1, 29}, {128, 2, 5}, {462, 5, 12}, {568, 9, 23}, {687, 3, 11}, {1005, 8, 24}, {1088, 9, 23}, {1182, 7, 20}, {1232, 7, 7}, 
	{1280, 7, 30}, {1290, 8, 25}, {1383, 10, 10}, {1428, 5, 29}, {1484, 8, 5}, {1546, 1, 12}, {1552, 6, 29}, {1640, 10, 6}, {1672, 10, 26}, {1708, 11, 19}, {1760, 10, 14}, 
	{1811, 11, 27}, {1831, 7, 19}, {1895, 8, 11}, {1921, 12, 19}, {1934, 1, 19}, {1935, 8, 11}, {1936, 1, 26}, {1984, 7, 8}, {1988, 6, 17}, {2031, 3, 1}, {2086, 11, 11}}

TestDates[ISO] = {
	{-586, 29, 7}, {-168, 49, 3}, {70, 39, 3}, {135, 39, 7}, {470, 2, 3}, {576, 21, 1}, {694, 45, 6}, {1013, 16, 7}, {1096, 21, 7}, {1190, 12, 5}, {1240, 10, 6},
	{1288, 14, 5}, {1298, 17, 7}, {1391, 23, 7}, {1436, 5, 3}, {1492, 14, 6}, {1553, 38, 6}, {1560, 9, 6}, {1648, 24, 3}, {1680, 26, 7}, {1716, 30, 5}, {1768, 24, 7},
	{1819, 31, 1}, {1839, 13, 3}, {1903, 16, 7}, {1929, 34, 7}, {1941, 40, 1}, {1943, 16, 1}, {1943, 40, 4}, {1992, 12, 2}, {1996, 8, 7}, {2038, 45, 3}, {2094, 28, 7}}

TestDates[Islamic] = {
	{-1245, 12, 9}, {-813, 2, 23}, {-568, 4, 1}, {-501, 4, 6}, {-157, 10, 17}, {-47, 6, 3}, {75, 7, 13}, {403, 10, 5}, {489, 5, 22}, {586, 2, 7}, {637, 8, 7}, 
	{687, 2, 20}, {697, 7, 7}, {793, 7, 1}, {839, 7, 6}, {897, 6, 1}, {960, 9, 30}, {967, 5, 27}, {1058, 5, 18}, {1091, 6, 2}, {1128, 8, 4}, {1182, 2, 3}, 
	{1234, 10, 10}, {1255, 1, 11}, {1321, 1, 21}, {1348, 3, 19}, {1360, 9, 8}, {1362, 4, 13}, {1362, 10, 7}, {1412, 9, 13}, {1416, 10, 5}, {1460, 10, 12}, {1518, 3, 5}}

TestDates[Hebrew] = {
	{3174, 5, 10}, {3593, 9, 25}, {3831, 7, 3}, {3896, 7, 9}, {4230, 10, 18}, {4336, 3, 4}, {4455, 8, 13}, {4773, 2, 6}, {4856, 2, 23}, {4950, 1, 7}, {5000, 13, 8}, 
	{5048, 1, 21}, {5058, 2, 7}, {5151, 4, 1}, {5196, 11, 7}, {5252, 1, 3}, {5314, 7, 1}, {5320, 12, 27}, {5408, 3, 20}, {5440, 4, 3}, {5476, 5, 5}, {5528, 4, 4}, 
	{5579, 5, 11}, {5599, 1, 12}, {5663, 1, 22}, {5689, 5, 19}, {5702, 7, 8}, {5703, 1, 14}, {5704, 7, 8}, {5752, 13, 12}, {5756, 12, 5}, {5799, 8, 12}, {5854, 5, 5}}

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

TestDates[MayanLongCount] = {
	{6, 8, 3, 13, 9}, {7, 9, 8, 3, 15}, {8, 1, 9, 8, 11}, {8, 4, 15, 7, 19}, {9, 1, 14, 10, 9}, 
	{9, 7, 2, 8, 17}, {9, 13, 2, 12, 9}, {10, 9, 5, 14, 2}, {10, 13, 10, 1, 7}, {10, 18, 5, 4, 17}, 
	{11, 0, 15, 17, 7}, {11, 3, 4, 13, 2}, {11, 3, 14, 16, 19}, {11, 8, 9, 7, 12}, {11, 10, 14, 12, 18}, 
	{11, 13, 11, 12, 18}, {11, 16, 14, 1, 0}, {11, 17, 0, 10, 19}, {12, 1, 10, 2, 18}, {12, 3, 2, 12, 6}, 
	{12, 4, 19, 4, 18}, {12, 7, 11, 16, 16}, {12, 10, 3, 14, 6}, {12, 11, 3, 13, 3}, {12, 14, 8, 13, 1},
	{12, 15, 15, 8, 6}, {12, 16, 7, 13, 4}, {12, 16, 9, 5, 11}, {12, 16, 9, 14, 2}, {12, 18, 18, 16, 16}, 
	{12, 19, 2, 16, 16}, {13, 1, 6, 4, 15}, {13, 4, 2, 13, 14}}

TestDates[Bahai] = {
	{-6, 6, 3, 7, 12}, {-5, 9, 3, 14, 13}, {-4, 2, 13, 10, 17}, {-4, 6, 2, 11, 6}, {-3, 4, 13, 16, 9},
	{-3, 10, 6, 4, 4}, {-3, 16, 10, 13, 7}, {-2, 14, 6, 2, 17}, {-2, 18, 13, 4, 8}, {-1, 4, 12, 1, 3},
	{-1, 7, 4, 19, 9}, {-1, 9, 15, 1, 13}, {-1, 10, 6, 2, 19}, {-1, 15, 4, 5, 8}, {-1, 17, 10, 17, 16},
	{0, 1, 10, 2, 1}, {0, 4, 14, 10, 12}, {0, 5, 1, 19, 4}, {0, 9, 14, 5, 6}, {0, 11, 8, 6, 7},
	{0, 13, 6, 7, 12}, {0, 16, 1, 5, 15}, {0, 18, 14, 8, 2}, {0, 19, 15, 1, 7}, {1, 4, 3, 2, 11},
	{1, 5, 10, 9, 6}, {1, 6, 3, 11, 3}, {1, 6, 5, 2, 11}, {1, 6, 5, 11, 11}, {1, 8, 15, 19, 16},
	{1, 8, 19, 18, 19}, {1, 11, 5, 13, 7}, {1, 14, 4, 7, 6}}

TestDates[ArithmeticPersian] = {
	{-1208, 5, 1}, {-790, 9, 14}, {-552, 7, 2}, {-487, 7, 9}, {-153, 10, 18}, {-46, 2, 30}, {73, 8, 19}, {392, 2, 5}, {475, 3, 3}, {569, 1, 3}, {618, 12, 20}, 
	{667, 1, 14}, {677, 2, 8}, {770, 3, 22}, {814, 11, 13}, {871, 1, 21}, {932, 6, 28}, {938, 12, 14}, {1027, 3, 21}, {1059, 4, 10}, {1095, 5, 2}, {1147, 3, 30}, 
	{1198, 5, 10}, {1218, 1, 7}, {1282, 1, 29}, {1308, 6, 3}, {1320, 7, 7}, {1322, 1, 29}, {1322, 7, 14}, {1370, 12, 27}, {1374, 12, 6}, {1417, 8, 19}, {1473, 4, 28}}

TestDates[ModifiedFrench] = {
	{-2378, 11, 4}, {-1959, 3, 13}, {-1721, 1, 2}, {-1656, 1, 10}, {-1322, 4, 18}, {-1216, 9, 1}, {-1097, 2, 19}, {-779, 8, 4}, {-696, 9, 5}, {-602, 7, 1}, {-552, 6, 20}, 
	{-504, 7, 13}, {-494, 8, 8}, {-401, 9, 23}, {-356, 5, 13}, {-300, 7, 19}, {-239, 13, 1}, {-232, 6, 14}, {-144, 9, 22}, {-112, 10, 12}, {-76, 11, 6}, {-24, 10, 1}, 
	{27, 11, 14}, {47, 7, 6}, {111, 7, 29}, {137, 12, 7}, {150, 1, 7}, {151, 7, 29}, {152, 1, 15}, {200, 6, 27}, {204, 6, 7}, {247, 2, 20}, {302, 11, 1}}

TestDates[MayanHaab] = {
	{11, 12}, {5, 3}, {4, 9}, {5, 12}, {14, 12}, {4, 5}, {14, 7}, {8, 5}, {10, 15}, {8, 15}, {8, 15}, 
	{10, 10}, {11, 17}, {15, 5}, {9, 6}, {13, 6}, {3, 18}, {12, 7}, {18, 6}, {1, 9}, {3, 1}, {1, 19}, 
	{4, 14}, {16, 16}, {18, 14}, {7, 4}, {9, 2}, {19, 4}, {9, 10}, {18, 4}, {17, 4}, {12, 8}, {7, 7}}

TestDates[MayanTzolkin] = {
	{5, 9}, {9, 15}, {12, 11}, {9, 19}, {3, 9}, {7, 17}, {2, 9}, {4, 2}, {7, 7}, {9, 17}, {7, 7},
	{12, 2}, {10, 19}, {2, 12}, {6, 18}, {12, 18}, {3, 20}, {9, 19}, {8, 18}, {3, 6}, {6, 18}, {10, 16},
	{12, 6}, {13, 3}, {11, 1}, {3, 6}, {1, 4}, {9, 11}, {11, 2}, {12, 16}, {9, 16}, {8, 15}, {2, 14}}

TestDates[Balinese] = {{False, 1, 1, 1, 3, 1, 1, 5, 7, 3}, {True, 2, 2, 1, 4, 5, 4, 5, 5, 2}, 
	{True, 2, 2, 1, 5, 5, 4, 1, 5, 6}, {False, 1, 2, 3, 3, 5, 1, 3, 5, 3}, 
	{False, 1, 1, 3, 3, 1, 4, 3, 1, 5}, {True, 2, 2, 1, 1, 5, 2, 1, 8, 0}, 
	{False, 1, 2, 3, 3, 5, 7, 3, 2, 7}, {False, 1, 2, 2, 1, 2, 1, 2, 2, 1}, 
	{False, 1, 2, 1, 1, 5, 1, 1, 8, 1}, {True, 2, 3, 1, 1, 3, 6, 1, 3, 2}, 
	{False, 1, 1, 1, 1, 1, 7, 5, 1, 5}, {True, 2, 3, 4, 1, 6, 6, 8, 6, 2}, 
	{False, 1, 2, 3, 3, 5, 1, 3, 5, 3}, {False, 1, 1, 4, 1, 4, 1, 4, 7, 1}, 
	{False, 1, 2, 2, 2, 2, 4, 2, 5, 7}, {False, 1, 2, 4, 2, 2, 7, 8, 8, 9}, 
	{True, 2, 1, 4, 4, 4, 7, 4, 7, 4}, {False, 1, 2, 3, 3, 5, 7, 3, 2, 7}, 
	{False, 1, 3, 4, 2, 6, 4, 8, 3, 7}, {True, 2, 2, 4, 5, 2, 1, 4, 5, 4}, 
	{True, 2, 1, 2, 2, 4, 6, 2, 1, 6}, {True, 2, 2, 4, 5, 2, 1, 4, 5, 4}, 
	{False, 1, 3, 4, 5, 6, 2, 8, 3, 3}, {False, 1, 1, 1, 2, 1, 4, 5, 4, 7}, 
	{True, 2, 2, 1, 5, 5, 1, 5, 8, 4}, {True, 2, 3, 2, 5, 6, 1, 2, 3, 4}, 
	{True, 2, 2, 2, 3, 2, 2, 2, 1, 2}, {False, 1, 2, 3, 5, 5, 2, 3, 2, 3}, 
	{True, 2, 2, 4, 1, 2, 5, 4, 8, 4}, {True, 2, 2, 2, 5, 2, 3, 2, 8, 2}, 
	{True, 2, 2, 4, 5, 2, 1, 4, 5, 4}, {True, 2, 1, 3, 4, 1, 4, 7, 1, 2}, 
	{False, 1, 3, 4, 3, 6, 1, 8, 6, 3}}

TestDates[ObservationalIslamic] = {
	{-1245, 12, 11}, {-813, 2, 25}, {-568, 4, 2}, {-501, 4, 7}, {-157, 10, 18}, {-47, 6, 3}, {75, 7, 13}, {403, 10, 5}, {489, 5, 22}, {586, 2, 7}, {637, 8, 7}, 
	{687, 2, 21}, {697, 7, 7}, {793, 6, 30}, {839, 7, 6}, {897, 6, 2}, {960, 9, 30}, {967, 5, 27}, {1058, 5, 18}, {1091, 6, 3}, {1128, 8, 4}, {1182, 2, 4}, 
	{1234, 10, 10}, {1255, 1, 11}, {1321, 1, 20}, {1348, 3, 19}, {1360, 9, 7}, {1362, 4, 14}, {1362, 10, 7}, {1412, 9, 12}, {1416, 10, 5}, {1460, 10, 12}, {1518, 3, 5}}

TestDates[Persian] = {
	{-1208, 5, 1}, {-790, 9, 14}, {-552, 7, 2}, {-487, 7, 9}, {-153, 10, 19}, {-46, 2, 31}, {73, 8, 19}, {392, 2, 5}, {475, 3, 4}, {569, 1, 3}, {618, 12, 20}, 
	{667, 1, 14}, {677, 2, 8}, {770, 3, 22}, {814, 11, 13}, {871, 1, 21}, {932, 6, 28}, {938, 12, 14}, {1027, 3, 21}, {1059, 4, 10}, {1095, 5, 2}, {1147, 3, 30}, 
	{1198, 5, 10}, {1218, 1, 7}, {1282, 1, 29}, {1308, 6, 3}, {1320, 7, 7}, {1322, 1, 29}, {1322, 7, 14}, {1370, 12, 27}, {1374, 12, 6}, {1417, 8, 19}, {1473, 4, 28}}

TestDates[FutureBahai] = {
 {-6, 6, 3, 7, 11}, {-5, 9, 3, 14, 13}, {-4, 2, 13, 10, 18}, {-4, 6, 2, 11, 6},
		{-3, 4, 13, 16, 10}, {-3, 10, 6, 4, 5}, {-3, 16, 10, 13, 7}, {-2, 14, 6, 2, 17}, {-2, 18, 13, 4, 9},
		{-1, 4, 12, 1, 3}, {-1, 7, 4, 19, 10}, {-1, 9, 15, 1, 14}, {-1, 10, 6, 3, 1}, {-1, 15, 4, 5, 8},
		{-1, 17, 10, 17, 16}, {0, 1, 10, 2, 2}, {0, 4, 14, 10, 12}, {0, 5, 1, 19, 4}, {0, 9, 14, 5, 7},
		{0, 11, 8, 6, 8}, {0, 13, 6, 7, 13}, {0, 16, 1, 5, 16}, {0, 18, 14, 8, 2}, {0, 19, 15, 1, 7},
		{1, 4, 3, 2, 10}, {1, 5, 10, 9, 6}, {1, 6, 3, 11, 3}, {1, 6, 5, 2, 11}, {1, 6, 5, 11, 11},
		{1, 8, 15, 19, 17}, {1, 8, 19, 18, 19}, {1, 11, 5, 13, 8}, {1, 14, 4, 7, 7}}

TestDates[French] = {
	{-2378, 11, 5}, {-1959, 3, 14}, {-1721, 1, 2}, {-1656, 1, 10}, {-1322, 4, 19}, {-1216, 9, 1}, {-1097, 2, 19}, {-779, 8, 5}, {-696, 9, 5}, {-602, 7, 2}, {-552, 6, 20}, 
	{-504, 7, 13}, {-494, 8, 8}, {-401, 9, 23}, {-356, 5, 14}, {-300, 7, 20}, {-239, 13, 2}, {-232, 6, 15}, {-144, 9, 22}, {-112, 10, 12}, {-76, 11, 6}, {-24, 10, 1}, 
	{27, 11, 14}, {47, 7, 6}, {111, 7, 28}, {137, 12, 7}, {150, 1, 7}, {151, 7, 29}, {152, 1, 15}, {200, 6, 27}, {204, 6, 6}, {247, 2, 20}, {302, 10, 30}}

TestDates[Chinese] = {
	{35, 11, 6, False, 12}, {42, 9, 10, False, 27}, {46, 7, 8, False, 4}, {47, 12, 8, False, 9}, {52, 46, 11, False, 20},
	{54, 33, 4, False, 5}, {56, 31, 10, False, 15}, {61, 50, 3, False, 7}, {63, 13, 4, False, 24}, {64, 47, 2, False, 9},
	{65, 37, 2, False, 9}, {66, 25, 2, False, 23}, {66, 35, 3, False, 9}, {68, 8, 5, False, 2}, {68, 53, 1, False, 8},
	{69, 49, 3, False, 4}, {70, 50, 8, False, 2}, {70, 57, 1, False, 29}, {72, 25, 4, True, 20}, {72, 57, 6, False, 5},
	{73, 33, 6, False, 6}, {74, 25, 5, False, 5}, {75, 16, 6, False, 12}, {75, 36, 2, False, 13}, {76, 40, 3, False, 22},
	{77, 6, 7, False, 21}, {77, 18, 8, False, 9}, {77, 20, 3, False, 15}, {77, 20, 9, False, 9}, {78, 9, 2, False, 14},
	{78, 13, 1, False, 7}, {78, 55, 10, False, 14}, {79, 51, 6, False, 7}}

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

TestDates[Easter] = {
	{1998, 4, 12}, {1999, 4, 4}, {2000, 4, 23}, {2001, 4, 15}, {2002, 3, 31}, {2003, 4, 20}, {2004, 4, 11}, {2005, 3, 27}, {2006, 4, 16}, {2007, 4, 8}, {2008, 3, 23}, {2009, 4, 12}, {2010, 4, 4}}

(* Jewish Holiday information from <http://bnaibrith.org/caln.html> as of 9/9/97 *)

TestDates[YomKippur] = {
	{1997, 10, 11}, {1998, 9, 30}, {1999, 9, 20}, {2000, 10, 9}, {2001, 9, 27}, {2002, 9, 16}, {2003, 10, 6}, {2004, 9, 25}, {2005, 10, 13}}

TestDates[Passover] = {
	{1998, 4, 11}, {1999, 4, 1}, {2000, 4, 20}, {2001, 4, 8}, {2002, 3, 28}, {2003, 4, 17}, {2004, 4, 6}, {2005, 4, 24}, {2006, 4, 13}}

TestDates[Purim] = {
	{1998, 3, 12}, {1999, 3, 2}, {2000, 3, 21}, {2001, 3, 9}, {2002, 2, 26}, {2003, 3, 18}, {2004, 3, 7}, {2005, 3, 25}, {2006, 3, 14}}

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

CalendricaTest[] := (
	WriteString["stdout", 
	  "Current date and time (local): " <> ToString[Gregorian[CurrentDate[]]] <> 
	    ", " <> ToString[ TimeOfDay[CurrentMoment[]]] ];

	WriteString["stdout", "\n\nBasic support algorithms:\n\n"];
	
	TestFixedToWeekDay[];
	TestFixedToJulianDay[];
	TestJulianDayToFixed[];

	WriteString["stdout", "\nArithmetic calendars:\n\n"];
	
	Map[TestCalendar, {
		Egyptian,
		Armenian,
		Gregorian,
		Julian,
		Roman,
		Coptic,
		Ethiopic,
		ISO,
		Islamic,
		Hebrew,
		OldHinduSolar,
		OldHinduLunar,
		MayanLongCount,
		Bahai,
		ArithmeticPersian,
		ModifiedFrench
	}];
	
	WriteString["stdout", "\n"];

	Map[TestFixedToCalendar, {
		MayanHaab,
		MayanTzolkin,
		Balinese
	}];

	WriteString["stdout", "\nAstronomical calendars:\n\n"];
	
	Map[TestCalendar, {
		ObservationalIslamic,
		Persian,
		FutureBahai,
		French, 
		Chinese,
		HinduSolar,
		HinduLunar
	}];

	WriteString["stdout", "\nDate Formats:\n\n"];
	
	Map[WriteString["stdout", 
	        ToString[#] <> ": " <> 
	          ToString[ConvertDateTo[Gregorian[1965, May[], 15], #]] <> "\n"] &, 
	    Calendars[]];

	WriteString["stdout", "\nSome holidays:\n\n"];
	
	Map[TestHoliday, {
		Easter, 
		YomKippur, 
		Passover, 
		Purim
	}];

	WriteString["stdout", "\nDone!"];
)

End[]



EndPackage[]
