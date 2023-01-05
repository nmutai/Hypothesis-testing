****************************************************************;
* Statistical Hypothesis Testing with SAS and R                *;
* by Dirk Taeger and Sonja Kuhnt                               *;
* (c) John Wiley & Sons, Ltd                                   *;
*                                                              *;
* Test 3.2.2: t-test on variances of two dependent populations *;
****************************************************************;

* Calculate sample standard deviations and sample size;
proc means data=iq std;
 var iq1;
 output out=std1 std=std1 n=n_total;
run;
proc means data=iq std;
 var iq2;
 output out=std2 std=std2 n=n_total;
run;

data ttest01;
 merge std1 std2;
run;

* Calculate correlation coefficient; 
proc corr data=iq OUTP=corr01;
 var iq1 iq2;
run;

data corr02;
 set corr01;
 if _TYPE_='CORR' and _NAME_='IQ1';
 rename IQ2 = r;
 drop _TYPE_;
run;

data ttest02;
 merge ttest01 corr02;
run;

* Calculate test statistic and two-sided p-value;
data ttest03; 
 set ttest02;
 format p_value pvalue.;
 df=n_total-2;
 t=((df**0.5)*(std1**2-std2**2))/(4*(1-r**2)*(std1**2)*(std2**2));
 p_value=2*probt(-abs(t),df);
run;

* Output results;
proc print;
 var t df p_value;
run;
