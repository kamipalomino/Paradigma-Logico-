% granjero(G,A)
granjero(beto, chancho(24)).
granjero(beto, chancho(120)).
granjero(beto, caballo(150,20)).
granjero(julieta, caballo(150,20)).

animal(A):- granjero(_,A).
caballo(E,R) :- granjero(_, caballo(E,R)).
chancho(K):- granjero(beto, chancho(K)).

alimentar(G,A):- 
    animal(A),
    granjero(G, caballo(E,R)),
    E = E *(1 + R/100).

alimentar(G,A):- 
    animal(A),
    granjero(G, chancho(K)),
    K =< 50,
    K = K + 3.
    
alimentar(G,A):- 
    animal(A),
    granjero(G, chancho(K)),
    K = K + 2.
    
alimentar2(G,A):- 
    granjero(G, A),
    alimentarCaballo(G, A).

alimentar2(G,A):- 
    granjero(G, A),
    alimentarChancho(G,A).
    
    
alimentarCaballo(G, A):-
    animal(A),
    granjero(G, caballo(E,R)),
    E is E *(1 + R/100).
   
alimentarChancho(G, A):-
    animal(A),
    granjero(G, chancho(K)),
    K =< 50,
    K is K + 3.
  
alimentarChancho(G, A):-
    animal(A),
    granjero(G, chancho(K)),
    K is K + 2.