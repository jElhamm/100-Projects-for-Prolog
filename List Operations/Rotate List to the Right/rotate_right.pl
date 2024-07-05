%****************************************************************************************************
%                                                                                                   *
%                                      Rotate List to the Right                                     *
%                                                                                                   *
%       The given Prolog code defines a predicate to rotate a list to the right.                    *
%       The `rotate_right` predicate is defined as follows:                                         *
%       1. The list is split into an initial part and the last element.                             *
%       2. The last element is appended to the front of the initial part, resulting in the rotated  *
%          list.                                                                                    *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- rotate_right([1, 2, 3, 4], RotatedList).                             *
%                                   RotatedList = [4, 1, 2, 3]                                      *
%                                                                                                   *
%****************************************************************************************************




% -----------------------------------------rotate_right(List, RotatedList)---------------------------------------------------

% The predicate to rotate a list to the right.
rotate_right(List, RotatedList) :-
    append(Init, [Last], List),                                         % Split the list into an initial part and the last element.
    append([Last], Init, RotatedList).                                  % Append the last element to the front of the initial part.


% -----------------------------------------append(List1, List2, Result)----------------------------------------------------------

% Base case: Appending an empty list to a list results in the second list.
append([], List, List).

% Recursive case: Appending [Head|Tail1] to List2 results in [Head|TailResult].
append([Head|Tail1], List2, [Head|TailResult]) :-
    append(Tail1, List2, TailResult).