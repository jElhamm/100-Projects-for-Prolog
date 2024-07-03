%************************************************************************************************
%                                                                                               *
%                                 Sublist Predicate                                             * 
%                                                                                               *
%       This code defines a predicate sublist/2, which checks if the first list is a sublist    *
%       of the second list. It consists of two rules:                                           *
%                                                                                               *
%           1. The base case specifies that an empty list is a sublist of any list.             *
%           2. The recursive cases check two possibilities:                                     *
%               - Include the current element of the first list and recursively check the       *
%                 remaining elements.                                                           *
%               - Skip the current element of the second list and check with the rest.          *
%                                                                                               *
%                                    Example usage:                                             *
%                        ?- sublist([b, c], [a, b, c, d]).                                      *
%                                       true.                                                   *
%                        ?- sublist([e, f], [a, b, c, d]).                                      *
%                                       false.                                                  *
%                                                                                               *
%************************************************************************************************



% Base case: An empty list is always a sublist.
sublist([], _).

% Recursive cases: Check if Xs is a sublist of Ys.
sublist([X|Xs], [X|Ys]) :-                          % Include the current element of Xs in Ys
    sublist(Xs, Ys).
sublist(Xs, [_|Ys]) :-                              % Skip the current element of Ys
    sublist(Xs, Ys).
