% *******************************************************************************************************
%                                 Calculating the Mean of a List                                        *
%                                                                                                       *
%      This predicate calculates the mean (average) value of a list of numbers.                         *
%                                                                                                       *
%      Usage: mean(List, Mean)                                                                          *
%          - List: The input list of numbers.                                                           *
%          - Mean: The calculated mean value of the list.                                               *
%                                                                                                       *
%                                       Example usage:                                                  *
%                                ?- mean([1, 2, 3, 4, 5], Mean).                                        *
%                                        Mean = 3.0.                                                    *
% *******************************************************************************************************



% ----------------------------------------Main predicate to calculate the mean----------------------------------------

mean(List, Mean) :-
    sum_list(List, Sum),                                    % Calculate the sum of the list
    length(List, Length),                                   % Get the length of the list
    Length > 0,                                             % Ensure the list is not empty
    Mean is Sum / Length.                                   % Calculate the mean


% ----------------------------------------Helper predicate to sum the elements of a list----------------------------------------

sum_list([], 0).
sum_list([Head|Tail], Sum) :-
    sum_list(Tail, Rest),                                   % Recursively sum the rest of the list
    Sum is Head + Rest.                                     % Add the head element to the sum
