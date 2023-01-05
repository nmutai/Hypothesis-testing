*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 2.2.2: Two-sample pooled t-test          *;
*************************************************;

proc ttest data=blood_pressure h0=0 sides=2;
 class status;
 var mmhg;
run;
