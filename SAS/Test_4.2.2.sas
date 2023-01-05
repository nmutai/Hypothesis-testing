**************************************************;
* Statistical Hypothesis Testing with SAS and R  *; 
* by Dirk Taeger and Sonja Kuhnt                 *;
* (c) John Wiley & Sons, Ltd                     *;
*                                                *;
* Test 4.2.2: z-test for the equality between    *;
*             two proportions (pooled variances) *;
**************************************************;

* Determining sample sizes and number of successes;
proc means data=malfunction n sum;
 var malfunction;
 by company;
 output out=prop1 n=n sum=success;
run;

* Retrieve these results in two separate datasets; 
data propA propB;
 set prop1;
 if company="A" then output propA;
 if company="B" then output propB;
run;

* Relative frequencies of successes for company A;
data propA;
 set propA;
 keep n success p1;
 rename n=n1
        success=success1;
 p1=success/n;
run;

* Relative frequencies of successes for company B;
data propB;
 set propB;
 keep n success p2;
 rename n=n2
        success=success2;
 p2=success/n;
run;

* Merge data sets of company A and B ; 
data prop2;
 merge propA propB;
run;

* Calculating test statistic an p-value;
data prop3;
 set prop2;
 format p_value pvalue.;

 * Test statistic and p-values;
 p=(p1*n1+p2*n2)/(n1+n2);
 z=(p1-p2)/sqrt((p*(1-p))*(1/n1+1/n2));
 p_value=2*probnorm(-abs(z));
run;

proc print;
 var z p_value;
run;
