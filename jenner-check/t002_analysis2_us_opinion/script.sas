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


* Q21: Regardless of what you think about the United States
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
