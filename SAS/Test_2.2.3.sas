*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 2.2.3: Welch test                        *;
*************************************************;

proc ttest data=blood_pressure h0=0 sides=2 cochran;
 class status;
 var mmhg;
run;
