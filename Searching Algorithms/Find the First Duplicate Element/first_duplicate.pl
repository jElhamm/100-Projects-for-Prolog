%****************************************************************************************************
%                                                                                                   *
%                                 Find the First Duplicate Element in a List                        *
%                                                                                                   *
%       The given Prolog code defines predicates to find the first duplicate element in a list.     *
%       The `first_duplicate` predicate uses a helper predicate to track seen elements and          *
%       identify the first duplicate.                                                               *
%       1. The `first_duplicate` predicate initializes the helper with an empty seen list.          *
%       2. The `first_duplicate_helper` predicate checks if the head of the list has been seen.     *
%          If so, it is the first duplicate. Otherwise, it continues recursively with the tail.     *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- first_duplicate([1, 2, 3, 2, 4], Element).                           *
%                                        Element = 2                                                *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------Find the first duplicate element in a list---------------------------------------

% The predicate to find the first duplicate element in a list.
first_duplicate(List, Element) :-
    first_duplicate_helper(List, [], Element).                          % Call the helper predicate with an empty seen list.


% Helper predicate to find the first duplicate element with a seen list.
first_duplicate_helper([Head|Tail], Seen, Element) :-
    ( member(Head, Seen) ->                                             % Check if the head is in the seen list.
        Element = Head                                                  % If so, it is the first duplicate.
    ;                                                                   % Otherwise, add the head to the seen list and continue with the tail.
      first_duplicate_helper(Tail, [Head|Seen], Element)
    ).
