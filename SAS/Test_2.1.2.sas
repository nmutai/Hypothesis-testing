*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 2.1.2: t-test                            *;
*************************************************;

proc ttest data=blood_pressure ho=140 sides=2;
 var mmhg;
run;

