%****************************************************************************************************
%                                                                                                   *
%                                       Quick Sort                                                  *
%                                                                                                   *
%                This code implements the quick sort algorithm in Prolog.                           *
%        The algorithm selects a pivot element and partitions the list into two parts:              *
%        one with elements less than or equal to the pivot and one with elements greater.           *
%        It then recursively sorts the partitions.                                                  *
%                                                                                                   *
%               Quick sort is an efficient sorting algorithm implemented                            *
%                    here using Prolog is backtracking capabilities.                                *
%                                                                                                   *
%                                      Example usage:                                               *
%                      ?- quick_sort([5, 3, 8, 2, 7, 1, 9, 4, 6], Sorted).                          *
%                           Sorted = [1, 2, 3, 4, 5, 6, 7, 8, 9]                                    *
%                                                                                                   *
%****************************************************************************************************



%-----------------------------quick_sort(List, SortedList) - sorts List into SortedList using quick sort------------------------------

quick_sort([], []).                                                 % Base case: an empty list is already sorted
quick_sort([X], [X]).                                               % Base case: a list with one element is already sorted
quick_sort([Pivot | Rest], SortedList) :-                           % Recursive case: partition the list and sort the partitions
    partition(Pivot, Rest, Less, Greater),                          % Partition the list into two parts
    quick_sort(Less, SortedLess),                                   % Recursively sort the less-than-or-equal partition
    quick_sort(Greater, SortedGreater),                             % Recursively sort the greater-than partition
    append(SortedLess, [Pivot | SortedGreater], SortedList).        % Combine the sorted partitions with the pivot


%---------------------------partition(Pivot, List, Less, Greater) - partitions List around Pivot---------------------------------------

partition(_, [], [], []).                                           % Base case: empty list results in two empty partitions
partition(Pivot, [X | Rest], [X | Less], Greater) :-                % Case: X =< Pivot, add to less-than-or-equal partition
    X =< Pivot,
    partition(Pivot, Rest, Less, Greater).
partition(Pivot, [X | Rest], Less, [X | Greater]) :-                % Case: X > Pivot, add to greater-than partition
    X > Pivot,
    partition(Pivot, Rest, Less, Greater).


%---------------------------append(List1, List2, Result) - concatenates List1 and List2 into Result-------------------------------------

append([], List, List).                                             % Base case: appending an empty list to a list results in the second list
append([Head | Tail1], List2, [Head | TailResult]) :-               % Recursive case: appending [Head | Tail1] to List2 results in [Head | TailResult]
    append(Tail1, List2, TailResult).
