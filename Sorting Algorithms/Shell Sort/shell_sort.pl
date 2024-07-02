%****************************************************************************************************
%                                                                                                   *
%                                        Shell Sort                                                 *
%                                                                                                   *
%                  This code implements the shell sort algorithm in Prolog.                         *
%       The algorithm sorts elements at a specific interval and then reduces the interval           *
%       until it reaches 1, at which point it effectively becomes insertion sort.                   *
%                                                                                                   *
%                  Shell sort is a generalization of insertion sort that allows                     *
%                  the exchange of far-apart elements and is implemented                            *
%                       here using Prolog is backtracking capabilities.                             *
%                                                                                                   *
%                                      Example usage:                                               *
%                      ?- shell_sort([5, 3, 8, 2, 7, 1, 9, 4, 6], Sorted).                          *
%                           Sorted = [9, 8, 7, 6, 5, 4, 3, 2, 1]                                    *
%                                                                                                   *
%****************************************************************************************************




%----------------------------shell_sort(List, SortedList) - sorts List into SortedList using shell sort-------------------------------

shell_sort(List, SortedList) :-
    length(List, N),
    generate_gaps(N, Gaps),
    shell_sort_helper(List, Gaps, SortedList).


%-----------shell_sort_helper(List, Gaps, SortedList) - helper predicate for shell sort using the gap sequence------------------------

shell_sort_helper(List, [], List).                                    % Base case: no more gaps to process
shell_sort_helper(List, [Gap | Gaps], SortedList) :-                  % Recursive case: process current gap and move to the next
    shell_sort_gap(List, Gap, 0, GapSortedList),
    shell_sort_helper(GapSortedList, Gaps, SortedList).


%----------------------shell_sort_gap(List, Gap, Start, SortedList) - sorts elements at intervals of Gap------------------------------

shell_sort_gap(List, Gap, Start, SortedList) :-
    findall(X, (nth0(Index, List, X), Index mod Gap =:= Start), Sublist),  % Create sublist with elements at intervals of Gap
    insertion_sort_desc(Sublist, SortedSublist),                          % Sort the sublist in descending order
    replace_elements(List, SortedSublist, Gap, Start, SortedList).        % Replace elements in the original list


%-------------------insertion_sort_desc(List, SortedList) - sorts List into SortedList using insertion sort in descending order---------

insertion_sort_desc(List, SortedList) :-
    insertion_sort_helper_desc(List, [], SortedList).


%--------insertion_sort_helper_desc(Unsorted, SortedSoFar, Sorted) - helper predicate for insertion sort in descending order------------

insertion_sort_helper_desc([], Sorted, Sorted).                          % Base case: when input list is empty, sorted list is complete
insertion_sort_helper_desc([X | Rest], SortedSoFar, Sorted) :-           % Recursive case: insert head into sorted part
    insert_desc(X, SortedSoFar, NewSortedSoFar),                         % Insert head into the sorted part of the list
    insertion_sort_helper_desc(Rest, NewSortedSoFar, Sorted).            % Recursively sort the remaining list


%--------------------insert_desc(Element, SortedList, NewSortedList) - inserts Element into SortedList in descending order--------------

insert_desc(X, [], [X]).                                                 % Base case: inserting into an empty list
insert_desc(X, [Y | Rest], [X, Y | Rest]) :-                             % Case: X >= Y, insert before Y
    X >= Y.
insert_desc(X, [Y | Rest], [Y | NewRest]) :-                             % Case: X < Y, insert into the rest of the list
    X < Y,
    insert_desc(X, Rest, NewRest).


%---------replace_elements(List, Sublist, Gap, Start, Result) - replaces elements in List with Sublist at intervals of Gap-------------

replace_elements(List, [], _, _, List).                                  % Base case: no more elements to replace
replace_elements(List, [X | SubRest], Gap, Start, Result) :-
    nth0(Start, List, _, TempList),                                      % Remove the element at position Start
    nth0(Start, NewList, X, TempList),                                   % Insert the new element at position Start
    NextStart is Start + Gap,                                            % Move to the next position based on the gap
    replace_elements(NewList, SubRest, Gap, NextStart, Result).          % Recursively replace the remaining elements


%--------------------------generate_gaps(N, Gaps) - generates the gap sequence for shell sort-----------------------------------------

generate_gaps(N, Gaps) :-
    N > 1,
    Half is N // 2,
    generate_gaps(Half, HalfGaps),
    Gaps = [Half | HalfGaps].
generate_gaps(1, [1]).
generate_gaps(0, []).
