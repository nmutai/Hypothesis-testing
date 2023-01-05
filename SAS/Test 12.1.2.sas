*************************************************;
* Statistical Hypothesis Testing with SAS and R *;
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 12.1.2: Anderson-Darling test            *;
*************************************************;

proc univariate data=waiting;
 histogram time /exponential;
run;
