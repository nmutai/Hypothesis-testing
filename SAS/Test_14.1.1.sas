*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 14.1.1: Fisher's exact test              *;
*************************************************;

proc freq data=malfunction;
 tables company*malfunction /fisher;
run;

