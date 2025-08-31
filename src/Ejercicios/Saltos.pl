%Saltos%

%En una competencia de saltos, cada competidor puede hacer hasta 5 saltos; a cada salto se le asigna un puntaje de 0 a 10. Se define el predicado puntajes que relaciona cada competidor con los puntajes de sus saltos, p.ej.
persona(Persona) :- puntajes(Persona, _).
saltos(Persona) :- puntajes( _ , Persona).

%puntajes(persona(Persona), [Puntaje]). 

puntajes(hernan,[3,5,8,6,9]).

puntajes(julio,[9,7,3,9,10,2]).

puntajes(ruben,[3,5,3,8,3]).

puntajes(roque,[7,10,10]).

% 1. Qué puntaje obtuvo un competidor en un salto, p.ej. qué puntaje obtuvo Hernan en el salto 4 (respuesta: 6).

:- begin_tests(obtuvo_puntaje_en_salto).
test(puntaje_en_salto, nondet) :-  
    obtuvo_puntaje_en_salto(hernan, Puntaje, 4),
    assertion( Puntaje == 6).
:- end_tests(obtuvo_puntaje_en_salto).

obtuvo_puntaje_en_salto(Persona, Salto, Number) :-
    persona(Persona),
    puntajes(Persona, Saltos),
    saltos(Saltos),
    nth1(Number, Saltos, Salto).
    
    
% 2. Si un competidor está descalificado o no. Un competidor está descalificado si hizo más de 5 saltos. En el ejemplo, Julio está descalificado.

:- begin_tests(esta_descalificado).
test("Un competidor está descalificado si hizo más de 5 saltos. Julio está descalificado",nondet) :-
        esta_descalificado(Persona),
        assertion(Persona == julio).
:- end_tests(esta_descalificado).

esta_descalificado(Persona) :-
    puntajes(Persona, Saltos),
    length(Saltos, Cantidad),
    Cantidad > 5.
    
    
%3. Si un competidor clasifica a la final. Un competidor clasifica a la final si la suma de sus puntajes es mayor o ual a 28, o si tiene dos saltos de 8 o más puntos.


:- begin_tests(competidor_clasificado).
test(hernanClasificado, nondet) :- 
        competidor_clasificado(Persona), Persona == hernan.
test(rubenClasificado, nondet) :- 
        competidor_clasificado(Persona), Persona == ruben.
test(roque_competidor_clasificado, nondet) :-
        competidor_clasificado(Persona), Persona == roque.
:- end_tests(competidor_clasificado).
       

competidor_clasificado(Persona) :-
    persona(Persona),
    puntajes(Persona, Saltos),
    sum_list(Saltos, Total),
    not(esta_descalificado(Persona)),
    Total >= 28.
    
    
competidor_clasificado(Persona) :-
    persona(Persona),
    not(esta_descalificado(Persona)),
    puntajes(Persona, Saltos),
    findall(No >= 8, (member(No, Saltos)), Cant),
    length(Cant, Total), 
    Total >= 2 .

