*************************************************;
* Statistical Hypothesis Testing with SAS and R *;
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 13.2.2: von Neumann rank test            *;
*              (Bartels' test)                  *;
*************************************************;

* Calculate the ranks of the observations;
proc rank data=harvest out=rank_data;
 var harvest;
run;
 
* Calculate the square of the differences;
data numerator;
 set rank_data;
 d=dif(harvest)**2;
run;

* Calculate the sum of the squared differences;
proc means data=numerator sum;
 var d;
 output out=numerator2 sum=numerator;
run;

* Calculate the empirical variance of the values;
proc means data=rank_data var; 
 var harvest;
 output out=denumerator var=variance;
run;

* Calculate test statistic and p-values;
data neumann;
 merge numerator2 denumerator;

 format p_value_A p_value_B p_value_C pvalue8.;

 n=_FREQ_;
 rvn=numerator/((n-1)*variance);
 z=(rvn-2)/sqrt(4/n);

 p_value_A=2*probnorm(-abs(z));
 p_value_B=1-probnorm(z);
 p_value_C=probnorm(z);
run;

* Output results;
proc print split='*' noobs;
 var rvn z p_value_A p_value_B p_value_C;
 label rvn='von Neuman rank statistic*-------------------------'
       z='Test statistic Z*----------------'
       p_value_A='p-value A*----------'
	   p_value_B='p-value B*----------'
	   p_value_C='p-value C*----------';
 title 'von Neuman Rank Test';
run;
 


