*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 14.1.2: Pearson's chi-square test        *;
*************************************************;

proc freq data=malfunction;
 tables company*malfunction /chisq;
run;

