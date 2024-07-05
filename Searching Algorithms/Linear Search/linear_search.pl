%****************************************************************************************************
%                                                                                                   *
%                                     Linear Search in a List                                       *
%                                                                                                   *
%       The given Prolog code defines predicates to perform a linear search for an element in a list.*
%       The `linear_search` predicate is defined with two cases:                                    *
%       1. Base case: The element is found at the head of the list.                                 *
%       2. Recursive case: The element is not at the head, so search recursively in the tail.       *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- linear_search(3, [1, 2, 3, 4]).                                      *
%                                        true.                                                      *
%                           ?- linear_search(5, [1, 2, 3, 4]).                                      *
%                                        false.                                                     *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------Linear search for an element in a list---------------------------------------------

% Base case: Element found at the head of the list.
linear_search(Element, [Element|_]).

% Recursive case: Search in the tail of the list.
linear_search(Element, [_|Tail]) :-
    linear_search(Element, Tail).
