(* Test file for TimePlus and TimeDistance functions *)

(* Load the Calendrica4.m package *)
Get["/home/runner/work/KalProg/KalProg/Calendrica4.m"]

(* Test 1: Add 0 seconds - should return same time *)
Print["Test 1: Add 0 seconds"];
result1 = TimePlus[{2024, 1, 15, 10, 30, 45}, 0];
Print["Input: {2024, 1, 15, 10, 30, 45}, Add: 0 seconds"];
Print["Result: ", result1];
Print["Expected: {2024, 1, 15, 10, 30, 45}"];
If[result1 === {2024, 1, 15, 10, 30, 45}, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 2: Add 15 seconds *)
Print["Test 2: Add 15 seconds"];
result2 = TimePlus[{2024, 1, 15, 10, 30, 45}, 15];
Print["Input: {2024, 1, 15, 10, 30, 45}, Add: 15 seconds"];
Print["Result: ", result2];
Print["Expected: {2024, 1, 15, 10, 31, 0}"];
If[result2 === {2024, 1, 15, 10, 31, 0}, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 3: Add 1 hour (3600 seconds) *)
Print["Test 3: Add 1 hour (3600 seconds)"];
result3 = TimePlus[{2024, 1, 15, 10, 30, 45}, 3600];
Print["Input: {2024, 1, 15, 10, 30, 45}, Add: 3600 seconds"];
Print["Result: ", result3];
Print["Expected: {2024, 1, 15, 11, 30, 45}"];
If[result3 === {2024, 1, 15, 11, 30, 45}, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 4: Add 1 day (86400 seconds) *)
Print["Test 4: Add 1 day (86400 seconds)"];
result4 = TimePlus[{2024, 1, 15, 10, 30, 45}, 86400];
Print["Input: {2024, 1, 15, 10, 30, 45}, Add: 86400 seconds"];
Print["Result: ", result4];
Print["Expected: {2024, 1, 16, 10, 30, 45}"];
If[result4 === {2024, 1, 16, 10, 30, 45}, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 5: Add time that crosses midnight *)
Print["Test 5: Add time that crosses midnight"];
result5 = TimePlus[{2024, 1, 15, 23, 30, 45}, 3600];
Print["Input: {2024, 1, 15, 23, 30, 45}, Add: 3600 seconds"];
Print["Result: ", result5];
Print["Expected: {2024, 1, 16, 0, 30, 45}"];
If[result5 === {2024, 1, 16, 0, 30, 45}, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 6: Add time that crosses month boundary *)
Print["Test 6: Add time that crosses month boundary"];
result6 = TimePlus[{2024, 1, 31, 12, 0, 0}, 86400];
Print["Input: {2024, 1, 31, 12, 0, 0}, Add: 86400 seconds"];
Print["Result: ", result6];
Print["Expected: {2024, 2, 1, 12, 0, 0}"];
If[result6 === {2024, 2, 1, 12, 0, 0}, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 7: Subtract 1 hour (negative seconds) *)
Print["Test 7: Subtract 1 hour (-3600 seconds)"];
result7 = TimePlus[{2024, 1, 15, 10, 30, 45}, -3600];
Print["Input: {2024, 1, 15, 10, 30, 45}, Add: -3600 seconds"];
Print["Result: ", result7];
Print["Expected: {2024, 1, 15, 9, 30, 45}"];
If[result7 === {2024, 1, 15, 9, 30, 45}, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 8: Subtract time that crosses midnight *)
Print["Test 8: Subtract time that crosses midnight"];
result8 = TimePlus[{2024, 1, 15, 0, 30, 45}, -3600];
Print["Input: {2024, 1, 15, 0, 30, 45}, Add: -3600 seconds"];
Print["Result: ", result8];
Print["Expected: {2024, 1, 14, 23, 30, 45}"];
If[result8 === {2024, 1, 14, 23, 30, 45}, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 9: TimeDistance - same time *)
Print["Test 9: TimeDistance - same time"];
result9 = TimeDistance[{2024, 1, 15, 10, 30, 45}, {2024, 1, 15, 10, 30, 45}];
Print["Input: {2024, 1, 15, 10, 30, 45} to {2024, 1, 15, 10, 30, 45}"];
Print["Result: ", result9];
Print["Expected: 0"];
If[result9 === 0, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 10: TimeDistance - 1 hour difference *)
Print["Test 10: TimeDistance - 1 hour difference"];
result10 = TimeDistance[{2024, 1, 15, 10, 30, 45}, {2024, 1, 15, 11, 30, 45}];
Print["Input: {2024, 1, 15, 10, 30, 45} to {2024, 1, 15, 11, 30, 45}"];
Print["Result: ", result10];
Print["Expected: 3600"];
If[result10 === 3600, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 11: TimeDistance - 1 day difference *)
Print["Test 11: TimeDistance - 1 day difference"];
result11 = TimeDistance[{2024, 1, 15, 10, 30, 45}, {2024, 1, 16, 10, 30, 45}];
Print["Input: {2024, 1, 15, 10, 30, 45} to {2024, 1, 16, 10, 30, 45}"];
Print["Result: ", result11];
Print["Expected: 86400"];
If[result11 === 86400, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 12: TimeDistance - negative (backwards in time) *)
Print["Test 12: TimeDistance - negative (backwards in time)"];
result12 = TimeDistance[{2024, 1, 15, 11, 30, 45}, {2024, 1, 15, 10, 30, 45}];
Print["Input: {2024, 1, 15, 11, 30, 45} to {2024, 1, 15, 10, 30, 45}"];
Print["Result: ", result12];
Print["Expected: -3600"];
If[result12 === -3600, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 13: TimeDistance - across month boundary *)
Print["Test 13: TimeDistance - across month boundary"];
result13 = TimeDistance[{2024, 1, 31, 12, 0, 0}, {2024, 2, 1, 12, 0, 0}];
Print["Input: {2024, 1, 31, 12, 0, 0} to {2024, 2, 1, 12, 0, 0}"];
Print["Result: ", result13];
Print["Expected: 86400"];
If[result13 === 86400, Print["PASS"], Print["FAIL"]];
Print[""];

(* Test 14: Verify TimePlus and TimeDistance are inverses *)
Print["Test 14: Verify TimePlus and TimeDistance are inverses"];
time1 = {2024, 1, 15, 10, 30, 45};
seconds = 12345;
time2 = TimePlus[time1, seconds];
result14 = TimeDistance[time1, time2];
Print["Starting time: ", time1];
Print["Add ", seconds, " seconds: ", time2];
Print["Distance between them: ", result14];
Print["Expected: ", seconds];
If[result14 === seconds, Print["PASS"], Print["FAIL"]];
Print[""];

Print["All tests completed!"];
