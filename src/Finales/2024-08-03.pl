% genero(Tema, Genero)
genero(el38, rock).
genero(muchoPorHacer, rock).
genero(sisters, reggae).
genero(tusOjos, reggae).
genero(bastara, reggae).

% toca(Tema, Banda)
toca(el38, divididos).
toca(bastara, losCafres).
toca(muchoPorHacer, riff).
toca(sisters, divididos).
toca(tusOjos, losCafres).
toca(bastara, losCafres).

% 1
rockera1(Banda):-
    findall(Tema, (toca(Tema, Banda),genero(Tema, Genero), Genero \= rock), Bag),
    length(Bag, 0).

% a) rockera(riff).  True
% b) rockera(divididos).    False
% c) rockera(42).   True
% d) rockera(Banda).    False

%3 Solucion
rockera(Banda):-
    toca(_, Banda),
    forall(toca(Tema,Banda), genero(Tema,rock)).
    

    