var x12 binary;
var x13 binary;
var x14 binary;
var x24 binary;
var x26 binary;
var x27 binary;
var x35 binary;
var x45 binary;
var x58 binary;
var x65 binary;
var x68 binary;
var x76 binary;
var x79 binary;
var x89 binary;

s.t. start: x12 + x13 + x14= 1;
s.t. x2: x24 + x26 + x27 = x12;
s.t. x3: x35 = x13;
s.t. x4: x45 = x24 + x14;
s.t. x5: x58 = x35 + x45;
s.t. x6: x65 + x68 = x26 + x76;
s.t. x7: x79 + x76 = x27;
s.t. x8: x89 = x58 + x68;
s.t. x9: x79 + x89 = 1;

minimize cost: x12 * 2 + x13 * 1 + x14 * 2 + 
	x24 * 4 + x26 * 2 + x27 * 1 + x35 * 3 + x45 * 2 + 
	x58 * 2 + x65 * 3 + x68 * 1 + x76 * 2 + x79 * 4 + 
	x89 * 6;

solve;