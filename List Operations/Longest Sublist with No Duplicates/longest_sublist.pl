%************************************************************************************************
%                                                                                               *
%                          Longest Sublist with No Duplicates                                   *
%                                                                                               *
%       This code defines a predicate longest_sublist/2, which finds the longest sublist        *
%       of a list with no duplicate elements. It consists of two rules:                         *
%                                                                                               *
%       1. The base case specifies that the longest sublist of an empty list is also            *
%          an empty list.                                                                       *
%       2. The recursive case finds the longest sublist by considering two possibilities:       *
%          - Including the current element and forming a sublist with no duplicates.            *
%          - Skipping the current element and continuing with the longest sublist found         *
%            so far.                                                                            *  
%                                                                                               *
%                               Example usage:                                                  *
%                 ?- longest_sublist([a, b, c, b, d, a], Longest).                              *
%                           Longest = [c, b, d, a].                                             *
%                                                                                               *
%************************************************************************************************



% Base case: The longest sublist of an empty list is an empty list.
longest_sublist([], []).

% Recursive case: Find the longest sublist with no duplicates.
longest_sublist([Head|Tail], Longest) :-
    sublist_with_no_duplicates([Head|Tail], Sublist), % Find sublist with no duplicates
    longest_sublist(Tail, LongestTail), % Recursively find longest sublist in the tail
    (length(Sublist, L1), length(LongestTail, L2), L1 > L2 -> Longest = Sublist; Longest = LongestTail).


% Predicate to generate a sublist with no duplicates.
sublist_with_no_duplicates([], []).

sublist_with_no_duplicates([Head|Tail], [Head|Rest]) :-
    + member(Head, Tail), % Ensure Head is not in the rest of the list
    sublist_with_no_duplicates(Tail, Rest).

sublist_with_no_duplicates([_|Tail], Rest) :-
    sublist_with_no_duplicates(Tail, Rest).
