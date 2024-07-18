% *******************************************************************************************************
%                                Calculating the Standard Deviation of a List                           *
%                                                                                                       *
%      This predicate calculates the standard deviation of a list of numbers. The standard deviation    *
%      is the square root of the variance.                                                              *
%                                                                                                       *
%      Usage: standard_deviation(List, StdDev)                                                          *
%          - List: The input list of numbers.                                                           *
%          - StdDev: The calculated standard deviation of the list.                                     *
%                                                                                                       *
%                                       Example usage:                                                  *
%                                ?- standard_deviation([1, 2, 3, 4, 5], StdDev).                        *
%                                     StdDev = 1.4142135623730951.                                      *
% *******************************************************************************************************



% ---------------------------------Predicate to calculate the standard deviation of a list-------------------------------------

% Base case for sum_list
sum_list([], 0).
sum_list([H|T], Sum) :-
    sum_list(T, RestSum),
    Sum is H + RestSum.

% ------------------------------------------Predicate to calculate the mean of a list------------------------------------------

mean(List, Mean) :-
    sum_list(List, Sum),
    length(List, Length),
    Length > 0,
    Mean is Sum / Length.


% ---------------------------------------------------Base case for variance----------------------------------------------------

variance([], _, 0).
variance([H|T], Mean, Variance) :-
    variance(T, Mean, RestVariance),
    Variance is RestVariance + (H - Mean) * (H - Mean).


% ----------------------------------------Predicate to calculate the variance of a list----------------------------------------

variance(List, Variance) :-
    mean(List, Mean),
    variance(List, Mean, SumSqDiff),
    length(List, Length),
    Length > 0,
    Variance is SumSqDiff / Length.


% ----------------------------------Predicate to calculate the standard deviation of a list-------------------------------------

standard_deviation(List, StdDev) :-
    variance(List, Variance),
    StdDev is sqrt(Variance).
