%****************************************************************************************************
%                                                                                                   *
%                                 Find the Last Duplicate Element in a List                         *
%                                                                                                   *
%       The given Prolog code defines a predicate to find the last duplicate element in a list.     *
%       The `last_duplicate` predicate uses the `reverse/2` predicate to reverse the list and       *
%       then calls the `first_duplicate` predicate to find the first duplicate in the reversed list.*
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- last_duplicate([1, 2, 3, 2, 4, 3], Element).                         *
%                                        Element = 3                                                *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------Find the last duplicate element in a list----------------------------------------

% The predicate to find the last duplicate element in a list.
last_duplicate(List, Element) :-
    reverse(List, ReversedList),                                        % Reverse the list.
    first_duplicate(ReversedList, Element).                             % Find the first duplicate in the reversed list.


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
