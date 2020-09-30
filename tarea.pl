notas():-
 write('Ingrese una nota '),  read(Nota), nl,
 write('Ingrese el porcentaje equivalente en decimales de la nota ingresada'),  read(Porcentaje), nl,
 asserta((nota(Nota,Porcentaje))),write('¿Desea incluir otra nota? (si/no)'),
 read(Respuesta),nl, ((Respuesta==si)->notas();true).

def([],0).
def([X|Y],R):- def(Y,R1),R is R1 + X.
notas(L) :- findall(X*Y,(nota(X,Y)),L).

promedio(Total) :- notas(L1),def(L1,Total).
valCualitativo(X,Y):-
	X < 2 -> Y = canceleLaMaestria;
	X < 3.5 -> Y = teVanAEchar;
	X < 4.5 -> Y = buenaNota;
	true -> Y = vasExcelente.

iniciar :- (notas()),
      promedio(Prom),
      valCualitativo(Prom,Y),
      write(Y),nl,
      write(Prom).








