
% *******************************************************************************************************
%                                Calculating the Mean and Variance of a List                            *
%                                                                                                       *
%      This set of predicates calculates the mean (average) and variance of a list of numbers.          *
%                                                                                                       *
%      Usage: mean(List, Mean)                                                                          *
%             variance(List, Variance)                                                                  *
%          - List: The input list of numbers.                                                           *
%          - Mean: The calculated mean value of the list.                                               *
%          - Variance: The calculated variance value of the list.                                       *
%                                                                                                       *
%                                       Example usage:                                                  *
%                                ?- mean([1, 2, 3, 4, 5], Mean).                                        *
%                                     Mean = 3.0.                                                       *
%                                ?- variance([1, 2, 3, 4, 5], Variance).                                *
%                                     Variance = 2.0.                                                   *
% *******************************************************************************************************



% ---------------------------------------Predicate to calculate the mean of a list-------------------------------------------------------------

mean(List, Mean) :-
    sum_list(List, Sum),                                                                            % Calculate the sum of the list
    length(List, Length),                                                                           % Get the length of the list
    Length > 0,                                                                                     % Ensure the list is not empty
    Mean is Sum / Length.                                                                           % Calculate the mean


% ---------------------------------------Predicate to calculate the variance of a list---------------------------------------------------------

variance(List, Variance) :-
    mean(List, Mean),                                                                               % Calculate the mean of the list
    findall(Square, (member(X, List), Diff is X - Mean, Square is Diff * Diff), Squares),           % Calculate the squared differences
    sum_list(Squares, SumSquares),                                                                  % Sum the squared differences
    length(List, Length),                                                                           % Get the length of the list
    Length > 0,                                                                                     % Ensure the list is not empty
    Variance is SumSquares / Length.                                                                % Calculate the variance
