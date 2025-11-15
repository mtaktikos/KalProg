(* Test script for TakesakoSolarEclipse function *)

(* Load the main file *)
Get["/home/runner/work/KalProg/KalProg/Calendrica4.m"]

(* Test 1: Year -13001 (13001 BCE) *)
(* According to the problem statement, NeumondAlternate[-13001] returns new moons *)
(* and takesako_solar_eclipses.txt shows eclipses at: *)
(* -13000  4  23  21  20  47 (which is 13001 BCE in Gregorian year 0 format) *)
(* -13000 10  18  23  12  40 *)

Print["Testing TakesakoSolarEclipse[-13001] for year 13001 BCE..."]
Print["Expected: Two eclipses in April and October"]
Print[""]

result = TakesakoSolarEclipse[-13001]

Print["Result:"]
Print[result]
Print[""]

(* Expected output should show eclipses around April 23 and October 18 *)
(* The times should be close to the Takesako data *)

(* Test 2: Compare with NeumondAlternate output *)
Print["Comparing with NeumondAlternate[-13001]..."]
newmoons = NeumondAlternate[-13001]
Print["New moons in year -13001:"]
Print[newmoons]
Print[""]

Print["Number of new moons: ", Length[newmoons]]
Print["Number of eclipses: ", Length[result]]
Print[""]

(* Test 3: Modern year with known eclipses *)
Print["Testing TakesakoSolarEclipse[2024] for year 2024 CE..."]
result2024 = TakesakoSolarEclipse[2024]
Print["Solar eclipses in 2024:"]
Print[result2024]
Print[""]
Print["Expected: 2 eclipses (April 8 and October 2, 2024)")
Print[""]

(* Test 4: Year crossing the 1582 boundary *)
Print["Testing TakesakoSolarEclipse[1582] for year 1582 CE..."]
result1582 = TakesakoSolarEclipse[1582]
Print["Solar eclipses in 1582:"]
Print[result1582]
Print[""]

Print["All tests completed!"]
