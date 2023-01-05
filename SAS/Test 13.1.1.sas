*************************************************;
* Statistical Hypothesis Testing with SAS and R *;
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 13.1.1: Wald-Wolfowitz runs test         *;
*************************************************;

* Go through the dataset and count the head and tail runs.
* The last observation of this dataset contains all relevant
* values of the variables;
data runs;
 set coin;
 retain headruns 0 tailruns 0 n1 0 n2 0;

 temp1=head;       * Let temp1 be the same as head ;
 temp2=lag(head);  * temp2 is a lagged variable of head (a shift of one place);

 * Counting the number of heads (n1) and tails (n2);
 if head=1 then n1=n1+1;
 if head=0 then n2=n2+1;

 * Look at the first observation to decide if the
 * headrun or tail runs starts;
 if _N_=1 then do;
   if head=1 then headruns=1;
   if head=0 then tailruns=1;
 end;

 * Go through the dataset for all other observations
 * if the value is not the shifted value then a new run starts;
 if _N_>1 then do;
  if temp1 ^= temp2 then do;
   if temp1=1 then headruns=headruns+1;
   if temp1=0 then tailruns=tailruns+1 ;
  end;
 
end;
 
run;

* Calculate test statistic and p-values;
data wwtest;
 set runs nobs=nobs;
 drop temp1 temp2;
 format p_value_A p_value_B p_value_C pvalue.;

 if _n_=nobs;  * Keep last observation of the dataset 'runs';

 r=(headruns+tailruns); * Total number of runs;
 n=n1+n2;               * Number of observations;

 * Calculate test statistic;
 mu=2*(n1*n2)/n+1;
 sigma=sqrt((2*n1*n2)*(2*n1*n2-n)/(n**2*(n-1)));
 z=(r-mu)/sigma;

 p_value_A=2*probnorm(-abs(z));
 p_value_B=1-probnorm(z);
 p_value_C=probnorm(z);  

run;

* Output results;
proc print split='*' noobs;
 var z r p_value_A p_value_B p_value_C;
 label z='Test statistic Z*----------------'
       r='No. of Runs*-----------'
       p_value_A='p-value A*----------'
	   p_value_B='p-value B*----------'
	   p_value_C='p-value C*----------';
 title 'Wald-Wolfowitz Test';
run;
 


