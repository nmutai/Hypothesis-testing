*************************************************;
* Statistical Hypothesis Testing with SAS and R *;
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 13.2.1: von Neumann test                 *;
*************************************************;

* Calculate the square of the differences;
data numerator;
 set harvest;
 d=dif(harvest)**2;
run;

* Calculate the sum of the squared differences;
proc means data=numerator sum;
 var d;
 output out=numerator2 sum=numerator;
run;

* Calculate the variance of the values;
proc means data=harvest var; 
 var harvest;
 output out=denumerator var=variance;
run;

* Calculate test statistic and p-values;
data neumann;
 merge numerator2 denumerator;

 format p_value_A p_value_B p_value_C pvalue8.;

 n=_FREQ_;
 vn=numerator/((n-1)*variance);
 z=(1-(vn/2))/sqrt((n-2)/(n**2-1));

 p_value_A=2*probnorm(-abs(z));
 p_value_B=1-probnorm(z);
 p_value_C=probnorm(z);
run;

* Output results;
proc print split='*' noobs;
 var vn z p_value_A p_value_B p_value_C ;
 label vn='von Neuman statistic*--------------------'
       z='Test statistic Z*----------------'
       p_value_A='p-value A*----------'
	   p_value_B='p-value B*----------'
	   p_value_C='p-value C*----------';
 title 'von Neuman Test';
run;
 


