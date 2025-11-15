(* Test script for TakesakoSolarEclipses function *)

(* Load the main file *)
Get["/home/runner/work/KalProg/KalProg/Calendrica4.m"]

Print["===================================================================="]
Print["Testing TakesakoSolarEclipses Function"]
Print["===================================================================="]
Print[""]

(* Test 1: Year -13001 (which is 13001 BCE in astronomical year numbering) *)
(* According to Takesako_solar_eclipses.txt, year -13000 (Takesako format) has two eclipses: *)
(* -13000  4  23  21  20  47 *)
(* -13000 10  18  23  12  40 *)
(* Note: Takesako year -13000 = Mathematica year -13001 *)
Print["Test 1: Year -13001 (13001 BCE in astronomical year numbering)"]
Print["Expected: Two eclipses on April 23 and October 18"]
Print[""]

result1 = TakesakoSolarEclipses[-13001]

Print["Result:"]
Print[result1]
Print["Number of eclipses found: ", Length[result1]]
Print[""]

(* Test 2: Year 2024 CE - should have 2 eclipses *)
Print["===================================================================="]
Print["Test 2: Year 2024 CE"]
Print["Expected: Two eclipses (April 8 and October 2, 2024)")
Print[""]

result2024 = TakesakoSolarEclipses[2024]

Print["Result:"]
Print[result2024]
Print["Number of eclipses found: ", Length[result2024]]
Print[""]

(* Test 3: Year with no eclipses or very few *)
Print["===================================================================="]
Print["Test 3: Year 1500 CE (Julian calendar year)")
Print[""]

result1500 = TakesakoSolarEclipses[1500]

Print["Result:"]
Print[result1500]
Print["Number of eclipses found: ", Length[result1500]]
Print[""]

(* Test 4: Display format details for first eclipse of -13001 *)
If[Length[result1] > 0,
 Print["===================================================================="];
 Print["Details of first eclipse in year -13001:"];
 Print[""];
 Print["Full eclipse data: ", result1[[1]]];
 Print["Date: ", result1[[1, 1]]];
 Print["Time: ", result1[[1, 2]]];
 Print["Type: ", result1[[1, 3]]];
 Print["Catalog: ", result1[[1, 4]]];
 Print["Saros: ", result1[[1, 5]]];
 Print["Gamma: ", result1[[1, 6]]];
 Print[""]
];

Print["===================================================================="]
Print["All tests completed!"]
Print["===================================================================="]
