max([X],X).
max([X|Xs], Y):- max(Xs, Y), Y >= X.
max([X|Xs], X):- max(Xs, Y), X >  Y.

sum_even([_,Y],Y).
sum_even([_,Y,_],Y).
sum_even([_,Y|Xs], Res) :-
	sum_even(Xs, Res1),
	Res is Y + Res1.
		
delete_first_k(_, _, [], []).
delete_first_k(_, 0, [H|T], [H|T]).
delete_first_k(X, K, [H|T], Res) :- 
	X == H,
	K1 is K - 1,
	delete_first_k(X, K1, T, Res).
delete_first_k(X, K, [H|T], Res) :- 
	X \== H,
	delete_first_k(X, K, T, Res1),
	Res = [H|Res1].


