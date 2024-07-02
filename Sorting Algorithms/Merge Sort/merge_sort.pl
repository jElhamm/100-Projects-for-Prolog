        %****************************************************************************************************
        %                                                                                                   *
        %                                         Merge Sort                                                *
        %                                                                                                   *
        %                   This code implements the merge sort algorithm in Prolog.                        *
        %          The algorithm first divides the input list into two halves, then recursively             *
        %         sorts each half, and finally merges the two halves to produce the sorted list.            *
        %                                                                                                   *
        %                   Divide and conquer is a classic recursive algorithm,                            *
        %               implemented here using Prolog is backtracking capabilities.                         *
        %                                                                                                   *
        %                                       Example usage:                                              *
        %                        ?- merge_sort([5, 3, 8, 2, 7, 1, 9, 4, 6], Sorted).                        *
        %                              Sorted = [1, 2, 3, 4, 5, 6, 7, 8, 9]                                 *
        %                                                                                                   *
        %****************************************************************************************************




%------------------------------merge_sort(List, SortedList) - sorts List into SortedList using merge sort--------------------------------------------------

merge_sort([], []).                                                 % Base case: an empty list is already sorted
merge_sort([X], [X]).                                               % Base case: a list with one element is already sorted
merge_sort(List, SortedList) :-                                     % Recursive case: split the list, sort each half, and merge the sorted halves
    split_list(List, Left, Right),                                  % Split the list into two halves
    merge_sort(Left, SortedLeft),                                   % Recursively sort each half
    merge_sort(Right, SortedRight),                 
    merge(SortedLeft, SortedRight, SortedList).                     % Merge the sorted halves


%------------------------------split_list(List, Left, Right) - splits List into two halves Left and Right--------------------------------------------------

split_list(List, Left, Right) :-
    length(List, Length),
    Half is Length // 2,
    length(Left, Half),
    append(Left, Right, List).


%-----------------------------merge(Left, Right, Merged) - merges two sorted lists Left and Right into Merged----------------------------------------------

merge([], Right, Right).                                            % Base case: merging an empty list with a list gives the list
merge(Left, [], Left).                                              % Base case: merging a list with an empty list gives the list
merge([H1|Left], [H2|Right], [H1|Merged]) :-                        % Case 1: H1 <= H2
    H1 =< H2,
    merge(Left, [H2|Right], Merged).
merge([H1|Left], [H2|Right], [H2|Merged]) :-                        % Case 2: H1 > H2
    H1 > H2,
    merge([H1|Left], Right, Merged).


%------------------------------append(List1, List2, Result) - concatenates List1 and List2 into Result-----------------------------------------------------

append([], List, List).                                             % Base case: appending an empty list to a list results in the second list
append([Head|Tail1], List2, [Head|TailResult]) :-                   % Recursive case: appending [Head|Tail1] to List2 results in [Head|TailResult]
    append(Tail1, List2, TailResult).
    