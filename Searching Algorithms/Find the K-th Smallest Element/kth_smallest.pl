%****************************************************************************************************
%                                                                                                   *
%                               Find the K-th Smallest Element in a List                            *
%                                                                                                   *
%       The given Prolog code defines a predicate to find the K-th smallest element in a list.      *
%       The `kth_smallest` predicate is defined as follows:                                         *
%       1. The list is sorted in ascending order using the `sort/2` predicate.                      *
%       2. The `nth1/3` predicate retrieves the K-th element (1-based indexing) from the sorted list.*
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- kth_smallest(3, [5, 1, 4, 2, 3], Element).                           *
%                                        Element = 3                                                *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------Find the k-th smallest element in a list-----------------------------------------

% The predicate to find the K-th smallest element in a list.
kth_smallest(K, List, Element) :-
    sort(List, SortedList),                                 % Sort the list in ascending order.
    nth1(K, SortedList, Element).                           % Retrieve the K-th element from the sorted list.


% -----------------------------------------nth1(Index, List, Element)-----------------------------------------
%                  is a built-in predicate that retrieves the K-th element (1-based indexing).


% Base case: Retrieves the 1st element from the list.
nth_element(1, [X|_], X).

% Recursive case: Retrieves the Nth element from the tail of the list.
nth_element(N, [_|Tail], X) :-
  N > 1,
  N1 is N - 1,
  nth_element(N1, Tail, X).