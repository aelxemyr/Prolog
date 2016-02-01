in(X,Y):- contains(X,Y).
in(X,Z):- contains(X,Y),
	contains(Y,Z).

contains(katarina,olga).
contains(olga,natasha).
contains(natasha,irina).
