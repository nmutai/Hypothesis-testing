*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 10.1.1: Kolmogorov-Smirnov two-sample    *;
*              test (Smirnov test)              *; 
*************************************************;

proc npar1way data=blood_pressure D;
 class status;
 var mmhg; 
 exact edf;
run;
