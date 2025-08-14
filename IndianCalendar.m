(* :Name: IndianCalendar.m *)

(* :Context: IndianCalendar` *)

(* :Title: Indian Calendar Computations *)

(* :Author:

Helmer Aslaksen
Department of Mathematics
National University of Singapore
Singapore 117543
Republic of Singapore
<aslaksen@math.nus.edu.sg>
http://www.math.nus.edu.sg/aslaksen/ 

*)

(* :Mathematica Version: 4.0 *)

(* :Package Version: 1.0, Sep. 4, 2000 *)

(* :History:  

1.0,  Sep. 4, 2000: Work started. 

*)

(* :Keywords: Indian calendar, calendar.
*)
    
(* :Summary: 

IndianCalendar is a package for performing Indian calendrical computations. It is written by Helmer Aslaksen, Department of Mathematics, National University of Singapore, <aslaksen@math.nus.eud.sg>, http://www.math.nus.edu.sg/aslaksen/. It uses the functions written by Nachum Dershowitz and Edward M. Reingold for their book Calendrical Calculations, published by Cambridge University Press, ISBN 0-521-56474-3. Their Lisp functions were translated into the Mathematica package Calendrica by Robert C. McNally <ironwolf@dangerousgames.com>, which is available from their web site http://emr.cs.uiuc.edu/home/reingold/calendar-book/. 

*)

(* :Warnings:

The names of my functions have lower case initials to distinguish them 
from the functions of Robert C. McNally.

*) 

(* :Copyright: Copyright 2000, Helmer Aslaksen *)

(*********************** START OF PUBLIC CODE ***********************)

BeginPackage["IndianCalendar`",{"Calendrica`","Graphics`Graphics`",
"Graphics`Common`GraphicsCommon`"}]

IndianCalendar::usage="IndianCalendar is a package for performing Indian calendrical computations. It is written by Helmer Aslaksen, Department of Mathematics, National University of Singapore, <aslaksen@math.nus.eud.sg>, http://www.math.nus.edu.sg/aslaksen/. It uses the functions written by Nachum Dershowitz and Edward M. Reingold for their book Calendrical Calculations, published by Cambridge University Press, ISBN 0-521-56474-3. Their Lisp functions were translated into the Mathematica package Calendrica by Robert C. McNally <ironwolf@dangerousgames.com>, which is available from their web site http://emr.cs.uiuc.edu/home/reingold/calendar-book/.";

ujjainSunrise::usage="ujjainSunrise[kyTime] returns the IST for sunrise at Ujjain for a given kytime since the Hindu epoch."; 

ujjainSunset::usage="ujjainSunset[kyTime] returns the IST sunset at Ujjain for a given kytime since the Hindu epoch."; 

ujjainAparahna::usage="ujjainAparahna[kyTime] returns the IST for aparahna at Ujjain for a given kytime since the Hindu epoch."; 

orissaHinduSolar::usage="orissaHinduSolar[date] returns the Orissa calendar date of day at sunrise for the given fixed date."; 

tamilHinduSolar::usage="tamilHinduSolar[date] returns the Tamil calendar date of day at sunrise for the given fixed date."; 

malayaliMonth::usage="malayaliMonth[m] returns the Malayali solar month number (1-12) corresponding to solar month number m (rasi m)with the start of the nirayana year from solar month number 5 (rasi 5).";

malayaliYear::usage="malayaliYear[m,n] returns the Kollam year corresponding the Saka year n when the solar month number is m (rasi is m).";  

malayaliHinduSolar::usage="malayaliHinduSolar[date] returns the Malayali calendar date of day at sunrise for the given fixed date."; 

bengalHinduSolar::usage="bengalHinduSolar[date] returns the Bengal calendar date of day at sunrise for the given fixed date."; 

IndianNewMoonAtOrBefore::usage="IndianNewMoonAtOrBefore[kyTime] returns the IST for new moon at or before the given kytime since the Hindu epoch.";

amantaSouthHinduLunar::usage="amantaSouthHinduLunar[date] returns the Chaitra calendar date of day at sunrise for the given fixed date when the Southern school rule is used to handle kshaya month.";

checkSkippedRasiForEasternRule::usage="checkSkippedRasiForEasternRule[kyTime] returns a list with the first element called the skippedrasi and the second element leaprasi. skippedrasi is the solar month that contains no new moon and hence a kshaya month occurs. leaprasi is the solar month in which the second accompanying adhika month falls.";

amantaEastHinduLunar::usage="amantaEastHinduLunar[date] returns the Chaitra calendar date of day at sunrise for the given fixed date when the Eastern school rule is used to handle kshaya month.";

checkSkippedRasiForNorthWesternRule::usage="checkSkippedRasiForNorthWesternRule[kyTime] returns a list with the first element called the skippedrasi and the second element leaprasi. skippedrasi is the solar month that contains no new moon and hence a kshaya month occurs. leaprasi is the solar month in which the first accompanying adhika month falls.";

amantaNorthWestHinduLunar::usage="amantaNorthWestHinduLunar[date] returns the Chaitra calendar date of day at sunrise for the given fixed date when the North Western school rule is used to handle kshaya month.";

IndianFullMoonAtOrBefore::usage="IndianFullMoonAtOrBefore[kyTime] returns the IST for full moon at or before the given kytime since the Hindu epoch.";

(**************** START OF PRIVATE CODE ****************)

Begin["`Private`"]

(** 
The function HinduSolar[date_Integer] from the Mathematica package Calendrica.m follows the convention that solar month begins with the day after the occurrence of its concerned samkranti. We call this convention the DR rule.  The function uses old Siddhantic methods to compute HinduSolarLongitude[kyTime_] (true position of the Sun) and hence HinduSunrise[kyTime_] (local time for sunrise at Ujjain), HinduZodiac[kyTime_] (the solar month) and HinduCalendarYear[kyTime_] (Kali Yuga year). The function Samkranti[gYear_, m_], which returns RD moment, is also determined from old Siddhantic methods. 
**)

(** 
We have written the functions orissaHinduSolar[date_Integer], tamilHinduSolar[date_Integer], malayaliHinduSolar[date_Integer] and bengalHinduSolar[date_Integer] that followed the Orissa rule, the Tamil rule, the Malayali rule and the Bengal rule respectively. They are modifications of the function HinduSolar[date_Integer]. We have also come up with functions ujjainSunrise[kyTime_], ujjainSunset[kyTime_] and ujjainAparahna[kyTime_]  to obtain the IST for sunrise, sunset and aparahna at Ujjain. They are used in our written HinduSolar functions when required. However the functions HinduZodiac[kyTime_], HinduCalendarYear[kyTime_] and Samkranti[gYear, m_] are still used. We need to implement a function using modern methods to find true position of the Sun and hence determine the correct solar month, the Kali Yuga year and IST for the samkranti. 
**)


(** 
ujjainSunrise[kyTime_]
Input: Hindu moment. Output: Hindu moment.
We use the actual longitude for Ujjain, but use the IST meridian to compute the IST for sunrise at Ujjain, i.e., we're computing the IST for sunrise at Ujjain. 
Accuracy tested within about 5 minutes.
**)
ujjainSunrise[kyTime_] := 
    Module[{d, latitude, longitude},
    d = Floor[kyTime] + Calendrica`Private`HinduEpoch[];
    latitude = 1389/60;
    longitude = 165/2;
    kyTime + Sunrise[d, latitude, longitude]]


(** 
ujjain Sunset[kyTime_]
Input: Hindu moment. Output: Hindu moment.
We're computing the IST for sunset at Ujjain using similar methods found in ujjainSunrise[kyTime_]. 
Accuracy tested within about 5 minutes.
**)
ujjainSunset[kyTime_] :=
    Module[{d, latitude, longitude},
    d = Floor[kyTime] + Calendrica`Private`HinduEpoch[];
    latitude = 1389/60;
    longitude = 165/2;
    kyTime + Sunset[d, latitude, longitude]]


(** 
ujjainAparahna[kyTime_]
Input : Hindu moment. Output : Hindu moment.
We're computing the IST for aparahna at Ujjain. 
Accuracy tested within about 5 minutes.
**)
ujjainAparahna[kyTime_] :=
    ujjainSunrise[kyTime] + 0.6*(ujjainSunset[kyTime] - ujjainSunrise[kyTime])


(** 
orissaHinduSolar[date_Integer]
Input: Fixed number for RD date. Output: Orissa calendar date of day at sunrise on RD date. 
Output may differ from the actual Orissa calendar date by a day.
**)
orissaHinduSolar[date_Integer] := 
    Module[{kyTime, rise, month, year, approx, begin, day},
    kyTime = HinduDayCount[date]; (** kyTime gives the number of days of RD date since the start of Kali Yuga or we can say in Hindu    moment. **)
(** We find the rise, month, year, approx, begin and day at kyTime + 1 because the Orissa calendar date is ahead of the HinduSolar calendar date by a day. **)
    rise = ujjainSunrise[kyTime + 1];
    month = Calendrica`Private`HinduZodiac[rise];
    year = Calendrica`Private`HinduCalendarYear[rise] - Calendrica`Private`HinduSolarEra[];
    (** year determines the Saka year in which kyTime + 1 falls. **)
    approx = kyTime - 2 - Quotient[Mod[Calendrica`Private`HinduSolarLongitude[rise], 1800], 60];
    (** approx is a day in Hindu moment that falls in the previous solar month. **)
    begin = approx + Calendrica`Private`MSum[(1) &, 
                 approx, (Calendrica`Private`HinduZodiac[ujjainSunrise[#]] =!= month) &];
    (** begin returns the starting day of month in Hindu moment. **)
    day = kyTime - begin + 2;
    (** day gives the day count from the starting day of month to kyTime + 1. **)
    orissaHinduSolar[month, day, year]]


(** 
tamilHinduSolar[date_Integer]
Input: Fixed number for RD date. Output: Tamil calendar date of day at sunrise on RD date. 
Output may differ from the actual Tamil calendar date by a day.
**)
tamilHinduSolar[date_Integer] :=
    Module[{kyTime, rise1, rise2, month1, month2, year1, year2, approx1, 
      begin1, day1, samk1, samk2, srise1, srise2, sset1, sset2},
    kyTime = HinduDayCount[date];
(** We find rise2 and month2 at kyTime + 1 because under certain criteria, the Tamil calendar date is ahead of the HinduSolar calendar date by a day. **)
    rise1 = ujjainSunrise[kyTime];
    rise2 = ujjainSunrise[kyTime + 1];
    month1 = Calendrica`Private`HinduZodiac[rise1];
    month2 = Calendrica`Private`HinduZodiac[rise2];
    year1 = Calendrica`Private`HinduCalendarYear[rise1] - Calendrica`Private`HinduSolarEra[];
    approx1 = kyTime - 3 - Quotient[Mod[Calendrica`Private`HinduSolarLongitude[rise1], 1800], 60];
    begin1 = approx1 + Calendrica`Private`MSum[(1) &,
                   approx1, (Calendrica`Private`HinduZodiac[ujjainSunrise[#]] =!= month1) &];
    day1 = kyTime - begin1 + 1;
    samk1 = Samkranti[78 + year1, month1];
    srise1 = ujjainSunrise[HinduDayCount[Floor[samk1]]] + Calendrica`Private`HinduEpoch[];
(** srise1 is the IST for sunrise for the day of samk1 if the IST for samk1 falls before midnight. Otherwise srise1 gives the IST for sunrise for the following day. If the latter is true, then samk1 falls after sunset for the same day. **)
    sset1 = ujjainSunset[HinduDayCount[Floor[samk1]]] + Calendrica`Private`HinduEpoch[]; 
    (** The explanation for sset1 is similar to that for srise1. **)
    If[ month1 != month2, (** If month1 != month2, then month2 is the new month. We need the IST for the samkranti, the sunrise and sunset for the day of the samkranti and the Saka year for month2. **)	               
      year2 = Calendrica`Private`HinduCalendarYear[rise2] - Calendrica`Private`HinduSolarEra[];
      samk2 = Samkranti[78 + year2, month2];
      srise2 = ujjainSunrise[HinduDayCount[Floor[samk2]]] + Calendrica`Private`HinduEpoch[];
      sset2 = ujjainSunset[HinduDayCount[Floor[samk2]]] + Calendrica`Private`HinduEpoch[]];
    Which[(month1 == month2) && (srise1 <= samk1 < sset1), (** If samk1 falls between srise1 and sset1 on the same day, the Tamil rule and the Orissa rule will both agree. **)
      tamilHinduSolar[month1, day1 + 1, year1],  month1 == month2,
      (** If samk1 is either before sunrise or after sunset the Tamil rule and the DR rule will both agree. **)
      tamilHinduSolar[month1, day1, year1],
      (** The conditions below are for month1!= month2. **)
      srise2 <= samk2 < sset2, tamilHinduSolar[month2, 1, year2],
      srise1 <= samk1 < sset1, tamilHinduSolar[month1, day1 + 1, year1],
      (** The Tamil rule and DR rules agree unless one or both of the samkrantis fall between sunrise and sunset. **)
      True, tamilHinduSolar[month1, day1, year1]]]


(** 
malayaliMonth[m_]
Input: (solar)month number. Output: malayali month number. 
The Malayali calendar uses the Kollem era, not the Saka traditional era. Starting month of the nirayana year is month 5, the solar month that links with rasi 5. For example, if month = 5, then malayaliMonth = 1. 
**)
malayaliMonth[m_] := Calendrica`Private`AdjustedMod[m - 4, 12]


(** 
malayaliYear[m_, n_]
Input : (solar) month and Saka year. Output : Kollem year. The Malayali calendar uses the Kollem era, not the Saka traditional era. Starting month of the nirayana year is month 5, the solar month that links with rasi 5. Hence malayaliYear number changes to a new year at month 5 and not month 1. 
**)
malayaliYear[m_, n_] := If[1 <= m <= 4, n - 747, n - 746]


(** 
malayaliHinduSolar[date_Integer]
Input: Fixed number for RD date. Output: Malayali calendar date of day at sunrise on RD date. 
Output may differ from the actual Malayali calendar date by a day.
**)
malayaliHinduSolar[date_Integer] :=
    Module[{kyTime, rise1, rise2, month1, month2, year1, year2, approx1, 
      begin1, day1, samk1, samk2, srise1, srise2, aparahna1, aparahna2},
    kyTime = HinduDayCount[date];
(** We find rise2 and month2 at kyTime + 1 because under certain criteria, the Malayali calendar date is ahead of the HinduSolar calendar date by a day. Then we make necessary changes to obtain the malayaliMonth and malayaliYear. **)
    rise1 = ujjainSunrise[kyTime];
    rise2 = ujjainSunrise[kyTime + 1];
    month1 = Calendrica`Private`HinduZodiac[rise1];
    month2 = Calendrica`Private`HinduZodiac[rise2];
    year1 = Calendrica`Private`HinduCalendarYear[rise1] - Calendrica`Private`HinduSolarEra[];
    approx1 = kyTime - 3 - Quotient[Mod[Calendrica`Private`HinduSolarLongitude[rise1], 1800], 60];
    begin1 = approx1 + Calendrica`Private`MSum[(1) &, 
                   approx1, (Calendrica`Private`HinduZodiac[ujjainSunrise[#]] =!= month1) &];
    day1 = kyTime - begin1 + 1;
    samk1 = Samkranti[78 + year1, month1];
    srise1 = ujjainSunrise[HinduDayCount[Floor[samk1]]] + Calendrica`Private`HinduEpoch[];
(** srise1 is the IST for sunrise for the day of samk1 if the IST for samk1 falls before midnight. Otherwise srise1 gives the IST for sunrise for the following day. If the latter is true, then samk1 falls after sunset for the same day. **)
    aparahna1 = ujjainAparahna[HinduDayCount[Floor[samk1]]] + 
                          Calendrica`Private`HinduEpoch[];
    (** The explanation for aparahna1 is similar to that for srise1. **)
    If[month1 != month2,
(** If month1!= month2, then month2 is the new month. We need the IST for the samkranti, the sunrise and the aparahna for the day of the samkranti and the Saka year for month2. **)
      year2 = Calendrica`Private`HinduCalendarYear[rise2] - Calendrica`Private`HinduSolarEra[];
      samk2 = Samkranti[78 + year2, month2];
      srise2 = ujjainSunrise[HinduDayCount[Floor[samk2]]] + 
                   Calendrica`Private`HinduEpoch[];
      aparahna2 = ujjainAparahna[HinduDayCount[Floor[samk2]]] + 
                           Calendrica`Private`HinduEpoch[]];
    Which[(month1 == month2) && (srise1 <= samk1 < aparahna1), (** If samk1 falls between srise1 and aparahna1 on the same day, the Malayali rule and the Orissa rule will both agree. **)
      malayaliHinduSolar[malayaliMonth[month1], day1 + 1, malayaliYear[month1, year1]],
      month1 == month2, (** If samk1 is either before sunrise or after aparahna, the Malayali rule and the DR rule will both agree. **)
      malayaliHinduSolar[malayaliMonth[month1], day1, malayaliYear[month1, year1]],
      (** The conditions below are for month1!= month2. **)
      srise2 <= samk2 < aparahna2, 
      malayaliHinduSolar[malayaliMonth[month2], 1, malayaliYear[month2, year2]],
      srise1 <= samk1 < aparahna1, 
      malayaliHinduSolar[malayaliMonth[month1], day1 + 1, malayaliYear[month1, year1]], (** The Malayali rule and DR rules agree unless one or both of the samkrantis fall between sunrise and aparahna. **) True, 
      malayaliHinduSolar[malayaliMonth[month1], day1, malayaliYear[month1, year1]]]]


(** 
BengalHinduSolar[date_Integer]
Input: Fixed number for RD date. Output: Bengal calendar date of day at sunrise on RD date. 
Output may differ from the actual Bengal calendar date by a day.
**)
bengalHinduSolar[date_Integer] :=
    Module[{kyTime, rise1, rise2, month1, month2, year1, year2, approx1, 
      begin1, day1, samk1, samk2, srise1, srise2, midnight1, midnight2},
    kyTime = HinduDayCount[date];
(** We find rise1, month1, year1, approx1, begin1 and day1 at kyTime - 1 because under certain criteria, the Bengal calendar date is behind the HinduSolar calendar date by a day. **)
    rise1 = ujjainSunrise[kyTime - 1];
    rise2 = ujjainSunrise[kyTime];
    month1 = Calendrica`Private`HinduZodiac[rise1];
    month2 = Calendrica`Private`HinduZodiac[rise2];
    year1 = Calendrica`Private`HinduCalendarYear[rise1] - Calendrica`Private`HinduSolarEra[];
    approx1 = kyTime - 4 - Quotient[Mod[Calendrica`Private`HinduSolarLongitude[rise1], 1800], 60];
    begin1 = approx1 + Calendrica`Private`MSum[(1) &, 
                   approx1, (Calendrica`Private`HinduZodiac[ujjainSunrise[#]] =!= month1) &];
    day1 = kyTime - begin1;
    samk1 = Samkranti[78 + year1, month1];
    srise1 = ujjainSunrise[HinduDayCount[Floor[samk1]]] + Calendrica`Private`HinduEpoch[];
(** srise1 is the IST for sunrise for the day of samk1 if the IST for samk1 falls before midnight. Otherwise srise1 gives the IST for sunrise for the following day. If the latter is true, then samk1 < srise1. **)
    midnight1 = Floor[samk1] + 1;
    (** midnight1 is the midnight following samk1. **)
    If[month1 != month2, (** If month1!= month2, then month2 is the new month. We need the IST for the samkranti, the sunrise for the day of the samkranti and the Saka year for month2. **)
      year2 = Calendrica`Private`HinduCalendarYear[rise2] - Calendrica`Private`HinduSolarEra[];
      samk2 = Samkranti[78 + year2, month2];
      srise2 = ujjainSunrise[HinduDayCount[Floor[samk2]]] + Calendrica`Private`HinduEpoch[];
     midnight2 = Floor[samk2] + 1];
    Which[(month1 == month2) && (srise1 <= samk1 < midnight1), (** If samk1 falls between srise1 and midnight1, the Bengal rule and the DR rule will both agree. **)
      bengalHinduSolar[month1, day1 + 1, year1], 
      month1 == month2, (** If samk1 is either before sunrise or after midnight, the Bengal calendar date is behind the HinduSolar calendar date by a day. **) 
      bengalHinduSolar[month1, day1, year1], 
      (** The conditions below are for month1!= month2. **)
      srise2 <= samk2 < midnight2, bengalHinduSolar[month2, 1, year2],
      srise1 <= samk1 < midnight1, 
      bengalHinduSolar[month1, day1 + 1, year1], (** The Bengal rule and DR rules agree unless one or both of the samkrantis fall between sunrise and midnight. **)            
      True, bengalHinduSolar[month1, day1, year1]]]


(** 
The function HinduLunar[date_Integer] from the Mathematica package Calendrica.m follows the convention that when a kshaya month occurs, the two accompanying adhika months are treated as true leap months. The amanta month that contains two samkramanas is treated as a suddha month instead of a dual month. We call this convention the DR lunar rule. Notice that the DR lunar rule and the Southern school rule both agree except at treating the amanta month containing the whole solar month. The HinduLunar function uses old Siddhantic methods to compute HinduSolarLongitude[kyTime_] (true position of the Sun) and HinduLunarLongitude[kyTime_] (true position of the Moon)and hence HinduSunrise[kyTime_] (local time for sunrise at Ujjain), LunarDay[kyTime_] (tithi), HinduNewMoon[kyTime] (new moon at or before input Hindu moment), HinduZodiac[kyTime_] (the solar month) and HinduCalendarYear[kyTime_] (Kali Yuga year). 
**)

(** 
We have written the following functions to calculate variations of the amanta lunisolar calendar. They are the amantaEastHinduLunar[date_Integer], amantaNorthWestHinduLunar[date_Integer] and amantaSouthHinduLunar[date_Integer] functions that follow the Eastern school, the North Western school and the Southern school rules respectively. They are modifications of the function HinduLunar[date_Integer]. We have also come up with functions ujjainSunrise[kyTime_], IndianNewMoonAtOrBefore[kyTime_] and IndianFullMoonAtOrBefore[kyTime_] to obtain the IST for sunrise at Ujjain, the new moon and full moon at or before input Hindu moment. They are used in our written HinduLunar functions when required. However the functions HinduZodiac[kyTime_], LunarDay[kyTime_] and HinduCalendarYear[kyTime_] are still used. We need to implement two function using modern methods to find true positions of the Sun and the Moon and hence determine the correct solar month, the Kali Yuga year and the tithi. 
**)


(** IndianNewMoonAtOrBefore[kyTime_]
Input: Hindu moment. Output: Hindu moment. 
We're computing the IST for new moon at or before kyTime. For this function, we convert kyTime to a julian day number and use NewMoonAtOrBefore[jd_] to find the required new moon (in Greenwich) in julian day number. Then we convert this back to Hindu moment. The fractional part of this Hindu moment gives the IST for the required new moon. 
Accuracy tested within about 1 minute.
**)
IndianNewMoonAtOrBefore[kyTime_] :=
    Module[{JDmoment, newMoon, newMoonInMoment, result},
    JDmoment = JDFromMoment[kyTime + Calendrica`Private`HinduEpoch[]];
    newMoon = NewMoonAtOrBefore[JDmoment];
    newMoonInMoment = MomentFromJD[newMoon];
    result = newMoonInMoment - Calendrica`Private`HinduEpoch[] + 11/48;
(** A julian day runs from noon to the next noon. When required new moon (= result) falls on the same julian day as kyTime does, result will be returned even if the time of result is later than that of the kyTime. This is not our desired output. Hence we implement the If condition. If result is later than kyTime, find the last new moon before result. Then let the last new moon be the result and return result. Otherwise, return result straightaway. **)
    If[result > kyTime,
           newMoon = NewMoonAtOrBefore[JDmoment - 1];
           newMoonInMoment = MomentFromJD[newMoon];
           newMoonInMoment - Calendrica`Private`HinduEpoch[] + 11/48, result]]


(** 
amantaSouthHinduLunar[date_Integer]
Input: Fixed number for RD date. Output: Chaitra calendar date of day at sunrise on RD date when the Southern school rule is used to handle the kshaya month. Note that this function still follows the DR lunar rule because we need to write a function to find the IST for tithis using true positions of the Sun and the Moon. 
Output may differ from the actual calendar date. The tithi number and occurrences of adhika and kshaya months may not tally.
**)
amantaSouthHinduLunar[date_Integer] :=
    Module[{kyTime, rise, day, leapDay, lastNewMoon, nextNewMoon, solarMonth, 
      leapMonth, month, year},
    kyTime = HinduDayCount[date];
    rise = ujjainSunrise[kyTime];
    day = Calendrica`Private`LunarDay[rise]; (** day gives the tithi no at sunrise on RD date. 1 to 15 are tithis for the bright half and  16 to 30 are tithis for the dark half. **)
    leapDay = day == Calendrica`Private`LunarDay[ujjainSunrise[kyTime - 1]];
(** If tithi number at sunrise on RD (date - 1) = day, then day is a leap day and LeapDay is TRUE. Otherwise, leapDay is FALSE. **)
    lastNewMoon = IndianNewMoonAtOrBefore[rise];
    nextNewMoon = IndianNewMoonAtOrBefore[Floor[lastNewMoon] + 35];
    solarMonth = Calendrica`Private`HinduZodiac[lastNewMoon];
    leapMonth = solarMonth == Calendrica`Private`HinduZodiac[nextNewMoon];
(** If solarMonth = solarMonth in which nextNewMoon falls, then lastNewMoon is an adhika month and leapMonth is TRUE. Otherwise leapMonth is FALSE. **)
    month = Calendrica`Private`AdjustedMod[solarMonth + 1, 12];
    (** month gives the lunar month number. **)
    year = Calendrica`Private`HinduCalendarYear[nextNewMoon] - 
               Calendrica`Private`HinduLunarEra[] - If[leapMonth && month == 1, -1, 0];
    (** year returns the Vikram year in which kyTime falls. **)
    amantaSouthHinduLunar[month, leapMonth, day, leapDay, year]]


(** 
checkSkippedRasiForEasternRule[kyTime_]
Input: Hindu moment. Output: List{skippedrasi, leaprasi}.
We're determining whether a kshaya month occurs at or after kyTime in the Vikram year in which kyTime falls. If kshaya month occurs, find the rasis that correspond to the kshaya month and the 2nd accompanying adhika month respectively. In the function, we denote them by skippedrasi and leaprasi. 
Occurrences of adhika and kshaya months may not tally. 
**)
checkSkippedRasiForEasternRule[kyTime_] :=
    Module[{lastNewMoon, solarMonth, nextNewMoon, nextsolarMonth, skippedrasi,
       leaprasi},
    lastNewMoon = IndianNewMoonAtOrBefore[kyTime];
    solarMonth = Calendrica`Private`HinduZodiac[lastNewMoon];
    nextNewMoon = IndianNewMoonAtOrBefore[Floor[lastNewMoon] + 35];
    nextsolarMonth = Calendrica`Private`HinduZodiac[nextNewMoon];
    skippedrasi = 0;
    leaprasi = 0;
(** Kshaya month possible only for solarMonths 8, 9 and 10. While loop searches for skippedrasi in solarMonths 8, 9 and 10. If solarMonth >= 11, there is no kshaya month at or after kyTime. **)
   While[solarMonth < 11,
      If[nextsolarMonth == solarMonth + 2, skippedrasi = solarMonth + 1;
        (** While loop below searches ahead for leaprasi when skippedrasi != 0. **)
        While[nextsolarMonth != solarMonth,
          solarMonth = nextsolarMonth;
          nextNewMoon = IndianNewMoonAtOrBefore[Floor[nextNewMoon] + 35];
          nextsolarMonth = Calendrica`Private`HinduZodiac[nextNewMoon]];
        leaprasi = solarMonth;
        (** To stop iteration. **)
        Break[]];
      solarMonth = nextsolarMonth;
      nextNewMoon = IndianNewMoonAtOrBefore[Floor[nextNewMoon] + 35];
      nextsolarMonth = Calendrica`Private`HinduZodiac[nextNewMoon]];
    (** If kshaya month does not occur, skippedrasi = leaprasi = 0. **)
    {skippedrasi, leaprasi}]


(** 
amantaEastHinduLunar[date_Integer]
Input: Fixed number for RD date. Output: Chaitra calendar date of day at sunrise on RD date when the Eastern school rule is used to handle the kshaya month. 
Output may differ from the actual calendar date. The tithi number and occurrences of adhika and kshaya months may not tally.
**)
amantaEastHinduLunar[date_Integer] :=  
    Module[{kyTime, rise, day, leapDay, lastNewMoon, nextNewMoon, solarMonth, 
      leapMonth, startkyTime, skippedrasi, leaprasi, month, year},
    kyTime = HinduDayCount[date];
    rise = ujjainSunrise[kyTime];
    day = Calendrica`Private`LunarDay[rise];
    leapDay = day == Calendrica`Private`LunarDay[ujjainSunrise[kyTime - 1]];
    lastNewMoon = IndianNewMoonAtOrBefore[rise];
    nextNewMoon = IndianNewMoonAtOrBefore[Floor[lastNewMoon] + 35];
    solarMonth = Calendrica`Private`HinduZodiac[lastNewMoon];
    nextsolarMonth = Calendrica`Private`HinduZodiac[nextNewMoon];
    leapMonth = solarMonth == nextsolarMonth;
(** A kshaya month is possible only in solarMonths 8, 9 and 10. When there is a kshaya month, we assume that the two adhika months that come with it fall between solarMonth 6 to solarMonth 1 of the following nirayana year inclusive. If solarMonth = 1, check whether kshaya month occurred in the previous nirayana year. If 9 <= solarMonth <= 12, check whether kshaya month occurs in the current nirayana year. Otherwise, do not check for occurrence of kshaya month. **)
    Which[solarMonth == 1, startkyTime = kyTime - 191, solarMonth >= 9, 
      startkyTime = kyTime - (solarMonth - 7)*32];
    If[2 <= solarMonth <= 8, skippedrasi = leaprasi = 0,
      skippedrasi = First[checkSkippedRasiForEasternRule[startkyTime]];
      leaprasi = Last[checkSkippedRasiForEasternRule[startkyTime]]]; (** skippedrasi determines whether kshaya month occurs. If yes, both the skippedrasi and leaprasi != 0. Otherwise, skippedrasi = leaprasi = 0. **)
    If[skippedrasi != 0, (** The following conditions are for kshaya month and the 2nd adhika month falling in the same nirayana year. **)
      If[skippedrasi < leaprasi, If[skippedrasi < solarMonth < leaprasi, month = solarMonth, 
          If[leapMonth && solarMonth == leaprasi, 
            leapMonth = ! (solarMonth == nextsolarMonth); month = solarMonth,
            month = Calendrica`Private`AdjustedMod[solarMonth + 1, 12]]],
        (** The following conditions are for the 2nd adhika month falling in solarMonth 1 of the following nirayana year. **)
        If[(solarMonth > skippedrasi) || (solarMonth < leaprasi), 
          month = solarMonth, If[leapMonth && solarMonth == leaprasi, 
            leapMonth = ! (solarMonth == nextsolarMonth); month = solarMonth,
            month = Calendrica`Private`AdjustedMod[solarMonth + 1, 12]]]],
      month = Calendrica`Private`AdjustedMod[solarMonth + 1, 12]];
    If[month == solarMonth, year = Calendrica`Private`HinduCalendarYear[lastNewMoon] - 
          Calendrica`Private`HinduLunarEra[] - If[leapMonth && month == 1, -1, 0], 
      year = Calendrica`Private`HinduCalendarYear[nextNewMoon] - 
                 Calendrica`Private`HinduLunarEra[] - If[leapMonth && month == 1, -1, 0]];
    amantaEastHinduLunar[month, leapMonth, day, leapDay, year]]


(** checkSkippedRasiForNorthWesternRule[kyTime_]
Input: Hindu moment. Output: List{skippedrasi, leaprasi}. 
We're determining whether a kshaya month occurs at or after kyTime in the Vikram year in which kyTime falls. If kshaya month occurs, find the rasis that correspond to the kshaya month and the 1st accompanying adhika month respectively. In the function, we denote them by skippedrasi and leaprasi. 
Occurrences of adhika and kshaya months may not tally. 
**)
checkSkippedRasiForNorthWesternRule[kyTime_] :=
    Module[{lastNewMoon, solarMonth, nextNewMoon, nextsolarMonth, skippedrasi,
       leaprasi, newMoon, lastsolarMonth, startsolarMonth},
    lastNewMoon = IndianNewMoonAtOrBefore[kyTime];
    solarMonth = Calendrica`Private`HinduZodiac[lastNewMoon];
    nextNewMoon = IndianNewMoonAtOrBefore[Floor[lastNewMoon] + 35];
    nextsolarMonth = Calendrica`Private`HinduZodiac[nextNewMoon];
    skippedrasi = 0;
    leaprasi = 0;
    newMoon = lastNewMoon;
(** Kshaya month possible only for solarMonths 8, 9 and 10. While loop searches for skippedrasi in solarMonths 8, 9 and 10. If solarMonth >= 11, there is no kshaya month at or after kyTime. **)
    While[solarMonth < 11, 
        If[nextsolarMonth == solarMonth + 2, skippedrasi = solarMonth + 1;
        lastNewMoon = IndianNewMoonAtOrBefore[Floor[newMoon] - 28];
        lastsolarMonth = Calendrica`Private`HinduZodiac[lastNewMoon];
        (** While loop below searches behind for leaprasi when skippedrasi != 0. **)
        While[lastsolarMonth != solarMonth,
          solarMonth = lastsolarMonth;
          lastNewMoon = IndianNewMoonAtOrBefore[Floor[lastNewMoon] - 28];
          lastsolarMonth = Calendrica`Private`HinduZodiac[lastNewMoon]];
        leaprasi = solarMonth;
        (** To stop iteration. **)
        Break[]];
      newMoon = nextNewMoon;
      solarMonth = nextsolarMonth;
      nextNewMoon = IndianNewMoonAtOrBefore[Floor[nextNewMoon] + 35];
      nextsolarMonth = Calendrica`Private`HinduZodiac[nextNewMoon]];
    (** If kshaya month does not occur, skippedrasi = leaprasi = 0. **)
    {skippedrasi, leaprasi}]


(** 
amantaNorthWestHinduLunar[date_Integer]
Input: Fixed number for RD date. Output: Chaitra calendar date of day at sunrise on RD date when the North Western school rule is used to handle the kshaya month. 
Output may differ from the actual calendar date. The tithi number and occurrences of adhika and kshaya months may not tally.
**)
amantaNorthWestHinduLunar[date_Integer] :=   
    Module[{kyTime, rise, day, leapDay, lastNewMoon, nextNewMoon, solarMonth, 
      leapMonth, startkyTime, skippedrasi, leaprasi, month, year},
    kyTime = HinduDayCount[date];
    rise = ujjainSunrise[kyTime];
    day = Calendrica`Private`LunarDay[rise];
    leapDay = day == Calendrica`Private`LunarDay[ujjainSunrise[kyTime - 1]];
    lastNewMoon = IndianNewMoonAtOrBefore[rise];
    nextNewMoon = IndianNewMoonAtOrBefore[Floor[lastNewMoon] + 35];
    solarMonth = Calendrica`Private`HinduZodiac[lastNewMoon];
    nextsolarMonth = Calendrica`Private`HinduZodiac[nextNewMoon];
    leapMonth = solarMonth == nextsolarMonth;
(** A kshaya month is possible only in solarMonths 8, 9 and 10. When there is a kshaya month, we assume that the two adhika months that come with it fall between solarMonth 6 to solarMonth 1 of the following nirayana year inclusive. If 6 <= solarMonth <= 10, check whether kshaya month occurred in the current nirayana year. Otherwise, do not check for occurrence of kshaya month. **)
    If[6 <= solarMonth <= 10, startkyTime = kyTime + (7 - solarMonth)*29;
      skippedrasi = First[checkSkippedRasiForNorthWesternRule[startkyTime]];
      leaprasi = Last[checkSkippedRasiForNorthWesternRule[startkyTime]],  skippedrasi = leaprasi = 0];
(** skippedrasi determines whether kshaya month occurs. If yes, both the skippedrasi and leaprasi != 0. Otherwise, skippedrasi = leaprasi = 0. **)
    If[skippedrasi != 0, 
(** leaprasi is always < skippedrasi and both must fall in the same nirayana year. **)
      If[(leaprasi <= solarMonth < skippedrasi) && (! (leapMonth = solarMonth == nextsolarMonth)), 
        month = solarMonth + 2, If[solarMonth == leaprasi, 
         leapMonth = ! (solarMonth == nextsolarMonth)];
        month = Calendrica`Private`AdjustedMod[solarMonth + 1, 12]],
      month = Calendrica`Private`AdjustedMod[solarMonth + 1, 12]];
    year = Calendrica`Private`HinduCalendarYear[nextNewMoon] - 
               Calendrica`Private`HinduLunarEra[] - If[leapMonth && month == 1, -1, 0];
    amantaNorthWestHinduLunar[month, leapMonth, day, leapDay, year]]


(** 
IndianFullMoonAtOrBefore[kyTime_]
Input: Hindu moment. Output: Hindu moment. 
We're computing the IST for full moon at or before kyTime. For this function, we convert kyTime to a julian day number and use FullMoonAtOrBefore[jd_] to find the required full moon (in Greenwich) in julian day number. Then we convert this back to Hindu moment. The fractional part of this Hindu moment gives the IST for the required full moon. 
Accuracy tested within about 1 minute.
**)
IndianFullMoonAtOrBefore[kyTime_] :=
    Module[{JDmoment, fullMoon, fullMoonInMoment, result},
    JDmoment = JDFromMoment[kyTime + Calendrica`Private`HinduEpoch[]];
    fullMoon = FullMoonAtOrBefore[JDmoment];
    fullMoonInMoment = MomentFromJD[fullMoon];
    result = fullMoonInMoment - Calendrica`Private`HinduEpoch[] + 11/48;
(** A julian day runs from noon to the next noon. When required full moon (= result) falls on the same julian day as kyTime does, result will be returned even if the time of result is later than that of the kyTime. This is not our desired output. Hence we implement the If condition. If result is later than kyTime, find the last full moon before result. Then let the last full moon be the result and return result. Otherwise, return result straightaway. **)
    If[result > kyTime,
           fullMoon = FullMoonAtOrBefore[JDmoment - 1];
           fullMoonInMoment = MomentFromJD[fullMoon];
           fullMoonInMoment - Calendrica`Private`HinduEpoch[] + 11/48, 
      result]]



	
End[]

EndPackage[]
