% Bodegón 

plato(lasCanitas, mila, 280).
plato(lasCanitas, pan, 20).
plato(otro, mila, 380).
plato(otro, helado, 280).
plato(uno, mila, 100).
plato(uno, pan, 50).


bodegon(Resto):-
    plato(Resto, _, _),
    tieneMila(Resto),
    forall(plato(Resto, _, Precio), Precio < 300).
    
    
 tieneMila(Resto) :- plato(Resto, mila, _).