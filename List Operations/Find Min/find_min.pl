%********************************************************************************************************
%                                                                                                       *
%                                          MIN List                                                     *
%                                                                                                       *
%   This Prolog code defines a predicate `min_list/2` that finds the minimum element in a list.         *
%                                                                                                       *
%   The first line `min_list([X], X).` is the base case that states the minimum of a single             *
%   element list is the element itself.                                                                 *
%                                                                                                       *
%   The second line `min_list([Head|Tail], Min) :-` defines the recursive case.                         *
%   It states that the minimum of a list with a head element `Head` and a tail list `Tail` is           *
%   `Min` if the minimum of the `Tail` is `MinTail` and `Min` is the minimum of `Head` and `MinTail`.   *
%                                                                                                       *
%   This code is declaring a recursive predicate that finds the minimum element in a list.              *
%                                                                                                       *
%                                      Example usage:                                                   *
%                             ?- max_list([3, 5, 2, 9, 1], Max).                                        *
%                                           Max = 1.                                                    *
%                                                                                                       *
%********************************************************************************************************



min_list([X], X).
min_list([Head|Tail], Min) :-
    min_list(Tail, MinTail),
    Min is min(Head, MinTail).


% Test case
% Find the maximum element in the list [3, 5, 2, 9, 1].
% Expected result: Max = 1
