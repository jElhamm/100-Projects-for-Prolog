%**********************************************************************************************
%                                                                                             *
%                                   Nth Element Retrieval                                     *
%                                                                                             *
%       This code defines a predicate nth_element/3, which retrieves the Nth element          *
%       from a list. It consists of two rules:                                                *
%           1. The base case specifies that the 1st element of a non-empty list is X.         *
%           2. The recursive case retrieves the Nth element by recursively traversing         *
%              the list and decrementing N until reaching the desired element.                *
%                                                                                             *
%                                     Example usage:                                          *
%                   ?- nth_element(3, [a, b, c, d, e], Element).                              *
%                                     Element = c.                                            *
%                                                                                             *
%**********************************************************************************************



% Base case: Retrieves the 1st element from the list.
nth_element(1, [X|_], X).

% Recursive case: Retrieves the Nth element from the tail of the list.
nth_element(N, [_|Tail], X) :-
N > 1,
N1 is N - 1,
nth_element(N1, Tail, X).
