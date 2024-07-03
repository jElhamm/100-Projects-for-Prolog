%****************************************************************************************************
%                                                                                                   *
%                                         Is Sorted                                                 *
%                                                                                                   *
%       This code defines a predicate sorted_list/1, which checks if a list is sorted.              *
%       It consists of three rules:                                                                 *
%           1. The base case specifies that an empty list is trivially sorted.                      *
%           2. Another base case specifies that a single-element list is trivially sorted.          *
%           3. The recursive case ensures that for a list with at least two elements,               *
%              each pair of consecutive elements is in non-decreasing order.                        *
%                                                                                                   *
%                                     Example usage:                                                *
%                           ?- sorted_list([a, b, c, d]).                                           *
%                                       true.                                                       *
%                                                                                                   *
%****************************************************************************************************





sorted_list([]).                            % Base case: An empty list is trivially sorted.
sorted_list([_]).                           % Base case: A single-element list is trivially sorted.

% Recursive case: For a list with at least two elements, ensure each
% pair of consecutive elements is in non-decreasing order.
sorted_list([X, Y|Tail]) :-
    X =< Y,
    sorted_list([Y|Tail]).
