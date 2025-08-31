:- include (Ejercicios).

:-  beging_tests(obtuvo_puntaje_en_salto).

test("puntaje obtuvo Hernan en el salto 4 ", set(Persona = hernan)) :-
        obtuvo_puntaje_en_salto(Persona, 4 ).

:-  end_tests(obtuvo_puntaje_en_salto).
        