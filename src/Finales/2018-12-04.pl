% acuerdo(P1, P2, Algo).

acuerdo(argentina, china, trigo).
acuerdo(argentina, rusia, trigo).
acuerdo(eeuu, argentina, carne).
acuerdo(china, rusia, arroz).
acuerdo(argentina, francia, carne).
acuerdo(argentina, brasil, carne).
acuerdo(francia, arabia, carne).
acuerdo(brasil, zimbague, carne).
acuerdo(arabia, chile, carne).

recibe(Pais, Pais2):- 
    acuerdo(Pais,_, M),
    acuerdo(_,Pais2,M), 
    acuerdo(_,_, M).

% not(acuerdo(eeuu,china,armas)).

 