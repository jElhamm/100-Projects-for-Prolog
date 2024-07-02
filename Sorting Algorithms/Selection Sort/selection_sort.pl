%****************************************************************************************************
%                                                                                                   *
%                                       Selection Sort                                              *
%                                                                                                   *
%               This code implements the selection sort algorithm in Prolog.                        *
%     The algorithm repeatedly finds the minimum element from the unsorted part and                 *
%     moves it to the sorted part. This process continues until the entire list is sorted.          *
%                                                                                                   *
%             Selection sort is a simple sorting algorithm implemented here using                   *
%                       Prolog is backtracking capabilities.                                         *
%                                                                                                   *
%                                       Example usage:                                              *
%                     ?- selection_sort([5, 3, 8, 2, 7, 1, 9, 4, 6], Sorted).                       *
%                           Sorted = [1, 2, 3, 4, 5, 6, 7, 8, 9]                                    *
%                                                                                                   *
%****************************************************************************************************


%-------------------------selection_sort(List, SortedList) - sorts List into SortedList using selection sort----------------------------

selection_sort(List, SortedList) :-
    selection_sort_helper(List, [], SortedList).


%-----------selection_sort_helper(Unsorted, SortedSoFar, Sorted) - helper predicate for selection sort----------------------------

selection_sort_helper([], Sorted, Sorted).                          % Base case: when input list is empty, sorted list is complete
selection_sort_helper(Unsorted, SortedSoFar, Sorted) :-             % Recursive case: find the minimum element and sort the rest
    select_min(Unsorted, Min, RestUnsorted),                        % Find the minimum element and the rest of the list
    append(SortedSoFar, [Min], NewSortedSoFar),                     % Append the minimum element to the sorted list
    selection_sort_helper(RestUnsorted, NewSortedSoFar, Sorted).    % Recursively sort the remaining list


%-----------------------select_min(List, Min, Rest) - selects Min as the minimum element from List and Rest as the remaining list-----------------------------

select_min([X], X, []).                                             % Base case: single element list
select_min([X, Y | Rest], Min, [X | RestMin]) :-                    % Case: X =< Y, X remains the candidate for Min
    X =< Y,
    select_min([Y | Rest], Min, RestMin).
select_min([X, Y | Rest], Min, [Y | RestMin]) :-                    % Case: X > Y, Y is the new candidate for Min
    X > Y,
    select_min([X | Rest], Min, RestMin).
