set froccs;
set ingredients;

param ratio { froccs, ingredients } integer >= 0;
param price { froccs } integer >= 0;
param ingredient_limit { ingredients } integer >= 0;

var sells { froccs } integer >= 0;

s.t. wineLimit { i in ingredients }: sum { f in froccs } ratio [ f, i ] * sells [ f ], <= ingredient_limit [ i ];

maximize income: sum { f in froccs } sells [ f ] * price [ f ];

solve;
data;

set froccs := kf nf hl hm vhm krf sf pf hu lf;
set ingredients := wine water;

param ratio: wine water :=
kf						1		1
nf						2		1
hl						1		2
hm					3		2
vhm					2		3
krf					9		1
sf						1		9
pf						6		3
hu					4		1
lf						1		4;

param price :=
kf		200
nf		330
hl		210
hm	470
vhm	400
krf	1500
sf		300
pf		900
hu	600
lf		250;

param ingredient_limit :=
wine 1000
water 1500;