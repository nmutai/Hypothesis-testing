*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 16.2.1: Test on an individual regression *;
*              coefficient                      *;
*************************************************;

* Create a dummy variable for sex with reference male;
data reg;
 set students;
 if sex=1 then s=0;
 if sex=2 then s=1;
run;

* Perform linear regression;
proc reg data=reg;
 model weight=height s;
run;
quit;
