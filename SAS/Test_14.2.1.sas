*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 14.2.1: Test on Cohen's kappa            *;
*************************************************;

proc freq data=silicosis;
 tables reviewer1*reviewer2;
 exact kappa;
run;

