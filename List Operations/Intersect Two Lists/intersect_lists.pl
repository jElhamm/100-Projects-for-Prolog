%****************************************************************************************************
%                                                                                                   *
%                                       Intersect Two Lists                                         *
%                                                                                                   *
%       The given Prolog code defines predicates to find the intersection of two lists.             *
%       The `intersect_lists` predicate is defined with three cases:                                *
%       1. Base case: The intersection of an empty list with any list is an empty list.             *
%       2. Recursive case 1: If the head of the first list is a member of the second list,          *
%          include the head in the intersection and recursively find the intersection of the tails. *
%       3. Recursive case 2: If the head of the first list is not a member of the second list,      *
%          skip the head and recursively find the intersection of the tails.                        *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- intersect_lists([1, 2, 3], [2, 3, 4], Intersection).                 *
%                                        Intersection = [2, 3]                                      *
%                                                                                                   *
%****************************************************************************************************




% -----------------------------------------intersect_lists(List1, List2, Intersection)-------------------------------------------

% Base case: The intersection of an empty list with any list is an empty list.
intersect_lists([], _, []).

% Recursive case 1: If the head of the first list is a member of the second list,
% include the head in the intersection and recursively find the intersection of the tails.
intersect_lists([H|T], L2, [H|Intersection]) :-
    member(H, L2), 
    intersect_lists(T, L2, Intersection).


% Recursive case 2: If the head of the first list is not a member of the second list,
% skip the head and recursively find the intersection of the tails.
intersect_lists([H|T], L2, Intersection) :-
    \+ member(H, L2), 
    intersect_lists(T, L2, Intersection).
