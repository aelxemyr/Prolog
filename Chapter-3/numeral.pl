numeral(0).
numeral(succ(X)):- numeral(X).

add(0,Y,Y).
add(succ(X),Y,succ(Z)):- add(X,Y,Z).

greater_than(succ(_),0).
greater_than(succ(X),succ(Y)):- greater_than(X,Y).


