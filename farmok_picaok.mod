set farmok;
/* Farms */

set piacok;
/* Markets */

param termeles { i in farmok };
/* capacity of farms i in cases */

param befogadas { j in piacok };
/* demand at market j in cases */

param tavolsagok { i in farmok, j in piacok };
/* distance in km */

param ktg; # ft / kg * km
/* transport cost per kg per km */

var szallitasok { i in farmok, j in piacok } >= 0;
/* shipment quantities in cases */

s.t. supply { i in farmok }: sum { j in piacok } szallitasok [ i, j ], <= termeles [ i ];

s.t. demand { j in piacok }: sum { i in farmok } szallitasok [ i, j ], >= befogadas [ j ];

minimize koltseg: ktg * sum { i in farmok, j in piacok } szallitasok [ i, j ] * tavolsagok [ i, j ];

data;
param termeles:=
Vac	150
Kecskemet		150
Sopron	100
;
param befogadas:=
Gyor		250
Szolnok		150
;
param tavolsagok:
			Gyor	Szolnok:=
Vac			80		160
Kecskemet	40		190
Sopron		120		40
;
set farmok:= Vac Kecskemet Sopron;
set piacok:= Gyor Szolnok;

param ktg:=10;