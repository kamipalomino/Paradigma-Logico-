toma(juan, coca).
toma(juan, fanta).
toma(juan, vino(me, 3)).
toma(daiana, vino(me, 3)).
toma(daiana, cerveza( i, 18, 9)).
toma(gisela, cerveza( g, 5, 0)).
toma(edu, cerveza( g, 5, 9)).

bebeAlcohol(Pe):- toma(Pe, vino(_, _)).
bebeAlcohol(Pe):- toma(Pe, cerveza( _, _, A)), A > 0. 

cantidadDeAlcohol(Persona, Can):-
    toma(Persona,  Bebida),
    findall(Bebida, (bebeAlcohol(Persona), toma(Persona, Bebida)), Bebidas),
    length(Bebidas, Can).


tieneProblemas(Persona) :-
    cantidadDeAlcohol(Persona, Can),
    findall(Otra, toma(Persona, Otra), Otras),
    length(Otras, Total),
    Can = Total.
    

tieneProblema(Pe) :-
    toma(Pe, _),
    findall(C, (toma(Pe, cerveza( C, _, A)), A > 0), Cs),
    findall(V, toma(Pe, vino( V,_)), Vs),
    findall(T, toma(Pe, T), Ts),
    length(Cs, CCs),
    length(Vs, CVs),
    length(Ts, TCs),
    TCs is CCs + CVs.
    
noTieneProblema(Persona):-
   % toma(Persona,  Bebida),
    forall(Bebida, (bebeAlcoho(Persona), toma(Persona,  Bebida) )).
    