set farmok;
set piacok;

param tavolsagok { farmok, piacok };
param termeles { farmok };
param befogadas { piacok };

var szallitasok { farmok, piacok } >= 0 integer;

param ktg;

s.t. maxKiad { f in farmok }: sum { p in piacok } szallitasok [ f, p ], <= termeles [ f ];
s.t. maxFogad { p in piacok }: sum { f in farmok } szallitasok [ f, p ], >= befogadas [ p ];

minimize megtettut: ktg * sum { f in farmok, p in piacok } szallitasok [ f, p ] * tavolsagok [ f, p ];

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