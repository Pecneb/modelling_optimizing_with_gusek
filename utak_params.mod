# best way to G
set nodes;

param connection_matrix { nodes, nodes };
param connection_values { nodes, nodes };

var road_to_fest { nodes } binary;

s.t. isPath { n in nodes }: { n_2 in nodes } 

s.t. onlyOnePath { n in nodes }: sum { n_2 in nodes } road_to_fest [ n, n_2 ], = 1;

minimize roadcost: sum { n in nodes } ( sum { n_2 in nodes } road_to_fest [ n, n_2 ] * connection_values [ n, n_2 ] );

s.t. check

solve;
data;

set nodes := A B C D E F G;

param connection_matrix :	A	B	C	D	E	F	G :=
A											0	1	0	1	0	0	0
B											0	0	1	1	0	0	0
C											0	0	0	0	1	1	0
D											0	0	0	0	1	0	1
E											0	0	0	0	0	0	1
F											0	0	0	0	0	0	1
G											0	0	0	0	0	0	0;

param connection_values :	A	B	C	D	E	F	G :=
A											0	2	0	4	0	0	0
B											0	0	4	3	0	0	0
C											0	0	0	0	4	5	0
D											0	0	0	0	3	0	4
E											0	0	0	0	0	0	1
F											0	0	0	0	0	0	3
G											0	0	0	0	0	0	0;