%********************************************************************************************************
%                                                                                                       *
%                                   Split List Predicate                                                *
%                                                                                                       *
%       This code defines a predicate split_list/4, which splits a list into two parts based            *
%       on a pivot value. It consists of three rules:                                                   *
%                                                                                                       *
%           1. The base case specifies that splitting an empty list results in two empty lists.         *
%           2. If the head of the list is less than or equal to the pivot, it is added to the           *
%             'Less' list, and split_list is recursively called on the tail.                            *
%           3. If the head of the list is greater than the pivot, it is added to the 'More'             *
%              list, and split_list is recursively called on the tail.                                  *
%                                                                                                       *
%                                        Example usage:                                                 *
%                   ?- split_list([3, 1, 4, 1, 5, 9, 2, 6, 5], 4, Less, More).                          *
%                                     Less = [3, 1, 1, 2],                                              *
%                                     More = [5, 9, 6, 5].                                              *
%                                                                                                       *
%********************************************************************************************************



% Base case: Splitting an empty list results in two empty lists.
split_list([], _, [], []).

% Recursive cases: Split the list based on the pivot value.
split_list([Head|Tail], Pivot, [Head|Less], More) :-
    Head =< Pivot,
    split_list(Tail, Pivot, Less, More).

split_list([Head|Tail], Pivot, Less, [Head|More]) :-
    Head > Pivot,
    split_list(Tail, Pivot, Less, More).