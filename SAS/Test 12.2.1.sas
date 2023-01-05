**************************************************;
* Statistical Hypothesis Testing with SAS and R  *; 
* by Dirk Taeger and Sonja Kuhnt                 *;
* (c) John Wiley & Sons, Ltd                     *;
*                                                *;
* Test 12.2.1: Chi-square Goodness-of-fit test   *;  
**************************************************;
data dice;
 input pips counts;
 datalines;
 1 10
 2 12
 3  7
 4 11
 5  9
 6 11
 ;
run;

proc freq data=dice;
 tables pips /chisq testp=(0.166667 0.166667 0.166667 0.166667 0.166667 0.166667);
 weight counts;
run;
