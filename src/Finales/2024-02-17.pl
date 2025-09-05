% tiene(P, C).
tiene(pedro, casa).
tiene(juan, cama).
tiene(mari, capa).

% vale(C, V).
vale(casa, 10000).
vale(cama, 1000).
vale(capa, 100).
vale(cala, 100000).

% todoLoQueTieneEsMasValioso(P1, P2)
todoLoQueTieneEsMasValioso(P1, P2):-
    tiene(P1, Cosa), tiene(P2, Otra),
    forall((vale(Cosa, CosaValiosa), vale(Otra, OtraCosa)), CosaValiosa > OtraCosa).

% distinct