*************************************************;
* Statistical Hypothesis Testing with SAS and R *;
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 4.3.1: k-sample binomial test            *;
*************************************************;

data counts;
input r c counts;
datalines;
1 1 10 
1 0  9
2 1 12 
2 0  8
3 1 14 
3 0  7
;
run;

proc freq;
 tables r*c /chisq;
 weight counts;
run;
