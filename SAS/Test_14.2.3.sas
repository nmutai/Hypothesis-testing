*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 14.2.3: Bowker’s test for symmetry       *;
*************************************************;

* Construct the contingency table;
data counts;
  input gp1 gp2 counts;
  datalines;
  1 1 10
  1 2  8
  1 3 12
  2 1 13
  2 2 14
  2 3  6
  3 1  1
  3 2 10
  3 3 20 
run;  
  
* Apply the test;
proc freq;
 tables gp1*gp2;
 weight counts;
 exact agree;
run;

