******************************************************;
* Statistical Hypothesis Testing with SAS and R       ;
* by Dirk Taeger and Sonja Kuhnt                      ;
* (c) John Wiley & Sons, Ltd                          ;
*                                                     ;
* File to make the datasets avaliable                 ;
******************************************************;

* Replace the following libname with our own;
libname c  'C:\book\data';

data blood_pressure;
 set c.blood_pressure;
run;

data iq;
 set c.iq;
run;

data malfunction;
 set c.malfunction;
run;

data infections;
 set c.infections;
run;

data students;
 set c.students;
run;

data workpieces;
 set c.workpieces;
run;

data coin;
 set c.coin;
run;

data harvest;
 set c.harvest;
run;

data silicosis;
 set c.silicosis;
run;

data waiting;
 set c.waiting;
run;

data pvalues;
 set c.pvalues;
run;

data crop;
 set c.crop;
run;

