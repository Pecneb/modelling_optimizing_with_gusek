set factory;
set store;

param distance { factory, store } integer >= 0; # km
param output_capacity { factory } integer >= 0; # l
param input_capacity { store } integer >= 0; # l

param biker_cost; # cost / kg * km
param biker_capacity; # kg
param biker_weight; # kg

var deliveries { factory, store } integer >= 0;

s.t. deliverAllProduct { f in factory }: 
	sum { s in store } deliveries [ f, s ], <= output_capacity [ f ];

s.t. setBikerCapacity { s in store } :
	sum { f in factory } deliveries [ f, s ] , >= input_capacity [ s ];

minimize overall_cost:
	( sum { f in factory, s in store } ( deliveries [ f, s ] + biker_weight ) * distance [ f, s] * biker_cost * (distance [ f, s ] div biker_capacity ) ) + 
	( sum { f in factory, s in store } biker_weight * distance [ f, s] * biker_cost * ( distance [ f, s ] div biker_capacity ) );

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

param biker_cost := 10; # ft / km
param biker_capacity := 20; # kg
param biker_weight := 100; # kg