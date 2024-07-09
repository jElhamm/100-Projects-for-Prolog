%****************************************************************************************************
%                                                                                                   *
%                          Calculate the Power of a Number A to the Power of B                      *
%                                                                                                   *
%    The following Prolog code defines predicates `power/3` to calculate A raised to the power B.   *
%                                                                                                   *
%  - `power/3`: Entry point to calculate A raised to the power B.                                   *
%                                                                                                   *
%                                       Example usage:                                              *
%                                  ?- power(2, 5, Result).                                          *
%                                        Result = 32                                                *
%                                                                                                   *
%****************************************************************************************************



% ------------------------------------Base case: Any number A raised to power 0 is 1----------------------------------------

power(_, 0, 1).


% ----------------------------------------Calculate A raised to the power B----------------------------------------

power(A, B, Result) :-
    B > 0,
    B1 is B - 1,
    power(A, B1, R1),
    Result is A * R1.
