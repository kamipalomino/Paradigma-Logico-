ingredients(panqueque, huevo).
ingredients(panqueque, harina).
ingredients(flan, huevo).
ingredients(flan, leche).
ingredients(churrasco, carne).

come(jony, panqueque).
come(jony, flan).
come(moro, panqueque).
come(moro, churrasco).
come(ivo, flan).

quisquillosa4(P):- come(P,_),
 forall(come(P, C), ingredients(C,I)).

quisquillosa1(P):- ingredients(_, I),
 forall(come(P, C), ingredients(C,I)).


quisquillosa2(P):- come(_,C),
 forall(come(P, C), ingredients(C,I)).

quisquillosa(P):- come(P,_),
    ingredients(_, I),
   not((come(P,C), not(ingredients(C,I)))).