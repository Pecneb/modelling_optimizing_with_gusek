set factory;
set store;

param distance { factory, store } integer >= 0; # km
param output_capacity { factory } integer >= 0; # l
param input_capacity { store } integer >= 0; # l

param fuel_cost; # cost / km

var delivers { factory, store } binary;

s.t. deliverAllProduct { f in factory }: sum { s in store } input_capacity [ s ] * delivers [ f, s ], = output_capacity [ f ];

minimize overall_cost: sum { f in factory, s in store } delivers [ f, s ] * distance [ f, s] * fuel_cost * 2;

solve;
data;

set factory := Toltestava Komarom Dunaszerdahely;
set store := Seregelyes Gyor Asvanyraro Szolnok;

param distance : Seregelyes Gyor Asvanyraro Szolnok :=
Toltestava				80				10		35				190
Komarom 				70				35		50				150
Dunaszerdahely	120				55		80				200;

param output_capacity :=
Toltestava				100
Komarom 				400
Dunaszerdahely	250;

param input_capacity :=
Seregelyes 	100
Gyor 				350
Asvanyraro 	50
Szolnok			250;

param fuel_cost := 10; # ft / km