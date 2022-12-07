#Minimizing the cost from Home to Barcelona

param TotalDistance; 
param Consumption; 
param Capacity;
param Departurefuel;
param Reserve; 

param stations;
set Towns:=1..stations;
param Town{Towns} symbolic;
param Distance{Towns}; 			# km
param Price{Towns}; 			# EUR / l

var fill{Towns} >= 0;
var Arrival{Towns} >= Reserve / 100 * Consumption;		# 0.5l

s.t. SetFirstArrival{t in Towns: t==1}:
      Arrival[t] =  Departurefuel - Distance[t]/100*Consumption;

s.t. SetArrival{t in Towns: t!=1}:
      Arrival[t] =  Arrival[t-1] + fill[t-1] - (Distance[t]-Distance[t-1])/100*Consumption;

s.t. Maxfill{t in Towns}:
  Arrival[t] + fill[t] <= Capacity;

s.t. GettoBarcelona:
  (Departurefuel + sum {t in Towns} fill[t]) * (100 / Consumption) >= TotalDistance;

minimize Cost: sum{t in Towns} fill[t]*Price[t];

solve;

printf "Minimum total cost: %g\n\n",Cost;

for{t in Towns}
{
  printf "%2s %10s (%5g km, %3g EUR/l): %5.2f + %5.2f ---> %5.2f l %5.2f\n",t,Town[t],Distance[t],Price[t],
  Arrival[t], fill[t], Arrival[t] + fill[t], fill[t]*Price[t]
  ; 
}

data;
param TotalDistance := 2070;

param Consumption := 2.5;		# l / 100 km 

param Capacity := 10;			#l

param Departurefuel := 10;		#l

param Reserve := 20;			#km

param stations := 15;

						#km                EUR/l   
param:    Town    		Distance  	Price:=
1        Sopron         169         1.84
2		  Graz			355			1.74
3		Villach			529			1.79
4		Udine			653			1.66
5		Padova			812			1.68
6		Verona			900			1.79
7		Piacenza		1049			1.78
8		Genova			1200		1.83
9		SanRemo			1347		1.69
10		Nizza			1402		1.74
11		Brignoles		1525		1.68
12		Arles			1650		1.65
13		Montpelier		1723		1.73
14		Girona			1972		1.59
15		Barcelona		2070		1.61;