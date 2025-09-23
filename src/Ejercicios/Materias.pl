% fecha(Materia, Fecha).

fecha(paradigma,5).
fecha(paradigma,15).
fecha(paradigma,19).
fecha(paradigma,25).

fecha(sisop,19).
fecha(sisop,27).
fecha(sisop,22).

fecha(fisica,17).

anotado(a, paradigma, 25).
anotado(b, paradigma, 25).
anotado(c, paradigma, 25).
anotado(a, sisop, 19).

seAnotaron(M, F) :-
    anotado(A, M,F), anotado(B, M,F), A \= B.
    
    
ultimaFecha(Materia, Fecha) :-
    fecha(Materia, Fecha),
    \+ ( fecha(Materia, OtraFecha),
         OtraFecha > Fecha ).


% ultimaFecha2(Materia, Fecha):-
  %  fecha(Materia, Dia),
   % fecha(Materia, Fecha), 
   % forall((fecha(Materia, Dia)), (Fecha \= Dia, Fecha > Dia)),
  %  ultimaFecha2(Materia, Fecha).
  
% ultimaFecha2(Materia, Fecha):- fecha(Materia, Fecha), Fecha == 31.

 ultima(Materia, Fecha):-
     fecha(Materia, _),
     findall(Dia, fecha(Materia, Dia), F),
     max_list(F, Fecha).
     
:- begin_tests(ultimaFecha).
    test("la última fecha de pdp es el 25", nondet) :-  ultimaFecha(paradigma,25).
    test("última fecha de sisop es 27", nondet) :- ultimaFecha(sisop, 27).
    test("última fecha de fisica es 17", nondet) :- 
        ultimaFecha(Materia, 17), assertion(Materia == fisica).
:- end_tests(ultimaFecha).

:- begin_tests(seAnotaron).
    test("lse anotaron todos el 25", nondet) :-  seAnotaron(paradigma,25).
:- end_tests(seAnotaron).