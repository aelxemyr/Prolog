/* Chapter 7 Exercises */

/* Exercise 7.1
 * Suppose we are working with the following DCG:
 *
 *     s --> foo,bar,wiggle.
 *     foo --> [choo].
 *     foo --> foo,foo.
 *     bar --> mar,zar.
 *     mar --> me,my.
 *     me --> [i].
 *     my --> [am].
 *     zar --> blar,car.
 *     blar --> [a].
 *     car --> [train].
 *     wiggle --> [toot].
 *     wiggle --> wiggle,wiggle.
 *
 * Write down the ordinary Prolog rules that correspond to these DCG
 * rules. Whar are the firs tthree responses that Prolog gives to the
 * query s(X,[])?
 */

s1(A,D) :- foo(A,B), bar(B,C), wiggle(C,D).
foo([choo|W],W).
foo(X,Z) :- foo(X,Y), foo(Y,Z).
bar(X,Z) :- mar(X,Y), zar(Y,Z).
mar(X,Z) :- me(X,Y),my(Y,Z).
me([i|W],W).
my([am|W],W).
zar(X,Z) :- blar(X,Y), car(Y,Z).
blar([a|W],W).
car([train|W],W).
wiggle([toot|W],W).
wiggle(X,Z) :- wiggle(X,Y), wiggle(Y,Z).

% The first three responses Prolog gives to the query s1(X,[]) are:
% X = [choo,i,am,a,train,toot]
% X = [choo,i,am,a,train,toot,toot]
% X = [choo,i,am,a,train,toot,toot,toot]

/* Exercise 7.2
 * Thr formal language a^nb^n - {e} consists of all the strings in
 * a^nb^n except the empty string. Write a DCG that generates this
 * language.
 */

s2 --> l,r.
s2 --> l,s2,r.
l --> [a].
r --> [b].

/* Exercise 7.3
 * Let a^nb^(2n) be the formal language which contains all strings of
 * the following form: an unbroken block of `a's of length n followed by
 * an unbroken block of `b's of length 2n, and nothing else. For
 * example, abb, aabbbb, and aaabbbbbb belong to a^nb^(2n), and so does
 * the empty string. Write a DCG that generates this language.
 */

s3 --> [].
s3 --> x,s3,y,y.
x --> [a].
y --> [b].
