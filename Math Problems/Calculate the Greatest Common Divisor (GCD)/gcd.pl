%****************************************************************************************************
%                                                                                                   *
%                            Calculate the Greatest Common Divisor (GCD)                            *
%                                                                                                   *
%       The given Prolog code defines a predicate `gcd/3` that calculates the greatest common       *
%       divisor of two given numbers using the Euclidean algorithm.                                 *
%                                                                                                   *
%                                       Example usage:                                              *
%                                    ?- gcd(54, 24, G).                                             *
%                                          G = 6                                                    *
%                                                                                                   *
%****************************************************************************************************



% ------------------------------Base case: The GCD of A and 0 is A, provided A is greater than 0-----------------------------------------

gcd(A, 0, A) :- A > 0.


% --------------------Recursive case: The GCD of A and B is the GCD of B and the remainder of A divided by B-----------------------------------------

gcd(A, B, G) :-
    B > 0,
    R is A mod B,
    gcd(B, R, G).
