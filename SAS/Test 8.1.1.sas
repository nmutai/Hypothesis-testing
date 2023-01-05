*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 8.1.1: Sign Test                         *;  
*************************************************;

*** Variant 1 ***;
* Only for hypothesis (A);
proc univariate data=blood_pressure mu0=120 loccount;
 var mmhg;
run;


*** Variant 2;

* Calculate the median;
proc means data=blood_pressure median;
 var mmhg;
 output out=sign2 median=m;
run;

* Calculate test statistic;
data sign1;
 set blood_pressure;
 mu0=120;                    * Set mu0=120 to test for; 
 if mmhg-mu0=0 then delete;  * Delete values equal to mu0;
 s=(mmhg-mu0>0);             * Set to 1 if values greater mu0;
run;

proc summary n;              * Count the number of 'successes' = test statistic v;
 var s;                      * and sample size;
 output out=sign3 n=n sum=v;
run;

* Put median(=m) and sample size (=n)
  and test stattsic (=v) in one dataset;
data sign4;
 merge sign2 sign3;
 keep m n v;
run;


* Calculation of p-values;
data sign5;
 set sign4;
 format pvalue_A 
        pvalue_B
        pvalue_C pvalue.;
 f=n-v;                      * Number of 'failures';

 * Decide which tail must be used for one-tailed tests;
 diff=m-120;
 if diff>=0 then             
  do;
   pvalue_B=probbnml(0.5,n,f);
   pvalue_C=probbnml(0.5,n,v);
  end;
 if diff<0 then 
  do;
   pvalue_B=probbnml(0.5,n,v);
   pvalue_C=probbnml(0.5,n,f);
  end;
 pvalue_A=min(2*min(pvalue_B,pvalue_C),1);
run;

* Output results;
proc print;
 var n v m pvalue_A pvalue_B pvalue_C;
run;

