set BANDS;
set FESTIVALS;

param plays { BANDS , FESTIVALS } binary;
param festival_costs { FESTIVALS } integer >= 0;

var buy_ticket { FESTIVALS }, binary;

s.t. bands_atleast_once { b in BANDS }:
	sum { f in FESTIVALS } plays[ b, f ] * buy_ticket[ f ] >= 1;

minimize overall_cost: sum { f in FESTIVALS } buy_ticket [ f ] * festival_costs [ f ];

solve;
data;

set BANDS := HAGGARD STRATOVARIUS EPICA DALRIADA APOCALYPTICA LIVA ELUVEITIE;
set FESTIVALS := F1 F2 F3 F4 F5;

param plays: 		F1 F2 F3 F4 F5 :=
HAGGARD				 1  0   1   1   0
STRATOVARIUS	 1  1   1   0   1
EPICA						 1  1   0   1   1
DALRIADA				 0  0   1   0   1
APOCALYPTICA	 0  0   0   1   0
LIVA						 0  1   1   1   1
ELUVEITIE				 0  0   1   0   1;

param festival_costs :=
F1 260
F2 410
F3 510
F4 347
F5 290;