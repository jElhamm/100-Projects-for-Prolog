%****************************************************************************************************
%                                                                                                   *
%                                    Find Second Smallest Element                                   *
%                                                                                                   *
%       The given Prolog code defines a predicate to find the second smallest element in a list.    *
%       The `second_smallest` predicate is defined as follows:                                      *
%       1. The `sort(List, SortedList)` predicate sorts the input list in ascending order.          *
%       2. The `nth1(2, SortedList, SecondSmallest)` predicate retrieves the second element from    *
%          the sorted list, which is the second smallest element in the original list.              *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- second_smallest([5, 3, 9, 1, 4], SecondSmallest).                    *
%                                        SecondSmallest = 3                                         *
%                                                                                                   *
%****************************************************************************************************




% -----------------------------------------second_smallest(List, SecondSmallest)--------------------------------------------

% The predicate to find the second smallest element in a list.
second_smallest(List, SecondSmallest) :-
    sort(List, SortedList),                                         % Sort the input list in ascending order.
    nth1(2, SortedList, SecondSmallest).                            % Retrieve the second element from the sorted list.



% ---------------------------------------------Nth Element Retrieval-----------------------------------------------

% Base case: Retrieves the 1st element from the list.
nth_element(1, [X|_], X).

% Recursive case: Retrieves the Nth element from the tail of the list.
nth_element(N, [_|Tail], X) :-
    N > 1,
    N1 is N - 1,
    nth_element(N1, Tail, X).
