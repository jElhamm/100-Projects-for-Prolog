%****************************************************************************************************
%                                                                                                   *
%                                       Insertion Sort                                              *
%                                                                                                   *
%                 This code implements the insertion sort algorithm in Prolog.                      *
%           The algorithm builds the sorted list one element at a time by comparing each            *
%           element with the elements in the sorted part of the list and inserting it in            *
%           the correct position.                                                                   *
%                                                                                                   *
%                 Insertion sort is a simple and intuitive sorting algorithm                        *
%                 implemented here using Prolog is backtracking capabilities.                       *
%                                                                                                   *
%                                       Example usage:                                              *
%                       ?- insertion_sort([5, 3, 8, 2, 7, 1, 9, 4, 6], Sorted).                     *
%                             Sorted = [1, 2, 3, 4, 5, 6, 7, 8, 9]                                  *
%                                                                                                   *
%****************************************************************************************************


%-------------------------insertion_sort(List, SortedList) - sorts List into SortedList using insertion sort----------------------------

insertion_sort(List, SortedList) :-
    insertion_sort_helper(List, [], SortedList).


%------------insertion_sort_helper(Unsorted, SortedSoFar, Sorted) - helper predicate for insertion sort----------------------------

insertion_sort_helper([], Sorted, Sorted).                           % Base case: when input list is empty, sorted list is complete
insertion_sort_helper([X | Rest], SortedSoFar, Sorted) :-            % Recursive case: insert head into sorted part
    insert(X, SortedSoFar, NewSortedSoFar),                          % Insert head into the sorted part of the list
    insertion_sort_helper(Rest, NewSortedSoFar, Sorted).             % Recursively sort the remaining list


%-----------------------insert(Element, SortedList, NewSortedList) - inserts Element into SortedList--------------------------------

insert(X, [], [X]).                                                  % Base case: inserting into an empty list
insert(X, [Y | Rest], [X, Y | Rest]) :-                              % Case: X <= Y, insert before Y
    X =< Y.
insert(X, [Y | Rest], [Y | NewRest]) :-                              % Case: X > Y, insert into the rest of the list
    X > Y,
    insert(X, Rest, NewRest).
