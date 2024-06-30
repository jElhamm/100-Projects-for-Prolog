%****************************************************************************************************
%                                                                                                   *
%                                          list Length                                              *
%                                                                                                   *
%       This code defines a predicate list_length/2, which calculates the length of a list.         *
%       It consists of two rules:                                                                   *
%           1. The base case specifies that the length of an empty list is 0.                       *
%           2. The recursive case calculates the length of a non-empty list by recursively          *
%              counting the length of its tail and incrementing the result by 1.                    *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- list_length([a, b, c, d], Length).                                   *
%                                         Length = 4.                                               *
%                                                                                                   *
%****************************************************************************************************




% This line defines the base case for the list_length predicate.
list_length([], 0).

% This line defines the recursive case for the list_length predicate.
list_length([_|Tail], N) :-
    list_length(Tail, N1),
    N is N1 + 1.
