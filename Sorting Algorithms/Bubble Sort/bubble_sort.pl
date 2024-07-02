%****************************************************************************************************
%                                                                                                   *
%                                         Bubble Sort                                               *
%                                                                                                   *
%         This code implements the bubble sort algorithm in Prolog.                                 *
%         The algorithm repeatedly steps through the list, compares adjacent items                  *
%         and swaps them if they are in the wrong order. The pass through the list is               *
%         repeated until the list is sorted.                                                        *
%                                                                                                   *
%                   Bubble sort is a simple sorting algorithm suitable                              *
%               for small lists and is implemented here using Prolog is                             *
%                             backtracking capabilities.                                            *
%                                                                                                   *
%                                       Example usage:                                              *
%                          ?- bubble_sort([5, 3, 8, 2, 7, 1, 9, 4, 6], Sorted).                     *
%                              Sorted = [1, 2, 3, 4, 5, 6, 7, 8, 9]                                 *
%                                                                                                   *
%****************************************************************************************************




%----------------------------bubble_sort(List, SortedList) - sorts List into SortedList using bubble sort----------------------------------

bubble_sort(List, SortedList) :-
    bubble_sort_pass(List, TempList, 0, Flag),                      % Perform one pass of bubble sort
    (Flag = 1 -> bubble_sort(TempList, SortedList)                  % If swaps were made, continue sorting
    ; SortedList = TempList).                                       % If no swaps were made, the list is sorted


%------------------------bubble_sort_pass(List, ResultList, Index, Flag) - performs one pass of bubble sort------------------------------

bubble_sort_pass([], [], _, 0).                                      % Base case: empty list
bubble_sort_pass([X], [X], _, 0).                                    % Base case: single element list
bubble_sort_pass([X, Y | Rest], [Y | SortedRest], Index, 1) :-       % Case: X > Y, swap needed
    X > Y,
    bubble_sort_pass([X | Rest], SortedRest, Index + 1, _).          % Set flag to 1 indicating a swap
bubble_sort_pass([X, Y | Rest], [X | SortedRest], Index, Flag) :-    % Case: X <= Y, no swap needed
    X =< Y,
    bubble_sort_pass([Y | Rest], SortedRest, Index + 1, Flag).       % Continue to next elements


%---------------------------append(List1, List2, Result) - concatenates List1 and List2 into Result--------------------------------------

append([], List, List).                                             % Base case: appending an empty list to a list results in the second list
append([Head|Tail1], List2, [Head|TailResult]) :-                   % Recursive case: appending [Head|Tail1] to List2 results in [Head|TailResult]
    append(Tail1, List2, TailResult).
