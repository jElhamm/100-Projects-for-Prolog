% *******************************************************************************************************
%                                Finding Maximum, Minimum, and Range in a List                          *
%                                                                                                       *
%      This set of predicates finds the maximum and minimum elements in a list and calculates the range.*
%                                                                                                       *
%      Usage: max_element(List, Max)                                                                    *
%             min_element(List, Min)                                                                    *
%             range(List, Range)                                                                        *
%          - List: The input list of elements.                                                          *
%          - Max: The maximum element in the list.                                                      *
%          - Min: The minimum element in the list.                                                      *
%          - Range: The difference between the maximum and minimum elements in the list.                *
%                                                                                                       *
%                                         Example usage:                                                *
%                                ?- range([1, 2, 3, 4, 5], Range).                                      *
%                                           Range = 4.                                                  *
% *******************************************************************************************************



% -----------------------------------------------Predicate to find the maximum element in a list-----------------------------------------------

max_element([X], X).                                                        % Base case: single element
max_element([H|T], Max) :-
    max_element(T, MaxTail),                                                % Recursive call to find max in tail
    Max is max(H, MaxTail).                                                 % Compare head with max of tail


% -----------------------------------------------Predicate to find the minimum element in a list-----------------------------------------------

min_element([X], X).                                                        % Base case: single element
min_element([H|T], Min) :-
    min_element(T, MinTail),                                                % Recursive call to find min in tail
    Min is min(H, MinTail).                                                 % Compare head with min of tail


% -----------------------------------------------Predicate to calculate the range of a list-----------------------------------------------

range(List, Range) :-
    max_element(List, Max),                                                 % Find the maximum element
    min_element(List, Min),                                                 % Find the minimum element
    Range is Max - Min.                                                     % Calculate the range
