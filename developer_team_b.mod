set developers;
set skills;

param relationship_matrix { developers, developers }; # binary matrix, if 0 they dont love to work with each other, if 1 they like to work with each other
param developer_skillset { developers, skills };

var most_efficient_team { developers } binary;

s.t. setMinTeamSizeLimits: 
	sum { p in developers } most_efficient_team [ p ], >= 3;

s.t. setMaxTeamSizeLimits: 
	sum { p in developers } most_efficient_team [ p ], <= 4;

s.t. setTeamSkillRequireMents { s in skills }: 
	sum { p in developers } developer_skillset [ p, s ] * most_efficient_team [ p ], >= 1;

maximize happiness: sum { p in developers } ( most_efficient_team [ p ] * ( sum { p_2 in developers } relationship_matrix [ p, p_2 ] ) );

solve;
data;

set developers := Tibor David Botond Bence Mark Balazs;
set skills := Backend Frontend CSS DB Agile DevOps;

param relationship_matrix : Tibor David Botond Bence Mark Balazs :=
Tibor										1		 0			0			  1		  1		1
David										0		 1			1			  1		  1		1
Botond									0		 1			1			  1		  1		0
Bence										1		 1			1			  1		  0		1
Mark										1		 1			1			  0		  1		1
Balazs									1		 1			0			  1		  0		1;

param developer_skillset : Backend Frontend CSS DB Agile DevOps :=
Tibor										1				0				1		 0		0		 0
David										0				1				1		 0		0		 0
Botond									0				0				0		 1		1		 0
Bence										1				0				1		 1		0		 1
Mark										0				1				0		 0		1		 0
Balazs									0				0				0		 1		0		 1;