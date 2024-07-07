%****************************************************************************************************
%                                                                                                   *
%                                     Calculate Factorial of a Number                               *
%                                                                                                   *
%       The given Prolog code defines a predicate `factorial/2` to calculate the factorial of a     *
%       number. The base case defines that the factorial of 0 is 1. The recursive case defines      *
%       the factorial of N as N multiplied by the factorial of (N-1).                               *
%                                                                                                   *
%                                       Example usage:                                              *
%                                    ?- factorial(5, F).                                            *
%                                           F = 120                                                 *
%                                                                                                   *
%****************************************************************************************************



% Base case: The factorial of 0 is 1.
factorial(0, 1).


% Recursive case: The factorial of N is N multiplied by the factorial of (N-1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.
