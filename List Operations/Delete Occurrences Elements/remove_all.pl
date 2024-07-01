%****************************************************************************************************
%                                                                                                   *
%                                          Remove All                                               *
%                                                                                                   *
%       1. The first line is a base case that states that when trying to remove all occurrences     *
%          of any element from an empty list, the resulting list is also empty.                     *
%                                                                                                   *
%       2. The second line defines a rule that states if the element to be removed is the head      *
%          of the list, the predicate `remove_all` is called recursively to remove the element      *
%          from the tail of the list, resulting in the `Result`.                                    *
%                                                                                                   *
%       3. The third line defines another rule that states if the element to be removed is not      *
%          the head of the list, the head of the list is kept as is, and the `remove_all`           *
%          predicate is called recursively to remove the element from the tail of the list,         *
%          resulting in `[Head|Result]`.                                                            *
%                                                                                                   *
%       In summary, the `remove_all` predicate, when given an element and a list, removes all       *
%       occurrences of the element from the list and returns the resulting list as the output.      *
%                                                                                                   *
%                                                                                                   *
%                                       Example usage:                                              *
%                        ?- remove_all(2,[1, 2, 3, 2, 56, 2, 4], Result)                            *
%                                    Result = [1, 3, 56, 4].                                        *
%                                                                                                   *
%****************************************************************************************************





% Base case: Removing all occurrences of a specific element from an empty list results in an empty list.
remove_all(_, [], []).                   

% If the element to be removed is the head of the list, then skip the head and 
% continue to remove the element from the rest of the list.
remove_all(X, [X|Tail], Result) :-       
    remove_all(X, Tail, Result).

% If the element to be removed is not the head, then keep the head and 
%continue to remove the element from the rest of the list.
remove_all(X, [Head|Tail], [Head|Result]) :- 
    remove_all(X, Tail, Result).
