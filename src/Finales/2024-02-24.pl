% correlativa(C, M)
correlativa(discreta, sisop).
correlativa(algoritmo, sisop).
correlativa(matematica, discreta).

% aproboCursada(Alumno, Materia, Fecha).
aproboCursada(juan, algoritmo, 2020).
aproboCursada(juan, sisop, 2023).
aproboCursada(maria, sisop, 2023).
aproboCursada(pedro, sisop, 2024).

% aproboFinal(Alumno, Materia, Fecha).
aproboFinal(juan, algoritmo, 2020).
aproboFinal(maria, algoritmo, 2020).
aproboFinal(maria, discreta, 2021).

fecha(2024).
fecha(2025).
fecha(2026).
% aniosLectivosTrascurridos(FechaFirma, Fecha, Anios)
aniosLectivosTrascurridos(FechaFirma, Fecha, Anios):-
    Anios is Fecha - FechaFirma.

% puedeAnotarseAFinal(Alumno, Materia, Fecha)
puedeAnotarseAFinal1(Alumno, Materia, Fecha):-
    aproboCursada(Alumno, Materia, FechaFirma),
    not(aproboFinal(Alumno, Materia, _)),
    aniosLectivosTrascurridos(FechaFirma, Fecha, 0).

puedeAnotarseAFinal1(Alumno, Materia, _):-
    aproboCursada(Alumno, Materia, _),
    not(aproboFinal(Alumno, Materia, _)),
    correlativa(C, Materia),
    aproboFinal(Alumno, C, _). 

% 1. puedeAnotarseAFinal(juan, sisop, 2024) -> True ERROR

% 3.
preRequisito(Alumno, Materia, Fecha):-
    aproboCursada(Alumno, Materia, Fecha),
    not(aproboFinal(Alumno, Materia, _)).

puedeAnotarseAFinal(Alumno, Materia, Fecha):-
    preRequisito(Alumno, Materia, FechaFirma),
    fecha(Fecha),
    aniosLectivosTrascurridos(FechaFirma, Fecha, 0).

puedeAnotarseAFinal(Alumno, Materia, _):-
    preRequisito(Alumno, Materia, _),
    forall(correlativa(C, Materia), aproboFinal(Alumno,C,_)).
    
