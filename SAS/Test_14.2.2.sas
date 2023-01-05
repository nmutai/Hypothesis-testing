*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 14.2.2: McNemar's test                   *;
*************************************************;

* Dichotomize the variables iq1 and iq2;
data temp;
 set iq;
  if iq1<=100 then iq_before=0;
  if iq1> 100 then iq_before=1;
  if iq2<=100 then iq_after=0;
  if iq2> 100 then iq_after=1;
run;  
  
* Apply the test;
proc freq;
 tables iq_before*iq_after;
 exact mcnem;
run;

