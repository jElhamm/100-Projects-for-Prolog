
% *******************************************************************************************************
%                                   Summing Odd Elements in a List                                      *
%                                                                                                       *
%      This predicate calculates the sum of all odd elements in a list. It recursively checks each      *
%      element and adds it to the accumulator if it is odd.                                             *
%                                                                                                       *
%      Usage: sum_odd_elements(List, Sum)                                                               *
%          - List: The input list.                                                                      *
%          - Sum: The sum of odd elements in the list.                                                  *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- sum_odd_elements([1, 2, 3, 4], Sum).                                            *
%                            Sum = 4.                                                                   *
%                                                                                                       *
%                    ?- sum_odd_elements([5, 7, 8], Sum).                                               *
%                            Sum = 12.                                                                  *
%                                                                                                       *
% *******************************************************************************************************



% ----------------------------------------Main predicate to sum odd elements----------------------------------------

sum_odd_elements(List, Sum) :-
    sum_odd_elements(List, 0, Sum).                                     % Initialize accumulator to 0


% ------------------------------Base case: An empty list results in the accumulated sum-----------------------------------

sum_odd_elements([], Sum, Sum).


% ----------------------------------Recursive case: Head is odd, add to accumulator---------------------------------------

sum_odd_elements([H|T], Acc, Sum) :-
    1 is H mod 2,                                                       % Check if the element is odd
    NewAcc is Acc + H,                                                  % Update accumulator
    sum_odd_elements(T, NewAcc, Sum).                                   % Recursively process the rest of the list


% ------------------------------------Recursive case: Head is not odd, skip it----------------------------------------

sum_odd_elements([_|T], Acc, Sum) :-
    sum_odd_elements(T, Acc, Sum).                                      % Recursively process the rest of the list
