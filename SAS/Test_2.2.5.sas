**************************************************;
* Statistical Hypothesisg Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                 *;
* (c) John Wiley & Sons, Ltd                     *;
*                                                *;
* Test 2.2.5: Paired t-test                      *;
**************************************************;

proc ttest data=iq h0=-10 sides=2;
 paired iq1*iq2;
run;
