% jugador(Jugador, Preferencias).
jugador(juan, [desarrolladora(nintendo), genero(plataforma)] ).
jugador(pedro, [desarrolladora(rock), genero(mundoabierto)] ).
jugador(maria, [anio(2015)]).


%videoJuego(Titulo, Desarrolladora, [Generos], Lanzamiento).
videoJuego(tetris, nintendo, [casual, tirador], 1989).
videoJuego(sims, rock, [plataforma], 2010).
videoJuego(candy, android, [casual], 2017).
videoJuego(teg, nintendo, [mundoabierto], 2017).
videoJuego(solitario, rock, [plataforma], 2017).

cumplePreferencia( Jugador, T):-
    jugador(Jugador, Preferencias),
    member(Preferencia, Preferencias),
    cumpleUnaPreferencia(Preferencia, T).
    
cumpleUnaPreferencia(desarrolladora(Desarrolladora), Titulo):-
    videoJuego(Titulo, Desarrolladora, _, _).

cumpleUnaPreferencia(genero(Genero), Titulo):-
    videoJuego(Titulo, _, [Generos], _),
    member(Genero, [Generos]).

cumpleUnaPreferencia(anio(A), Titulo) :-
    videoJuego(Titulo, _, _, Lanzamiento),
    Lanzamiento >= A.
    
preferidosDelComite(Titulos) :-
    videoJuego(Titulo, _, _, _),
    findall(Titulo, forall(jugador(J, _), cumplePreferencia(J, Titulo)), Titulos).