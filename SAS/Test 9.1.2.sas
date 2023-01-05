*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 9.1.2: Ansari-Bradley test               *;
*************************************************;

proc npar1way data=blood_pressure correct=no ab;
 var mmhg;
 class status; 
 exact ab;
run;
