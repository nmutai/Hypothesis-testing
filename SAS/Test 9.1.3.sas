*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 9.1.3: Mood test                         *;  
*************************************************;

proc npar1way data=blood_pressure correct=no mood;
 var mmhg;
 class status; 
 exact mood;
run;

                             

