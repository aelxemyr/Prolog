trans(eins,one).
trans(zwei,two).
trans(drei,three).
trans(vier,four).
trans(fuenf,five).
trans(sechs,six).
trans(sieben,seven).
trans(acht,eight).
trans(neun,nine).

listtran([],[]).
listtran([X|T1],[Y|T2]) :-
	trans(X,Y),
	listtran(T1,T2).
