%****************************************************************************************************
%                                                                                                   *
%                                    Calculate Fibonacci of a Number                                *
%                                                                                                   *
%       The given Prolog code defines a predicate `fibonacci/2` to calculate the Fibonacci number   *
%       at position N. The base cases define the Fibonacci of 0 as 0 and the Fibonacci of 1 as 1.   *
%       The recursive case defines the Fibonacci of N as the sum of the Fibonacci of (N-1) and      *
%       (N-2).                                                                                      *
%                                                                                                   *
%                                       Example usage:                                              *
%                                    ?- fibonacci(5, F).                                            *
%                                           F = 5                                                   *
%                                                                                                   *
%****************************************************************************************************



% Base case: The Fibonacci of 0 is 0.
fibonacci(0, 0).


% Base case: The Fibonacci of 1 is 1.
fibonacci(1, 1).


% Recursive case: The Fibonacci of N is the sum of the Fibonacci of (N-1) and (N-2).
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.
