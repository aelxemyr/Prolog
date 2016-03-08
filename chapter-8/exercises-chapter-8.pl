/* Chapter 8 Exercises */

/* Exercise 8.1
 * Here's our basic DCG:
 *
 *     s --> np,vp
 *
 *     np --> det,n.
 *
 *     vp --> v,np.
 *     vp --> v.
 *
 *     det --> [the].
 *     det --> [a].
 *
 *     n --> [woman].
 *     n --> [man].
 *     n --> [apple].
 *     n --> [pear].
 *
 *     v --> [eats].
 *
 * Suppose we add the noun ``men'' (which is plural) and the verb
 * ``know''. Then we would want a DCG which says that ``The men eat'' is
 * okay, ``The man eats'' is okay, ``The men eats'' is not okay, and
 * ``The man eat'' is not okay. Change the DCG so that it correctly
 * handles these sentences. Use an extra argument to cope with the
 * singular plural distinction.
 */

s --> np(X),vp(X).

np(X) --> det(X),n(X).

vp(X) --> v(X),np(_).
vp(X) --> v(X).

det(_) --> [the].
det(singular) --> [a].

n(singular) --> [woman].
n(singular) --> [man].
n(plural) --> [men].
n(singular) --> [apple].
n(singular) --> [pear].

v(singular) --> [eats].
v(plural) --> [eat].
v(singular) --> [knows].
v(plural) --> [know].

/* Exercise 8.2
 * Translate the following DCCG rule into the form Prolog uses:
 *
 *     kanga(V,R,Q) --> roo(V,R),jumps(Q,Q),{marsupial(V,R,Q)}.
 */

kanga(V,R,Q,A,C) :-
	roo(V,R,A,B),
	jumps(Q,Q,B,C),
	marsupial(V,R,Q).
