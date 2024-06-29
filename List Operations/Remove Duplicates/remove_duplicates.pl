%********************************************************************************************
%                                                                                           *
%                                    Remove Duplicates                                      *
%                                                                                           *
%       This Prolog program defines a predicate `remove_duplicates/2` that removes          *
%       duplicate elements from a list, preserving the order of the first occurrence        *
%       of each element.                                                                    *
%                                                                                           *
%       The `remove_duplicates/2` predicate takes two arguments:                            *
%           - The first argument is the input list.                                         *
%           - The second argument is the output list with duplicates removed.               *
%                                                                                           *
%                                   Example usage:                                          *
%               ?- remove_duplicates([1, 2, 2, 3, 4, 4, 5], Result).                        *
%                               Result = [1, 2, 3, 4, 5].                                   *
%                                                                                           *
%********************************************************************************************




% Base case: an empty list has no duplicates, so the result is also an empty list.
remove_duplicates([], []).                 

% Recursive case: if the head of the list is a member of the tail,
% do not include the head in the result.
remove_duplicates([Head|Tail], Result) :-   
    member(Head, Tail),                     % Check if Head is in Tail
    remove_duplicates(Tail, Result).        % Continue with the tail

% Recursive case: if the head of the list is not a member of the tail,
% include the head in the result.
remove_duplicates([Head|Tail], [Head|Result]) :-
    \+ member(Head, Tail),                  % Check if Head is not in Tail
    remove_duplicates(Tail, Result).        % Continue with the tail and include Head
