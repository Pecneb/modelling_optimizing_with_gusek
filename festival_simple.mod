var F1 binary;
var F2 binary;
var F3 binary;
var F4 binary;
var F5 binary;
/* Festivals */

s.t. B1: F1 + F3 + F4 >= 1;

s.t. B2: F1 + F2 + F3 + F5 >= 1;

s.t. B3: F1 + F2 + F4 + F5 >= 1;

s.t. B4: F3 + F5 >= 1;

s.t. B5: F4 >= 1;

s.t. B6: F2 + F3 + F4 + F5 >= 1;

s.t. B7: F3 + F5 >= 1;

minimize cost: F1 + F2 + F3 + F4 + F5;
/* Minimize the count of tickets */