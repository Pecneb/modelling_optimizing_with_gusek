var axa binary;
var axb binary;
var axd binary;
var bxc binary;
var bxd binary;
var dxe binary;
var dxg binary;
var cxe binary;
var cxf binary;
var fxg binary;
var exg binary;

s.t. A: axa = 1;
s.t. B: axb <= 1;
s.t. D: axd + bxd <= 1;
s.t. C: bxc <= 1;
s.t. E: dxe + cxe <= 1;
s.t. F: cxf <= 1;
s.t. G: dxg + exg + fxg = 1;

s.t. connect: axa + axb + axd + bxc + bxd + dxe + dxg + cxe + cxf + fxg + exg >= 3;

minimize road_cost: axb * 2 + axd * 4 + bxc * 4 + bxd * 3 + cxe * 4 + cxf * 5 + dxe * 3 + dxg * 4 + exg * 1 + fxg * 3;