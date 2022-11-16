set sandwitch;
set ingredients;

param ratio { sandwitch, ingredients } integer >= 0;
param ingredient_limit { ingredients } integer >= 0;

var make_n { sandwitch } integer >= 0;

s.t. setIngredientLimits { i in ingredients }: sum { s in sandwitch } ratio [ s, i ] * make_n [ s ], <= ingredient_limit [ i ];

maximize sandwitch_made: sum { s in sandwitch } make_n [ s ];

solve;
data;

set sandwitch := salami_sandwitch steak_sandwitch;
set ingredients := butter egg salami steak;

param ratio: 			butter egg salami steak :=
salami_sandwitch	3			3		2			0
steak_sandwitch	4			2		0			1;

param ingredient_limit :=
butter	220
egg		170
salami	100
steak	40;