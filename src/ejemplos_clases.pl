%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lechuzas mafiosas                                                                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% lechuza(NombreLechuza, Sospechosidad, Nobleza).
lechuza(swi, 10, 60).
lechuza(duo, 25, 55).
lechuza(blathers, 60, 20).
lechuza(hedwig, 30, 80 ).


% 1. ¿Qué tan violenta es una lechuza? Se calcula como 5 * sospechosidad + 42 / nobleza.

nivelDeViolencia(N, Violencia) :-
    lechuza(N, Sos, Noble),
    Violencia is 5 * Sos + 42 /Noble.

% 2. Si una lechuza es vengativa. Lo es si su violencia es mayor a 100.

esVengativa(L) :-
    nivelDeViolencia(L, V),
    V > 100.
   
% 3. Si una lechuza es mafiosa, que se cumple si no es buena gente o su sospechosidad es al menos 75. 
% Decimos que es buena gente si no es vengativa y su nobleza es mayor a 50.

buenaGente(L) :-
    lechuza(L, _, N),
    not(esVengativa(L)),
    N > 50.

esMafiosa(L) :-
    lechuza(L, S, _),
    S >= 75.
    
esMafiosa(L) :- lechuza(L, _, _), not(buenaGente(L)).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    