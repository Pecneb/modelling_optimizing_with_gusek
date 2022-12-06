var x12 binary;
var x13 binary;
var x23 binary;
var x25 binary;
var x24 binary;
var x34 binary;
var x46 binary;
var x54 binary;
var x56 binary;

s.t. start: x12 + x13 = 1;
s.t. x2: x12 = x25 + x23 + x24;
s.t. x3: x13 = x34;
s.t. x4: x24 + x34 + x54 = x46;
s.t. x5: x25 = x54 + x56;
s.t. x6: x56 + x46 = 1;

maximize cost: x12*1 + x13*2 + x23*2 + x24*3 + x25*1 + x34*2 + x46*2 + x54*4 + x56*3;