*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 15.2.1: Test on outliers for             *;
*              exponential null distributions   *;
*************************************************;

* Calculate the sample statistics;
proc summary data=waiting;
 var time;
 output out=expo n=n idgroup(max(time) out[2](time)=max)
                     idgroup(min(time) out[2](time)=min);
run;

* Output dataset includes following variables;
* max_1 = x_(n), max_2=x_(n-1);
* min_1 = x_(1), min_2=x_(2);

data expo_test;
 set expo;
 format p_value_B p_value_C pvalue.;

 * Calculate the test statistics;
 e_A=(max_1-max_2)/(max_1-min_1);
 e_B=(min_2-min_1)/(max_1-min_1);
 
 * Calculate p-values;
 p_value_A=(n-1)*(n-2)*beta((2-e_A)/(1-e_A),n-2);
 p_value_B=1-(n-2)*beta((1+(n-2)*e_B)/(1-e_B),n-2);
run;

* Output results;
proc print split='*' noobs;
 var e_A  p_value_A;
 label e_A='Test statistic e_A*------------------'
       p_value_A='p-value A*---------';
 title 'Test on an upper outlier in an exponential sample';
run;

proc print split='*' noobs;
 var   e_B p_value_B;
 label e_B='Test statistic e_B*-------------------'
       p_value_B='p-value B*---------';
 title 'Test on a lower outlier in an exponential sample';
run;
