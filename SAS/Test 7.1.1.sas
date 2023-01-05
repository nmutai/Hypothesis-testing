*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 7.1.1: Pearson's product moment          *;
*             correlation coefficient           *;  
*************************************************;

* a) Test the hypothesis H0: Rho=0;
proc corr data=students pearson;
 var height weight;
run;

* b) Test the hypothesis H0: Rho=0.5;
proc corr data=students fisher(rho0=0.5 biasadj=yes type=twosided);
 var height weight;
run;

