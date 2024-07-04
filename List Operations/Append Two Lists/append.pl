%****************************************************************************************************
%                                                                                                   *
%                                       Append Two Lists                                            *
%                                                                                                   *
%       The given Prolog code defines predicates to concatenate two lists.                          *
%       The `append` predicate is defined with two cases:                                           *
%       1. Base case: Appending an empty list to another list results in the second list.           *
%       2. Recursive case: Appending a non-empty list to another list results in a new list where   *
%          the head of the first list is the head of the new list, and the tail is the result of    *
%          recursively appending the tail of the first list to the second list.                     *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- append([1, 2], [3, 4], Result).                                      *
%                                        Result = [1, 2, 3, 4]                                      *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------append(List1, List2, Result)----------------------------------------------------------

% Base case: Appending an empty list to a list results in the second list.
append([], List, List).

% Recursive case: Appending [Head|Tail1] to List2 results in [Head|TailResult].
append([Head|Tail1], List2, [Head|TailResult]) :-
    append(Tail1, List2, TailResult).
