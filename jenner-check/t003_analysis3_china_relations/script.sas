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
