% estaEn(Peli, Per)
estaEn(buscandoNemo, nemo).
estaEn(buscandoNemo, dory).
estaEn(quienEnganio, roger).
estaEn(quienEnganio, doom).
estaEn(quienEnganio, eddie).
estaEn(naufrago, chuck).

% esAnimado(Per)
esAnimado(nemo).
esAnimado(dory).
esAnimado(doom).
esAnimado(roger).

aptaParaAmargos(Peli):-
    findall(Pers, (estaEn(Peli,Pers), esAnimado(Pers)), Bag),
    length(Bag, C), C = 0.

seDivierte(Pers):-
    findall(A,
        (estaEn(Peli1,Pers),
        estaEn(Peli2,A),
        Peli1 = Peli2 , 
        esAnimado(A)), Bag),
    length(Bag, C), C >= 1.

%1. b)
% aptaParaAmargos(naufrago) -> True
% aptaParaAmargos(buscandoNemo) -> False
% seDivierte(eddie) -> True
% seDivierte(chuck) -> False

%1. c)
% aptaParaAmargos(Peli) -> False
% seDivierte(Personaje) -> True
    
%3 
paraAmargos(Peli):-
    estaEn(Peli, _),
    forall(estaEn(Peli,Pers), not(esAnimado(Pers))).

divierte(Pers):-
    estaEn(_, Pers), esAnimado(A),
    findall(A,(estaEn(Peli,Pers), estaEn(Peli,A)), Bag),
    length(Bag, C), C >= 1.