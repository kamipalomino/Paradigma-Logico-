%Saltos%
%En una competencia de saltos, cada competidor puede hacer hasta 5 saltos; a cada salto se le asigna un puntaje de 0 a 10. Se define el predicado puntajes que relaciona cada competidor con los puntajes de sus saltos, p.ej.
persona(Persona) :- puntajes(Persona, _).


%puntajes(persona(Persona), [Puntaje]). 
puntajes(hernan,[3,5,8,6,9]).

puntajes(julio,[9,7,3,9,10,2]).

puntajes(ruben,[3,5,3,8,3]).

puntajes(roque,[7,10,10]).


%Se pide armar un programa Prolog que a partir de esta información permita consultar:
%
% 1. Qué puntaje obtuvo un competidor en un salto, p.ej. qué puntaje obtuvo Hernan en el salto 4 (respuesta: 6).
obtuvo_puntaje_en_salto(Persona, Salto) :-
    persona(Persona),
    puntajes(Persona, Saltos),
    nth1(Salto, Saltos, Persona).
    
    
% 2. Si un competidor está descalificado o no. Un competidor está descalificado si hizo más de 5 saltos. En el ejemplo, Julio está descalificado.
esta_descalificado(Persona) :-
    puntajes(Persona, Saltos),
    length(Saltos, Cantidad),
    Cantidad > 5.
%3. Si un competidor clasifica a la final. Un competidor clasifica a la final si la suma de sus puntajes es mayor o ual a 28, o si tiene dos saltos de 8 o más puntos.
competidor_clasificado(Persona) :-
    persona(puntajes(Persona, _)),
    puntajes(Persona, Saltos),
    sum_list(Saltos, Total),
    Total > 28 .
    
competidor_clasificado(Persona) :-
    persona(puntajes(Persona, _)),
    puntajes(Persona, Saltos),
    findall(No >= 8, (member(No, Saltos)), Cant),
    length(Cant, Total), 
    Total > 2 .

