*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 15.1.1: Grubbs' test                     *;
*************************************************;

* Calculate basic statistics, like maximum and minimum;
proc summary data=students;
 var height;
 output out=grupps n=n min=x_min max=x_max mean=x_mean std=x_std;
run;

data grubbs_test;
 set grupps;
 format p_value_A p_value_B p_value_C pvalue.;

 * Calculate the test statistics;
 g_B=(x_max-x_mean)/x_std;
 g_C=(x_mean-x_min)/x_std;
 g_A=max(g_B,g_C);

 * Calculate p-values;
 t_A=sqrt((n*(n-2)*g_A**2)/((n-1)**2-n*g_A**2));
 t_B=sqrt((n*(n-2)*g_B**2)/((n-1)**2-n*g_B**2));
 t_C=sqrt((n*(n-2)*g_C**2)/((n-1)**2-n*g_C**2));

 p_value_A=2*n*(1-probt(t_A,n-2));
 p_value_B=n*(1-probt(t_B,n-2));
 p_value_C=n*(1-probt(t_C,n-2));
run;

* Output results;
proc print split='*' noobs;
 var g_A  p_value_A g_B p_value_B g_C p_value_C;
 label g_A='Test Statistic g_A*------------------'
       p_value_A='p-value A*---------'
       g_B='Test Statistic g_B*------------------'
	   p_value_B='p-value B*---------'
	   g_C='Test Statistic g_C*------------------'
	   p_value_C='p-value C*---------';
 title 'Grubbs'' Test';
run;

