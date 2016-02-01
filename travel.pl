byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

travel(X,Y) :- byCar(X,Y).
travel(X,Y) :- byTrain(X,Y).
travel(X,Y) :- byPlane(X,Y).

travel(X,Z) :-
	byCar(X,Y),
	travel(Y,Z).

travel(X,Z) :-
	byTrain(X,Y),
	travel(Y,Z).

travel(X,Z) :-
	byPlane(X,Y),
	travel(Y,Z).

travel(X,Y,byCar(X,Y)) :- byCar(X,Y).
travel(X,Y,byTrain(X,Y)) :- byTrain(X,Y).
travel(X,Y,byPlane(X,Y)) :- byPlane(X,Y).

travel(X,Y,byCar(X,Z,G)) :-
  byCar(X,Z),
  travel(Z,Y,G).

travel(X,Y,byTrain(X,Z,G)) :-
  byTrain(X,Z),
  travel(Z,Y,G).

travel(X,Y,byPlane(X,Z,G)) :-
  byPlane(X,Z),
  travel(Z,Y,G).


