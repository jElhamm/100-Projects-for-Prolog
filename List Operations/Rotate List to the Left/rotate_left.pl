%****************************************************************************************************
%                                                                                                   *
%                                       Rotate List to the Left                                     *
%                                                                                                   *
%       The given Prolog code defines a predicate to rotate a list to the left.                     *
%       The `rotate_left` predicate is defined as follows:                                          *
%       1. The list is split into a head and a tail.                                                *
%       2. The head is appended to the end of the tail, resulting in the rotated list.              *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- rotate_left([1, 2, 3, 4], RotatedList).                              *
%                                  RotatedList = [2, 3, 4, 1]                                       *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------rotate_left(List, RotatedList)----------------------------------------------------

% The predicate to rotate a list to the left.
rotate_left([H|T], RotatedList) :-
    append(T, [H], RotatedList).                        % Append the head of the list to the end of the tail.



% -----------------------------------------append(List1, List2, Result)----------------------------------------------------------

% Base case: Appending an empty list to a list results in the second list.
append([], List, List).

% Recursive case: Appending [Head|Tail1] to List2 results in [Head|TailResult].
append([Head|Tail1], List2, [Head|TailResult]) :-
    append(Tail1, List2, TailResult).