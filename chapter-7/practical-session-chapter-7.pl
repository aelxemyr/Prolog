/* Chapter 7 Practical Session */

/* 1.
 * The formal language aEven is very simple: it consists of all strings
 * containing an even number of `a's and nothign else. Note that the
 * empty string e belongs to aEven. Write a DCG that generates aEven.
 */

s1 --> [].
s1 --> s1,[a],[a].

/* 2.
 * The formal language a^nb^(2m)c^(2m)d^n consists of all strings of the
 * following form: an unbroken block of `a's followed by an unbroken
 * block of `b's followed by an unbroken block of `c's followed by an
 * unbroken block of `d's, such that the a and d blocks are exactly the
 * same length, and the b and c blocks are also exactly the same length
 * and furthermore consist of an even number of `b's and `c's
 * respectively. For example, e, abbccd, and aaabbbbccccddd all belong
 * to a^nb^(2m)c^(2m)d^n. Write a DCG that generates this language.
 */

s2 --> bc.
s2 --> [a],s2,[d].

bc --> [].
bc --> [b,b],bc,[c,c].

/* 3.
 * The languaage that logicians call `propositional logic over the
 * propositional symbols p, q, and r' can be defined by the following
 * context free grammar:
 *     prop --> p
 *     prop --> q
 *     prop --> r
 *     prop --> ~prop
 *     prop --> (prop A prop)
 *     prop -->	(prop V prop)
 *     prop --> (prop -> prop)
 *
 * Write a DCG that generates this language. Actually, since we don't
 * know about Prolog operators yet, you will have to make a few rather
 * clumsy looking compromises. For example, instead of getting it to
 * recognize
 *
 *     ~(p -> q)
 *
 * you will have to get it to recognize things like
 *
 *     [not, '(', p, implies, q, ')']
 *
 * instead. But we will learn later how to make the output nicer, so
 * write the DCG that accepts a clumsy looking version of this language.
 * Use or for V, and and for A.
 */

prop --> [p].
prop --> [q].
prop --> [r].

prop --> [not],prop.

prop --> ['('],prop,conj,prop,[')'].

conj --> [and].
conj --> [or].
conj --> [implies].

