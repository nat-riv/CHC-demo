
/*TRACKING CHANGES*/

* Fit a log-risk regression model;
PROC GENMOD data =D.EPID716_3A1 ;
MODEL preterm = mage2 / link = log dist = binomial;
	OUTPUT OUT=a2_2 pred = pred l = l95 u = u95;
	estimate 'Risk of preterm (age 16)' int 1 mage2 16; * ;
    estimate 'Risk of preterm (age 26)' int 1 mage2 26; * ;
	estimate 'Risk of preterm (age 40)' int 1 mage2 40; * ;
    estimate 'RR, age 16 vs. age 26' int 0 mage2 -10; 
	estimate 'RR, age 40 vs. age 26' int 0 mage2 14; * ;
	title 'Log Risk Model for Simple Contnuous Variable of Age';
run;


*Futher analysis shows that it would be to model age as a quadratic term in the final analysis. 
 Updated the code.; 
/*Should look like code below:
proc genmod data = births ;
	model preterm = mage2 mage2*mage2 / link = log dist = binomial;
	ESTIMATE 'Risk 16' int 1 mage2 16 mage2*mage2 256;
	ESTIMATE 'Risk 26' int 1 mage2 26 mage2*mage2 676;
	ESTIMATE 'Risk 40' int 1 mage2 40 mage2*mage2 1600;
	estimate 'RR 16 v 26' int 0 mage2 -10 mage2*mage2 -420;
    estimate 'RR 40 v 26' int 0 mage2 14 mage2*mage2 924;
	OUTPUT out=a3_2 p=pred l=l95m u=u95m;
	title 'Log Risk Model with a Quadratic Term for Linear Age';
	run;*/






*Pull request example;
 PROC GENMOD data =ages ;
MODEL preterm = mage14 - mage25 mage27-mage44 / link = identity dist = binomial;
	OUTPUT OUT=a1_1 pred = pred l = l95 u = u95;
	title 'Linear Risk Model for 31 Categories of Age';
	estimate 'Risk of preterm (age 16)' int 1 mage16 1;
	estimate 'Risk of preterm (age 26)' int 1 ;
	estimate 'Crude RD, age 18 vs. age 26' int 0 mage18 1;
run;




