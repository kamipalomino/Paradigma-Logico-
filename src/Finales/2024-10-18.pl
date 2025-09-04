compro(martina, lata(atun, 100, nereida)).
compro(martina, lacteo(sancor, leche)).
compro(aye, lacteo(sancor, leche)).

cliente(Cliente):- compro(Cliente, _).

precio(lata(atun, 100, nereida), 70).
precio(lata(atun, 200, nereida), 120).
precio(lacteo(sancor, leche), 22).
precio(lacteo(laSere, leche),15).

% 1 comproMarca/2
comproMarca(Cliente, Marca):- compro(Cliente,lata(_, _, Marca)).
comproMarca(Cliente, Marca):- compro(Cliente,lacteo(Marca, _)).

% 2.a
marcaPopu1(Marca):- forall(cliente(C), comproMarca(C,Marca)).
% 2.b
marcaPopu2(Marca):- cliente(C), forall(cliente(C), comproMarca(C,Marca)).

popu(Marca):- 
    comproMarca(_,Marca),
    forall(cliente(C), comproMarca(C,Marca)).