/* Chapter 6 Exercises */

/* Exercise 6.1
 * Let's call a list doubled if it made of two consecutive blocks of
 * elements that are exactly the same. For example, [a,b,c,a,b,c] is
 * doubled and so is [foo,gubble,foo,gubble]. On the other hand, [foo,
 * gubble, foo] is not doubled. Write a predicate doubled(List) which
 * succeeds when List is a doubled list.
 */

append([],L,L).
append([H|T],L1,[H|L2]) :- append(T,L1,L2).

doubled(List) :- append(X,X,List).

/* Exercise 6.2
 * A palindrome is a word or phrase that spells the same forwards and
 * backwards. For example,`rotator', `eve', and `nurses run' are all
 * palindromes. Write a predicate palindrome(List), which checks whether
 * List is a plindrome. For example, to the queries
 *
 *     ?- palindrome([r,o,t,a,t,o,r]).
 *
 * and
 *
 *     ?- palindrome([n,u,r,s,e,s,r,u,n]).
 *
 * Prolog should respond `yes', but to the query
 *
 *     ?- palindrom([n,o,t,t,h,i,s]).
 *
 * Prolog should respond `no'.
 */

accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],A,A).
rev(L,R) :- accRev(L,[],R).

palindrome(List) :- rev(List,List).

/* Exercise 6.3
 * 1. Write a predicate second(X,List) which checks whether X is the
 * second element of List.
 */

second(X,[_,X|_]).

/* 2. Write a predicate swap12(List1,List2) which checks whether List1
 * is identical to List2, except that the first two elements are
 * exchanged.
 */

swap12([],[]).
swap12([X,Y|T],[Y,X|T]).

/* 3. Write a predicate final(X,List) which check whether X is the last
 * element of List.
 */

final(X,List) :- rev(List,[X|_]).

/* 4. Write a predicate toptail(InList,OutList) which says `no' if
 * InList is a list containing fewer than 2 elements, and which deletes
 * the first and the last elements of InList and returns the result as
 * OutList, when InList is a list containing at least 2 elements. For
 * example:
 *
 *     toptail([a],T).
 *     no
 *
 *     toptail([a,b],T).
 *     T = []
 *
 *     toptail([a,b,c],T).
 *     T = [b]
 */

toptail(InList,OutList) :- append([_|OutList],[_],InList).

/* 5. Write a predicate swapfl(List1,List2) which checks whether List1
 * is identical to List2, except that the first and last elements are
 * exchanged.
 */

truncate([_|T],TL) :-
	rev(T,[_|RTL]),
	rev(RTL,TL).

equal([],[]).
equal([H|T1],[H|T2]) :- equal(T1,T2).

firstIsLast([H|_],L2) :- rev(L2,[H|_]).

swapfl(L1,L2) :-
	firstIsLast(L1,L2),
	firstIsLast(L2,L1),
	truncate(L1,TL1),
	truncate(L2,TL2),
	equal(TL1,TL2).

/* 6. There is a street with three neighbouring houses that all have
 * a different color, namely red, blue, and green. People of
 * different nationalities live in the different houses and they all
 * have a different pet. Here are some more facts about them:
 *
 * - The Englishman lives in the red house.
 * - The jaguar is the pet of the Spanish family.
 * - The Japanese lives to the right of the snail keeper.
 * - The snail keeper lives to the left of the blue house.
 *
 * Who keeps the zebra? Don't work it out for yourself: define a
 * predicate zebra/1 that tells you the nationality of the owner of
 * the zebra!
 */

prefix(P,L) :- append(P,_,L).
suffix(S,L) :- append(_,S,L).

sublist(SubL,L) :-
	suffix(S,L),
	prefix(SubL,S).

member(X,[X|_]).
member(X,[_|T]) :- member(X,T).

zebra(Nationality) :-
	Neighborhood = [_,_,_],
	member(house(red,english,_),Neighborhood),
	member(house(_,spanish,jaguar),Neighborhood),
	member(house(_,_,snail),Neighborhood),
	member(house(_,japanese,_),Neighborhood),
	member(house(blue,_,_),Neighborhood),
	member(house(green,_,_),Neighborhood),
	member(house(_,Nationality,zebra),Neighborhood),
	sublist([house(_,_,snail),house(blue,_,_)],Neighborhood),
	sublist([house(_,_,snail),house(_,japanese,_)],Neighborhood).

