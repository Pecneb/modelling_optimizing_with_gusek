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

param nMilestones;
set milestones := 1..nMilestones;
param milestone { milestones } symbolic;

set goods;

param distances { milestones };
param nutrienttable { goods };
param costofgoods { goods };
param startwellness;
param maxwellness;
param deteriorationrate; # wellness / km

var tobuy { milestones, goods } >= 0 integer;
var wellnessatarrival { milestones } >= 0 integer;

s.t. setFirstArrival { m in milestones: m == 1 }:
     wellnessatarrival[m] = startwellness - deteriorationrate * distances[m];

s.t. setArrival { m in milestones: m!=1 }:
     wellnessatarrival[m] = ( wellnessatarrival[m-1] + ( sum { g in goods } tobuy[m-1, g] * nutrienttable[g] ) ) - ( ( distances[m] - distances[m-1] ) * deteriorationrate );

s.t. dontOverBuy { m in milestones }:
     wellnessatarrival[m] + ( sum { g in goods } tobuy[m, g] * nutrienttable[g] ) <= maxwellness;

s.t. toReachNext { m in milestones: m != nMilestones }:
     wellnessatarrival[m] + ( sum { g in goods } tobuy[m, g] * nutrienttable[g] ) >= deteriorationrate * ( distances[m+1] - distances[m] );

minimize cost: sum { m in milestones, g in goods } tobuy[m, g] * costofgoods[g];

solve;

printf "\nHere are the milestones\n";
for { i in milestones } {
     printf "%d %s %d \n", i, milestone[i], wellnessatarrival[i];
     printf "Goods bought:\n";
     for { j in goods } {
          printf "%s %d\n", j, tobuy[i, j];
     }
}
printf "\n";

data;

param nMilestones := 5;
set goods := water gatorade schokolade gel;

param startwellness := 15;
param maxwellness := 15;
param deteriorationrate := 1;

param : milestone distances :=
1            first            8
2            second     16
3            third          24
4            fourth        32
5            fifht           40;

param nutrienttable :=
water 1
gatorade 2
schokolade 4
gel 6;

param costofgoods := 
water 1
gatorade 2
schokolade 3
gel 4;

end;
