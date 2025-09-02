/* distintos paises */
%paisContinente(P, C).
pais(P) :- paisContinente(P,_).
paisContinente(argentina, americaDelSur).
paisContinente(bolivia, americaDelSur).
paisContinente(brasil, americaDelSur).
paisContinente(chile, americaDelSur).
paisContinente(ecuador, americaDelSur).
paisContinente(alemania, europa).
paisContinente(españa, europa).
paisContinente(francia, europa).
paisContinente(inglaterra, europa).
paisContinente(aral, asia).
paisContinente(china, asia).
paisContinente(gobi, asia).
paisContinente(india, asia).
paisContinente(iran, asia).

/*países importantes*/
paisImportante(argentina).
paisImportante(kamchatka).
paisImportante(alemania).

/*países limítrofes*/
limitrofes([argentina,brasil]).
limitrofes([bolivia,brasil]).
limitrofes([bolivia,argentina]).
limitrofes([argentina,chile]).
limitrofes([españa,francia]).
limitrofes([alemania,francia]).
limitrofes([nepal,india]).
limitrofes([china,india]).
limitrofes([nepal,china]).
limitrofes([afganistan,china]).
limitrofes([iran,afganistan]).

/*distribución en el tablero */
%ocupa(P, Jugador, E)
ocupa(argentina, azul, 4).
ocupa(bolivia, rojo, 1).
ocupa(brasil, verde, 4).
ocupa(chile, negro, 3).
ocupa(ecuador, rojo, 2).
ocupa(alemania, azul, 3).
ocupa(españa, azul, 1).
ocupa(francia, azul, 1).
ocupa(inglaterra, azul, 2). 
ocupa(aral, negro, 2).
ocupa(china, verde, 1).
ocupa(gobi, verde, 2).
ocupa(india, rojo, 3).
ocupa(iran, verde, 1).
ocupa(kamchatka, azul, 3).

/*continentes*/
continente(americaDelSur).
continente(europa).
continente(asia).

/*objetivos*/
objetivo(rojo, ocuparContinente(asia)).
objetivo(azul, ocuparPaises([argentina, bolivia, francia, inglaterra, china])).
objetivo(verde, destruirJugador(rojo)).
objetivo(negro, ocuparContinente(europa)).

jugador(Jugador) :- objetivo(Jugador,_).

% estaEnContinente/2: Relaciona un jugador y un continente si el jugador ocupa al menos un país en el continente.
:- begin_tests(estaEnContinente).
test("el jugador ocupa al menos un país en el continente", nondet) :-  estaEnContinente(rojo, asia).
:- end_tests(estaEnContinente).

estaEnContinente(Jugador, Continente) :-
    jugador(Jugador),
    ocupa(P, Jugador, _),
    paisContinente(P, Continente).


% cantidadPaises/2: Relaciona a un jugador con la cantidad de países que ocupa.

:- begin_tests(cantidadPaises).
test(" jugador con la cantidad de países que ocupa", nondet) :-  cantidadPaises(verde, 4).
:- end_tests(cantidadPaises).

cantidadPaises(Jugador, Cant) :-
    jugador(Jugador),
    forall((ocupa(P, Jugador, _), pais(P)), sum_list([P],Cant)).
    

% ocupaContinente/2: Relaciona un jugador y un continente si el jugador ocupa totalmente al continente.
:- begin_tests(ocupaContinente).
test("el jugador ocupa totalmente al continente", nondet) :-  ocupaContinente(azul, europa).
:- end_tests(ocupaContinente).

ocupaContinente(Jugador, C) :-
    jugador(Jugador),
    continente(C),
    forall(paisContinente(P, C), ocupa(P, Jugador, _)).

% leFaltaMucho/2: Relaciona a un jugador y un continente si al jugador le falta ocupar más de 2 países de dicho continente.
:- begin_tests(leFaltaMucho).
test("el jugador le falta ocupar más de 2 países de dicho continente.", nondet) :-  leFaltaMucho(verde, europa).
:- end_tests(leFaltaMucho).

leFaltaMucho(Jugador, Continente) :-
    jugador(Jugador),
    paisContinente(P, Continente),
    not(ocupa(P, Jugador, _)). 
% sonLimitrofes/2: Relaciona 2 países si son limítrofes.
:- begin_tests(sonLimitrofes).
test("2 países si son limítrofes", nondet) :-  sonLimitrofes(argentina, brasil).
test("2 países si son limítrofes", nondet) :-  sonLimitrofes(india, china).
:- end_tests(sonLimitrofes).

sonLimitrofes(P1,P2) :- limitrofes([P1,P2]).
sonLimitrofes(P1,P2) :- limitrofes([P2,P1]).

% esGroso/1: Un jugador es groso si cumple alguna de estas condiciones:
%ocupa todos los países importantes,
%ocupa más de 10 países
%o tiene más de 50 ejercitos.
:- begin_tests(esGroso).
test("ocupa todos los países importantes", nondet) :-  esGroso(azul).
test("ocupa más de 10 países", nondet) :-  esGroso(verde).
test("tiene más de 50 ejercitos", nondet) :-  esGroso(Jugador).
:- end_tests(esGroso).

esGroso(Jugador):- 
    jugador(Jugador),
    forall(paisImportante(P), ocupa(P,Jugador,_)).

esGroso(Jugador):-
    jugador(Jugador),
    forall(ocupa(P,Jugador,_), P),
    P >= 4. 

% estaEnElHorno/1: un país está en el horno si todos sus países limítrofes están ocupados por el mismo jugador que no es el mismo que ocupa ese país.
:- begin_tests(estaEnElHorno).
test("un país está en el horno si todos sus países limítrofes están ocupados por el mismo jugador que no es el mismo que ocupa ese país", nondet) :-  estaEnElHorno(P).
:- end_tests(estaEnElHorno).


% esCaotico/1: un continente es caótico si hay más de tres jugadores en él.
:- begin_tests(esCaotico).
test("si hay más de tres jugadores en él.", nondet) :-  esCaotico(C).
:- end_tests(esCaotico).


% capoCannoniere/1: es el jugador que tiene ocupado más países.
:- begin_tests(capoCannoniere).
test("el jugador que tiene ocupado más países", nondet) :-  capoCannoniere(Jugador).
:- end_tests(capoCannoniere).


% ganadooor/1: un jugador es ganador si logro su objetivo 
:- begin_tests(ganadooor).
test("el jugador logro su objetivo", nondet) :-  ganadooor(Jugador).
:- end_tests(ganadooor).
