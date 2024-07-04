%****************************************************************************************************
%                                                                                                   *
%                                       Add Element to List                                         *
%                                                                                                   *
%       The given Prolog code defines predicates to add an element to a list.                       *
%       The `add_to_list` predicate is defined with two cases:                                      *
%       1. Base case: Adding an element X to an empty list results in a list with that single       *
%          element X.                                                                               *
%       2. Recursive case: If the list is not empty, keep the head of the list unchanged and add X  *
%          to the tail, using recursion to reach the base case.                                     *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- add_to_list(5, [1, 2, 3, 4], NewList).                               *
%                                        NewList = [1, 2, 3, 4, 5]                                  *
%                                                                                                   *
%****************************************************************************************************




% -----------------------------------------add_to_list(Element, List, NewList).----------------------------------------------------------

% Base case: Adding an element X to an empty list results in a list with that single element X.
add_to_list(X, [], [X]).


% Recursive case: If the list is not empty, keep the head of the list unchanged and add X to the tail.
add_to_list(X, [H|T], [H|NewT]) :- 
    add_to_list(X, T, NewT).
