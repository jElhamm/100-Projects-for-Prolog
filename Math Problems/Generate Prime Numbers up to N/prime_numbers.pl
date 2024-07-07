%****************************************************************************************************
%                                                                                                   *
%                                     Generate Prime Numbers up to N                                *
%                                                                                                   *
%       The given Prolog code defines a predicate `prime_numbers_up_to/2` that generates a list of  *
%       prime numbers up to a given number N. It uses the `is_prime/1` predicate to check if a      *
%       number is prime.                                                                            *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- prime_numbers_up_to(10, Primes).                                     *
%                                     Primes = [2, 3, 5, 7]                                         *
%                                                                                                   *
%****************************************************************************************************


% -----------------------------------------Generate a list of prime numbers up to N-----------------------------------------

prime_numbers_up_to(N, Primes) :-
    findall(X, (between(2, N, X), is_prime(X)), Primes).


% -----------------------------------------Base case: Numbers less than 2 are not prime-----------------------------------------

is_prime(1) :- false.
is_prime(0) :- false.


% -----------------------------------------Recursive case: Check that the number N is not divisible by any number between 2 and sqrt(N)-----------------------------------------

is_prime(N) :-
    N > 1,
    \+ has_factor(N, 2).


% -----------------------------------------Check that the number N is divisible by F or any number between F and sqrt(N)-----------------------------------------
has_factor(N, F) :-
    F * F =< N,
    N mod F =:= 0.
has_factor(N, F) :-
    F * F =< N,
    F2 is F + 1,
    has_factor(N, F2).
