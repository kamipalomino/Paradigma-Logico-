
%## Subtes

%Tenemos un modelo de la red de subtes, por medio de un predicado linea que relaciona el nombre de la linea con la lista de sus estaciones, en orden
% *No hay dos estaciones con el mismo nombre.* 

%-- nth1(X,[a,b,c,d,e],d).
%-- nth1(4,[a,b,c,d,e],X).
%-- nth1(Orden,[a,b,c,d,e],Elem).
%-- nth1(X,[a,b,c,d,e],j).
%-- nth1(22,[a,b,c,d,e],X).

%linea(Linea, Estaciones)
linea(a,[plazaMayo,peru,lima,congreso,miserere,rioJaneiro,primeraJunta,nazca]).
linea(b,[alem,pellegrini,callao,pueyrredonB,gardel,medrano,malabia,lacroze,losIncas,urquiza]).
linea(c,[retiro,diagNorte,avMayo,independenciaC,plazaC]).
linea(d,[catedral,nueveJulio,medicina,pueyrredonD,plazaItalia,carranza,congresoTucuman]).
linea(e,[bolivar,independenciaE,pichincha,jujuy,boedo,varela,virreyes]).
linea(h,[lasHeras,santaFe,corrientes,once,venezuela,humberto1ro,inclan,caseros]).

combinacion([lima, avMayo]).
combinacion([once, miserere]).
combinacion([pellegrini, diagNorte, nueveJulio]).
combinacion([independenciaC, independenciaE]).
combinacion([jujuy, humberto1ro]).
combinacion([santaFe, pueyrredonD]).
combinacion([corrientes, pueyrredonB]).

lineas(L) :- linea(L, _).
estaciones(E) :- linea(_, E).
% 1. En qué linea está una estación, predicado **estaEn/2 **.
:- begin_tests(estaEn).
test(plaza_de_mayo_en_A, nondet) :-  
    estaEn(L, plazaMayo),
    assertion( L == a).
:- end_tests(estaEn).

estaEn(Linea, Estacion) :-
    lineas(Linea), 
    estaciones(Estaciones),
    linea(Linea, Estaciones),
    member(Estacion, Estaciones).

%2. dadas dos estaciones de la misma línea, cuántas estaciones hay entre ellas, *p.ej. .* Predicado **distancia/3 (relaciona las dos estaciones y la distancia).
:- begin_tests(distancia).
test("entre Perú y Primera Junta hay 5 estaciones", nondet) :-  
    distancia(peru, primeraJunta, L),
    assertion( L == 5).
:- end_tests(distancia).

distancia(L1, L2, Distancia) :-
    linea(_, Estaciones),
    nth1(D1, Estaciones, L1),
    nth1(D2, Estaciones, L2),
    Distancia is abs(D1 - D2).
    
% 3. Dadas dos estaciones de distintas líneas, si están a la misma altura (o sea, las dos terceras, las dos quintas, etc.),  Predicado mismaAltura/2
:- begin_tests(mismaAltura).
test("Independencia C y Jujuy que están las dos cuartas", nondet) :-  
    mismaAltura(independenciaC, jujuy).
  %  assertion( I == independenciaC).
:- end_tests(mismaAltura).

mismaAltura(E1, E2) :-
    linea(Linea1, Estaciones1),
    linea(Linea, Estaciones),
    Linea \= Linea1,
    nth1(D1, Estaciones1, E1),
    nth1(D2, Estaciones, E2),
    D1 == D2.
    
    
% 4. Dadas dos estaciones, si puedo llegar fácil de una a la otra, esto es, si están en la misma línea, o bien puedo llegar con una sola combinación.  Predicado **viajeFacil/2**. 
 
:- begin_tests(viajeFacil).
test("están en la misma línea", nondet) :-  viajeFacil(independenciaC, plazaC).
test("puedo llegar con una sola combinación", nondet) :- viajeFacil(independenciaC, independenciaE).
:- end_tests(viajeFacil).

viajeFacil(E1, E2) :-
    lineas(Linea1),
    lineas(Linea),
    estaEn(Linea1, E1),
    estaEn(Linea, E2),
    Linea == Linea1.
    
viajeFacil(E1, E2) :-
    combinacion(Estaciones),
    member(E1, Estaciones),
    member(E2, Estaciones),
    E1 \= E2.