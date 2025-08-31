:- include (Saltos).

:- beging_tests(puntaje_en_salto)
    test(obtuvo_puntaje_en_salto, set(Persona = hernan)) :- obtuvo_puntaje_en_salto(Persona, 4).
%:- end_tests(puntaje_en_salto).

%:- include (Saltos).
:-beging_tests(descalificado)
    test("Un competidor está descalificado si hizo más de 5 saltos. Julio está descalificado", nondet, set(Persona = julio)) :-
        esta_descalificado(Persona).
:-end_tests(descalificado).

:-beging_tests(clasificado)
    test(competidor_clasificado, nondet, set(Persona = [julio, hernan, roque, ruben])) :- (Persona).
:-end_tests(clasificado).
       
% 3. Si un competidor clasifica a la final. , o si 