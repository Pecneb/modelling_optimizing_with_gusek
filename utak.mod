var ata binary;
var atb binary;
var atd binary;
var btd binary;
var btc binary;
var cte binary;
var ctf binary;
var dte binary;
var dtg binary;
var etg binary;
var ftg binary;

s.t. AtA: ata = 1;
s.t. G: dtg + etg + ftg = 1;
s.t. A: atb + atd = ata;
s.t. B: btd + btc = atb;
s.t. C: cte + ctf = btc;
s.t. D: dte + dtg = atd + btd;
s.t. E: dte + etg = cte;
s.t. F: ftg = ctf;


minimize cost: atb * 2 + atd * 4 + btc * 4 + btd * 3 + cte * 4 + ctf * 5 + dte * 3 + dtg * 4 + ftg * 3;

solve;

end;