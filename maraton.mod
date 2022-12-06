/*
Maraton:
     Milestones:
          10km, 20km, 30km, 40km 
     Hydration and Nutrient rate:
          Water 1 ( 1$ )
          Gatorade 2 ( 2$ )
          Schokolade 4 ( 3$ )
          Gel 6 ( 4$ )
     Runner:
          StartWellness 15
     Wellness deterioration rate:
          1 Wellness/km
     Goal:
          Minimize cost of goods
*/

set milestones;
set goods;

param distances { mielstones };
param nutrienttable { goods };
param costofgoods { goods };
param startwellness;
param maxwellness;
param deteriorationrate; # wellness / km

var tobuy { milestones, goods } integer;
var wellnessatarrival { milestones };

s.t. setFirstArrival { m in milestones: m == 1 }:
     wellnessatarrival[m] = startwellness - deteriorationrate * distance[m];

s.t. setArrival { m in milestones: m != 1 }:
     wellnessatarrival[m] = ( wellnessatarrival[m-1] + ( sum { g in goods } tobuy[m-1, g] ) ) - ( distances[m] - distances[m-1] ) * deteriorationrate;

s.t. dontOverBuy { m in milestones }:
     wellnessatarrival[m] + ( sum { g in goods } tobuy[m, g] * nutrienttable[g] ) <= maxwellness;

s.t. 