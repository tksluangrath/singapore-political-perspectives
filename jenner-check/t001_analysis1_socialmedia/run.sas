/* cap input rows for the captured run */
options obs=100;

/* The original final.sas reads library.global_trends from an external
   disk (libname library "D:\MATH309\finalproject"). To make Analysis 1
   runnable in isolation, point `library` at a writable work path and seed
   a small mock global_trends with the exact columns Analysis 1 reads. The
   recoding, PROC MEANS and PROC LOGISTIC below are the author's own code,
   unchanged. */
libname library "%sysfunc(pathname(work))";

data library.global_trends;
  input country use_internet own_cell_standalone
        smeffect_changemind smeffect_awareness smimpact_manipulate;
  datalines;
14 2 1 2 4 8
14 1 1 4 4 3
14 1 1 3 2 8
14 2 2 2 3 3
14 2 1 8 1 8
14 2 1 4 9 1
14 2 1 4 4 1
14 1 1 2 2 3
14 2 2 2 2 3
14 1 2 4 1 2
14 1 2 4 4 1
14 1 1 4 2 1
14 2 1 3 2 8
14 1 1 1 4 2
14 1 1 8 2 1
14 1 1 3 1 3
14 1 1 1 1 8
14 1 1 3 2 2
14 1 1 3 9 3
14 1 1 8 1 2
14 1 1 2 2 8
14 1 1 8 3 3
14 1 1 4 1 8
14 1 1 3 2 8
14 1 1 4 9 3
14 2 1 2 9 1
14 1 2 4 9 3
14 1 1 2 9 1
14 2 1 3 1 1
14 1 1 2 9 3
14 1 1 1 3 1
14 1 2 8 2 8
14 1 2 3 1 2
14 1 1 8 2 1
14 2 1 4 2 2
14 1 1 8 1 1
14 2 1 2 1 3
14 1 2 2 2 2
14 1 2 2 9 8
14 1 1 1 2 1
22 1 1 3 3 2
22 2 2 2 4 3
1 2 2 3 4 3
1 2 2 3 1 3
22 1 1 4 1 3
;
run;

Title"Analysis 1";
data library.singapore;
set library.global_trends;
where country = 14;
if use_internet in (1) then use_internet=1;
if use_internet in (2) then use_internet=0;
if own_cell_standalone in (1) then own_cell_standalone=1;
if own_cell_standalone in (2) then own_cell_standalone=0;
if smeffect_changemind in (1,2) then smeffect_changemind=1;
if smeffect_changemind in (3,4) then smeffect_changemind=0;
if smeffect_changemind in (8,9) then smeffect_changemind=.;
if smeffect_awareness in (1,2) then smeffect_awareness=1;
if smeffect_awareness in (3,4) then smeffect_awareness=0;
if smeffect_awareness in (8,9) then smeffect_awareness=.;
if smimpact_manipulate in (1) then smimpact_manipulate=1;
if smimpact_manipulate in (2) then smimpact_manipulate=0;
if smimpact_manipulate in (3,8,9) then smimpact_manipulate=.;

* Q24. Do you use the internet, at least occasionally?;
proc means data=library.Singapore;
var use_internet;
run;

* Q25. Do you own a mobile phone?;
proc means data=library.Singapore;
var own_cell_standalone;
run;

* Q30c. In general, do you think social media is very effective,
somewhat effective, not too effective or not at all effective way
to do the following?
c. Change people's mind about polictial or social issues;
proc means data=library.Singapore;
var smeffect_changemind;
run;

* Q30d. In general, do you think social media is very effective,
somewhat effective, not too effective or not at all effective way
to do the following?
d. Raise public awareness about political or social issue;

proc means data=library.Singapore;
var smeffect_awareness;
run;

* Q31d. Do you think access to the internet and social media
has made people more or less __, or has it not had much impact either way?
d. Easy to manipulate with false information and rumors;
proc means data=library.Singapore;
var smimpact_manipulate;
run;

* full model;
proc logistic data=library.singapore descending;
class smeffect_changemind
smeffect_awareness smimpact_manipulate /
param=glm;
output out=predicted p=phat;
model use_internet=own_cell_standalone smeffect_changemind
smeffect_awareness smimpact_manipulate;
run;
* Reduced model;
proc logistic data=library.singapore descending;
class smeffect_awareness smimpact_manipulate /
param=glm;
output out=predicted p=phat;
model use_internet=  smeffect_awareness smimpact_manipulate;
run;
