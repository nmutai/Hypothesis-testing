*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 9.1.1: Siegel-Tukey test                 *;  
*************************************************;

proc npar1way data=blood_pressure correct=no st;
 var mmhg;
 class status; 
 exact st;
run;
