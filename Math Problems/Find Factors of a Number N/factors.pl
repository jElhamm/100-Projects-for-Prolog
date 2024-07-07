%****************************************************************************************************
%                                                                                                   *
%                                   Find Factors of a Number N                                      *
%                                                                                                   *
%       The given Prolog code defines a predicate `factors/2` that generates a list of all factors  *
%       of a given number N.                                                                        *
%                                                                                                   *
%                                       Example usage:                                              *
%                                 ?- factors(12, Factors).                                          *
%                                Factors = [1, 2, 3, 4, 6, 12]                                      *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------Find a list of factors of number N-----------------------------------------

factors(N, Factors) :-
    findall(X, (between(1, N, X), N mod X =:= 0), Factors).
