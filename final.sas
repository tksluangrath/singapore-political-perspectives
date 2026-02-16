libname library "D:\MATH309\finalproject"; run;

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

Title"Analysis 2";
data library.Singapore; 
set library.global_trends; 
where country=14;
if use_internet in (1) then use_internet=1;
if use_internet in (2) then use_internet=0;
if own_cell_standalone in (1) then own_cell_standalone=1;
if own_cell_standalone in (2) then own_cell_standalone=0;
if fav_US in (8,9) then fav_US=.; 
if fav_US in (1,2) then fav_US=1; 
if fav_US in (3,4) then fav_US=0; 
if growinflu_us in (3,8) then growinflu_us=.;
if growinflu_us in (1) then growinflu_us=1; 
if growinflu_us in (2) then growinflu_us=0; 
if reliable_US in (8,9) then reliable_US=.; 
if reliable_US in (1,2) then reliable_US=1; 
if reliable_US in (3,4) then reliable_US=0;
if afg_handle in (8,9) then afg_handle=.; 
if afg_handle in (1,2,3) then afg_handle=1; 
if afg_handle in (4,5) then afg_handle=0; run; 
* Q24. Do you use the internet, at least occasionally?;
proc means data=library.Singapore;
var use_internet;
run;

* Q25. Do you own a mobile phone?;
proc means data=library.Singapore;
var own_cell_standalone;
run;

* Q5a: Please tell me if you have a very favorable, 
somewhat favorable, somewhat unfavorable, or 
very unfavorable opinion of The United States.;
proc means data=library.Singapore;
var fav_US;
run;

* Q14a: Thinking about The United States, would you say its 
influence in the world in recent years has been getting 
stronger, getting weaker, or staying about the same?;
proc means data=library.Singapore;
var growinflu_us;
run; 

*Q19: In general, how reliable is the United States as a 
partner to Singapore? Is the United States very reliable, 
somewhat reliable, not too reliable or 
not at all reliable as a partner?;
proc means data=library.Singapore;
var reliable_US;
run;


* Q21: Regardless of what you think about the United States’ 
decision to withdraw troops from Afghanistan, 
do you think the withdrawal itself was handled very well, 
somewhat well, not too well, or not at all well?;
proc means data=library.Singapore; 
var afg_handle;
run;

proc logistic data=library.singapore descending;
class use_internet own_cell_standalone fav_US 
growinflu_us reliable_US afg_handle /
param=glm;
output out=predicted p=phat;
model use_internet=own_cell_standalone fav_US 
growinflu_us reliable_US afg_handle; 
run;

Title"Analysis 3";
data library.Singapore; 
set library.global_trends; 
where country=14;

if fav_china in (8,9) then fav_china=.;
if intl_system in (8,9) then intl_system=.;
if growinflu_china in (3,8,9) then growinflu_china=.;
if relations_china in (8,9) then relations_china=.;
if china_politics in (8,9) then china_politics=.;
if confid_xi in (8,9) then confid_xi=.;

if fav_china in (1,2) then fav_china=1;
if relations_china in (1,2) then growinflu_china=1;
if china_politics in (1,2) then china_politics=1;
if confid_xi in (1,2) then confid_xi=1;

if fav_china in (3,4) then fav_china=0;
if intl_system=2 then intl_system=0;
if growinflu_china=2 then growinflu_china=0;
if relations_china in (3,4) then relations_china=0;
if china_politics in (3,4) then china_politics=0;
if confid_xi in (3,4) then confid_xi=0;
run;

proc logistic data=library.Singapore descending;
class relations_china growinflu_china /
param=glm;
model relations_china =
growinflu_china
fav_china
intl_system
confid_xi
china_politics; 
run;

* Reduced Model; 
proc logistic data=library.Singapore;
class relations_china growinflu_china /
param=glm;
model relations_china=confid_xi growinflu_china; run;
