%****************************************************************************************************
%                                                                                                   *
%                                       Convert List to Set                                         *
%                                                                                                   *
%       The given Prolog code defines predicates to convert a list to a set, removing duplicates.   *
%       The `list_to_set` predicate is defined with three cases:                                    *
%       1. Base case: An empty list converts to an empty set.                                       *
%       2. Recursive case 1: If the head of the list is a member of the tail, skip the head and     *
%          recursively process the tail.                                                            *
%       3. Recursive case 2: If the head of the list is not a member of the tail, include the head  *
%          in the set and recursively process the tail.                                             *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- list_to_set([1, 2, 2, 3, 4, 4], Set).                                *
%                                        Set = [1, 2, 3, 4]                                         *
%                                                                                                   *
%****************************************************************************************************




% -----------------------------------------list_to_set(List, Set)--------------------------------------------------------------

% Base case: An empty list converts to an empty set.
list_to_set([], []).

% Recursive case 1: If the head of the list is a member of the tail, skip the head.
list_to_set([H|T], Set) :-
    member(H, T),
    list_to_set(T, Set).

% Recursive case 2: If the head of the list is not a member of the tail, include the head in the set.
list_to_set([H|T], [H|Set]) :-
    \+ member(H, T),
    list_to_set(T, Set).
