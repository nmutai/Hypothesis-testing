*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 15.2.2: Test on outliers for             *;
*              uniform null distributions       *;
*************************************************;

* Calculate the necessary values;
proc summary data=pvalues;
 var pvalue;
 output out=uniform n=n idgroup(max(pvalue) out[2](pvalue)=max)
                        idgroup(min(pvalue) out[2](pvalue)=min);
run;

* Output dataset includes following variables;
* max_1 = x_(n), max_2=x_(n-1);
* min_1 = x_(1), min_2=x_(2);

data uniform_test;
 set uniform;
 format p_value pvalue.;

 * Calculate the test statistic;
 u=((max_1-max_2+min_2-min_1)/(max_2-min_2))*((n-3)/2)  ;
 
 
 * Calculate p-values;
 p_value=1-probf(u,4,2*(n-3));

run;

* Output results;
proc print split='*' noobs;
 var u p_value;
 label u='Test statistic*--------------'
       p_value='p-value*---------';
 title 'Test on lower and upper outlier in a univariate sample';
run;
