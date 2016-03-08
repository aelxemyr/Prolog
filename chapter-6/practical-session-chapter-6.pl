/* 1. It is possible to write a one line definition of the member
 * predicate by making use of append/3. Do so. How does this new
 * version of member compare in efficiency with the standard one?
 */

% The standard member predicate
member(X,[X|_]).
member(X,[_|T]) :- member(X,T).

append([],L,L).
append([H|T],L1,[H|L2]) :- append(T,L1,L2).

% member predicate using append
memberWithAppend(X,L) :- append(_,[X|_],L).

% The standard member predicate is more efficient, since it just works
% its way down the list, whereas the version which uses append must find
% an appropriate partition of the list such that the right sublist can
% be concatenated.

/* 2. Write a predicate set(InList,OutList) which takes as input an
 * arbitrary list, and returns a list in which each element of the input
 * appears only once. For example, the query
 *
 *     set([2,2,foo,1,foo,[],[]],X).
 *
 * should yield the result
 *
 *     X = [2,foo,1,[]].
 */

accSet([H|T],A,L) :-
	member(H,A),
	accSet(T,A,L).

accSet([H|T],A,L) :-
	accSet(T,[H|A],L).

accSet([],A,A).

set(InList,OutList) :-
	accSet(InList,[],RevOutList),
	rev(RevOutList,OutList).

/* 3. We `flatten' a list by removing all the square brackets around any
 * lists it contains as elements, and around any lists that its elements
 * contain as elements, and so on, for all nested lists. For example,
 * when we flatten the list
 *     [a,b,[c,d],[[1,2]],foo]
 *
 * we get the list
 *
 *     [a,b,c,d,1,2,foo]
 *
 * and when we flatten the list
 *
 *     [a,b,[[[[[[[c,d]]]]]]],[[1,2]],foo,[]]
 *
 * we also get
 *
 *     [a,b,c,d,1,2,foo].
 *
 * Write a predicate flatten(List,Flat) that holds when the first
 * argument List flattens to the second argument Flat. This should be
 * done without making use of append/3.
 */

accFlatten([],A,A).

accFlatten([H|T],A,L) :-
	accFlatten(T,A,Anew),
	accFlatten(H,Anew,L).

accFlatten(H,A,[H|A]).

flatten(List,Flat) :-
	accFlatten(List,[],Flat).

