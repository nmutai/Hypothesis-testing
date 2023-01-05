*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 15.1.2: David-Hartley-Pearson test       *;
*************************************************;

* Calculate the necessary values, like range and standard deviation;
proc summary data=students;
 var height;
 output out=dhp n=n range=x_range std=x_std;
run;

data dhp_test;
 set dhp;
 format p_value pvalue.;

 * Calculate the test statistics;
 q=x_range/x_std;
 
 * Calculate p-values;
 t=sqrt(((n-2)*q**2)/(2*n-2-q**2));
 
 p_value=n*(n-1)*(1-probt(t,n-2));
run;

* Output results;
proc print split='*' noobs;
 var q p_value;
 label q='Test statistic*-------------*'
       p_value='p-value*---------*';
 title 'David-Hartley-Pearson Test';
run;
