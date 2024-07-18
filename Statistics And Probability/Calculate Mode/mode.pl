% *******************************************************************************************************
%                                Counting Occurrences and Finding Mode in a List                        *
%                                                                                                       *
%      This set of predicates counts the occurrences of each element in a list and determines the mode  *
%      (the element with the highest occurrence).                                                       *
%                                                                                                       *
%      Usage: count_occurrences(List, Element, Count)                                                   *
%          - List: The input list of elements.                                                          *
%          - Element: The element whose occurrences are counted.                                        *
%          - Count: The number of occurrences of the element.                                           *
%          - ElementCounts: List of element-count pairs.                                                *
%          - Mode: The element with the highest occurrence.                                             *
%                                                                                                       *
%                                       Example usage:                                                  *
%                                ?- mode([1, 2, 2, 3, 3, 3, 4], Mode).                                  *
%                                          Mode = 3.                                                    *
% *******************************************************************************************************



% -----------------------------------------------Predicate to count the occurrences of each element in a list-----------------------------------------------

count_occurrences([], _, 0).                                                            % Base case: empty list
count_occurrences([X|T], X, Count) :-
    count_occurrences(T, X, RestCount),                                                 % Recursive count
    Count is RestCount + 1.                                                             % Increment count for the matching element
count_occurrences([Y|T], X, Count) :-
    X \= Y,                                                                             % Ignore non-matching elements
    count_occurrences(T, X, Count).                                                     % Continue with the rest of the list


% -----------------------------------------------Predicate to find all element-count pairs in a list-----------------------------------------------

element_counts([], []).                                                                 % Base case: empty list
element_counts([H|T], [H-Count|Counts]) :-
    count_occurrences([H|T], H, Count),                                                 % Count occurrences of the head element
    exclude(==(H), T, FilteredT),                                                       % Remove all occurrences of the head element
    element_counts(FilteredT, Counts).                                                  % Continue with the rest of the list


% -----------------------------------------------Predicate to find the element with the maximum occurrences (mode)-----------------------------------------------

max_occurrence([X], X).                                                                 % Base case: single element
max_occurrence([X-CountX, Y-CountY|T], Mode) :-
    (CountX >= CountY ->
        max_occurrence([X-CountX|T], Mode)                                              % Keep the element with the higher count
    ;
        max_occurrence([Y-CountY|T], Mode)                                              % Replace with the new element
    ).


% -----------------------------------------------Predicate to calculate the mode of a list-----------------------------------------------

mode(List, Mode) :-
    element_counts(List, Counts),                                                       % Get the list of element-count pairs
    max_occurrence(Counts, Mode).                                                       % Find the element with the maximum count
