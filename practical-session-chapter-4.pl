/* 1. Write a 3-place predicate combine1 which takes three lists
 *  as arguments and combines the elements of the first two lists
 *  into the third as follows:
 *
 *      ?- combine1([a,b,c],[1,2,3],X).
 *      X = [a,1,b,2,c,3]
 *
 *      ?- combine1([f,b,yip,yup],[glu,gla,gli,glo],Result).
 *      Result = [f,glu,b,gla,yip,gli,yup,glo]
 */

combine1([],[],[]).

combine1([X|T1],[Y|T2],[X,Y|T3]) :-
	combine1(T1,T2,T3).

/* 2. Now write a 3-place predicate combine2 which takes three lists
 *  as arguments and comines the elements of the first two lists
 *  into the third as follows:
 *
 *      ?- combine2([a,b,c],[1,2,3],X).
 *      X = [[a,1],[b,2],[c,3]]
 *
 *      ?- combine2([f,b,yip,yup],[glu,gla,gli,glo],Result).
 *      Result = [[f,glu],[b,gla],[yip,gli],[yup,glo]]
 */

combine2([],[],[]).

combine2([X|T1],[Y|T2],[[X,Y]|T3]) :-
	combine2(T1,T2,T3).

/* 3. Finally, write a 3-place predicate combine3 which takes three
 *  lists as arguments and combines the elements of the first two
 *  lists into the third list as follows:
 *
 *      ?- combine3([a,b,c],[1,2,3],X).
 *      X = [j(a,1),j(b,2),j(c,3)]
 *
 *      ?- combine3([f,b,yip,yup],[glu,gla,gli,glo],R).
 *      R = [j(f,glu),j(b,gla),j(yip,gli),j(yup,glo)]
 */

combine3([],[],[]).

combine3([X|T1],[Y|T2],[j(X,Y)|T3]) :-
	combine3(T1,T2,T3).

/* Now, you should have a pretty good idea of what the basic pattern
 *  of predicates for processing lists looks like. Here are a couple
 *  of list processing exercises that are a bit more interesting.
 */

/* 1. Write a predicate mysubset/2 that takes two lists (of
 *  constants) as arguments and checks whether the first list is a
 *  subset of the second.
 */

member(X,[X|_]).
member(X,[_|T]) :- member(X,T).

mysubset([],_).

mysubset([X|T],Y) :-
	member(X,Y),
	mysubset(T,Y).

/* 2. Write a predicate mysuperset/2 that takes two lists as
 *  arguments and checks whether the first list is a superset of the
 *  second.
 */

mysuperset(_,[]).

mysuperset(X,[Y|T]) :-
	member(Y,X),
	mysuperset(X,T).

