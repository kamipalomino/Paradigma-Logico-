subioA(prudencio, montania(hulk)).
subioA(prudencio, autosChocadores).
subioA(herme, montania(rockit)).
subioA(herme, simulador(minios)).
subioA(rigo, simulador(ikran)).
subioA(brunilda, simulador(simpson)).
subioA(herme, autosChocadores).

disfruto(prudencio, montania(hulk)).
disfruto(prudencio, autosChocadores).
disfruto(herme, simulador(minios)).
disfruto(rigo, simulador(ikran)).

foo(Persona) :- 
    forall(subioA(Persona, Atraccion), disfruto(Persona, Atraccion) ).

% 1 True -> prudencio, rico
% 2 
personaQueDisfrutoLasAtracciones(Persona):- 
    subioA(Persona, _),
    forall(subioA(Persona, Atraccion), disfruto(Persona, Atraccion) ).

% 3
esValiente(Persona):- subioA(Persona, montania(_)).
    