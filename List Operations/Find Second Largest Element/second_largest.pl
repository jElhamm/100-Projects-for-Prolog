%****************************************************************************************************
%                                                                                                   *
%                                    Find Second Largest Element                                    *
%                                                                                                   *
%       The given Prolog code defines a predicate to find the second largest element in a list.     *
%       The `second_largest` predicate is defined as follows:                                       *
%       1. The `sort(0, @>=, List, SortedList)` predicate sorts the input list in descending order.  *
%       2. The `nth1(2, SortedList, SecondLargest)` predicate retrieves the second element from     *
%          the sorted list, which is the second largest element in the original list.               *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- second_largest([5, 3, 9, 1, 4], SecondLargest).                      *
%                                        SecondLargest = 5                                          *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------second_largest(List, SecondLargest)-----------------------------------------------

% The predicate to find the second largest element in a list.
second_largest(List, SecondLargest) :-
    sort(0, @>=, List, SortedList),                                      % Sort the input list in descending order.
    nth1(2, SortedList, SecondLargest).                                  % Retrieve the second element from the sorted list.



% ---------------------------------------------Nth Element Retrieval-----------------------------------------------

% Base case: Retrieves the 1st element from the list.
nth_element(1, [X|_], X).

% Recursive case: Retrieves the Nth element from the tail of the list.
nth_element(N, [_|Tail], X) :-
    N > 1,
    N1 is N - 1,
    nth_element(N1, Tail, X).
