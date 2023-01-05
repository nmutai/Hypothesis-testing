*************************************************;
* Statistical Hypothesis Testing with SAS and R *;
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 4.1.1: Binomial test                     *;
*************************************************;

*** Version 1 ***;
* Only for hypothesis (A) and (C);

proc freq data=malfunction;
  tables malfunction / binomial(level='1' p=.5 correct);
  exact binomial;
run;


*** Version 2 ***;
* For hypothesis (A), (B), and (C);

* Calculate the numbers of successes and failures;
proc sort data=malfunction;
 by malfunction;
run;

proc summary data=malfunction n;
 var malfunction;
 by malfunction;
 output out=ptest01  n=n;
run;

* Retreive the number of successe and failures;
data ptest02 ptest03;;
 set ptest01;
 if malfunction=0 then output ptest02;
 if malfunction=1 then output ptest03;
run;

* Rename number of failures;
data ptest02;
 set ptest02;
 rename n=failures;
 drop malfunction _TYPE_ _FREQ_;
run; 

* Rename number of successes;
data ptest03;
 set ptest03;
 rename n=successes;
 drop malfunction _TYPE_ _FREQ_;
run; 

* Caculate test statistic and p-values;
data ptest04; 
  merge ptest02 ptest03;
  format test $20.;
  
  n=successes+failures;
 * Estimated Proportion; 
  p_estimate=successes/n;
 * Proportion to test;
  p0=0.5;
 
 * Perform exact test;
  test="Exact";
  p_value_B=probbnml(p0,n,failures);
  p_value_C=probbnml(p0,n,successes);
  p_value_A=2*min(p_value_B,p_value_c);
  output;

 * Perform asymtotic test; 
   test="Asymptotic";
   Z=(successes-n*p0)/sqrt((n*p0*(1-p0)));
   p_value_A=2*probnorm(-abs(Z));
   p_value_B=1-probnorm(-abs(Z));
   p_value_C=probnorm(-abs(Z));
   output;

* Perform asymptotic test with continuity correction; 
   test="Asymptotic with correction";
   Z=(abs(successes-n*p0)-0.5)/sqrt((n*p0*(1-p0)));
   p_value_A=2*probnorm(-abs(Z));
   p_value_B=1-probnorm(-abs(Z));
   p_value_C=probnorm(-abs(Z));
  output;
run;

* Output results;
proc print;
  var test Z p_estimate p0 p_value_A p_value_B p_value_C;
run; 

