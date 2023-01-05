************************************************+;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 11.2.1: Shapiro-Wilk test                *;
*************************************************;

proc univariate data=blood_pressure normal;
  var mmhg;  
run;
