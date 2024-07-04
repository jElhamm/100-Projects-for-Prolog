%****************************************************************************************************
%                                                                                                   *
%                                       Check Equality of Two Lists                                 *
%                                                                                                   *
%       The given Prolog code defines predicates to check if two lists are equal.                   *
%       The `equal_lists` predicate is defined with two cases:                                      *
%       1. Base case: Two empty lists are equal.                                                    *
%       2. Recursive case: Two non-empty lists are equal if their heads are equal and their tails   *
%          are recursively equal.                                                                   *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- equal_lists([1, 2, 3], [1, 2, 3]).                                   *
%                                        true.                                                      *
%                           ?- equal_lists([1, 2, 3], [1, 2, 4]).                                   *
%                                        false.                                                     *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------equal_lists(List1, List2)----------------------------------------------------------

% Base case: Two empty lists are equal.
equal_lists([], []).

% Recursive case: Two lists are equal if their heads are equal and their tails are equal.
equal_lists([H1|T1], [H2|T2]) :-
    H1 = H2,
    equal_lists(T1, T2).
