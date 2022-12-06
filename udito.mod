set factory;
set store;


param capacity { i in factory } integer >= 0; # l
param demand { j in store } integer >= 0; # l

param distance { i in factory, j in store } integer >= 0; # km

param fuel_cost; # cost / km

var delivers { i in factory, j in store } >= 0;

s.t. setSupply { i in factory }: sum { j in store } delivers [ i, j ], <= capacity [ i ];

s.t. setDemand { j in store }: sum { i in factory } delivers [ i, j ], >= demand [ j ];

minimize overall_cost: (sum { i in factory, j in store } delivers [ i, j ] * distance [ i, j ] * fuel_cost) + ( sum { i in factory, j in store } ( delivers [ i, j ] - ( delivers [ i, j ] - 1 ) ) * distance [ i, j ] * fuel_cost );

solve;
data;

set factory := Toltestava Komarom Dunaszerdahely;
set store := Seregelyes Gyor Asvanyraro Szolnok;

param distance : Seregelyes Gyor Asvanyraro Szolnok :=
Toltestava				80				10		35				190
Komarom 				70				35		50				150
Dunaszerdahely	120				55		80				200;

param capacity :=
Toltestava				100
Komarom 				400
Dunaszerdahely	250;

param demand :=
Seregelyes 	100
Gyor 				350
Asvanyraro 	50
Szolnok			250;

param fuel_cost := 10; # ft / km