%****************************************************************************************************
%                                                                                                   *
%                Calculate the Greatest Common Divisor (GCD) and Least Common Multiple (LCM)        *
%                                                                                                   *
%       The given Prolog code defines predicates `gcd/3` and `lcm/3` to calculate the greatest      *
%       common divisor and the least common multiple of two given numbers, respectively.            *
%                                                                                                   *
%       The `gcd/3` predicate uses the Euclidean algorithm to find the GCD, while `lcm/3` uses the  *
%       GCD to calculate the LCM.                                                                   *
%                                                                                                   *
%                                       Example usage:                                              *
%                                    ?- gcd(54, 24, G).                                             *
%                                           G = 6                                                   *
%                                     ?- lcm(4, 5, L).                                              *
%                                           L = 20                                                  *
%                                                                                                   *
%****************************************************************************************************



% Base case: The GCD of A and 0 is A, provided A is greater than 0.
gcd(A, 0, A) :- 
    A > 0.


% Recursive case: The GCD of A and B is the GCD of B and the remainder of A divided by B.
gcd(A, B, G) :-
    B > 0,                % Ensure B is greater than 0.
    R is A mod B,         % Calculate the remainder of A divided by B.
    gcd(B, R, G).         % Recursively find the GCD of B and the remainder.


% Calculate the Least Common Multiple (LCM) of two numbers A and B.
lcm(A, B, L) :-
    gcd(A, B, G),         % First, find the GCD of A and B.
    L is abs(A * B) // G. % Then, calculate the LCM using the formula: abs(A * B) / GCD.
