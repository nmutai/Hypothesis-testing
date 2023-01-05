*************************************************;
* Statistical Hypothesis Testing with SAS and R *;
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 11.1.3: Cramer-von Mises test            *;
*************************************************;


*** Variant 1 ***;
proc univariate data=blood_pressure normal;
  var mmhg;  
run;

*** Variant 2 ***;
proc univariate data=blood_pressure;
  histogram mmhg /normal(mu=130 sigma=19.16691);  
run;
