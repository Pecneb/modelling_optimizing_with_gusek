var ab binary;
var ad binary;
var ac binary;
var bf binary;
var bc binary;
var be binary;
var ce binary;
var df binary;
var ed binary;

s.t. start: ab + ad + ac = 1;
s.t. B: ab = bc + be + bf;
s.t. C: ac + bc = ce;
s.t. D: ad + ed = df;
s.t. E: be + ce = ed;
s.t. F: bf + df = 1;

minimize cost: ab*(4+3) + ac*5 + ad*3 + bc*2 + be*(4-2) + ce*(6-2) + bf*7 + df*2 + ed*10;