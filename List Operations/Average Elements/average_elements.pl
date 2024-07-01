%****************************************************************************************************
%                                                                                                   *
%                                       Average Elements                                            *
%                                                                                                   *
%       The given Prolog code defines predicates to calculate the average of a list of numbers.     *
%       The `list_sum` predicate recursively calculates the sum of the elements in the input list,  *
%       while the `list_length` predicate recursively determines the length of the list.            *
%                                                                                                   *
%       The `list_average` predicate then utilizes the results of `list_sum` and `list_length`      *
%       to calculate the average, taking care to avoid division by zero. If the length of the       *
%       list is greater than zero, the average is computed by dividing the sum of the elements      *
%       by the length; otherwise, the average is not computed.                                      *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- list_average([1, 2, 3, 4, 5], Average).                              *
%                                        Reversed = 3                                               *
%                                                                                                   *
%****************************************************************************************************



list_average(List, Average) :-
    list_sum(List, Sum),                    % Calculate the sum of the elements in the list
    list_length(List, Length),              % Calculate the length of the list
    Length > 0,                             % Avoid division by zero
    Average is Sum / Length.                % Calculate the average

list_sum([], 0).                            % Base case: sum of an empty list is 0
list_sum([Head|Tail], Sum) :-
    list_sum(Tail, SumTail),                % Recursive call to sum the tail of the list
    Sum is Head + SumTail.                  % Calculate the sum

list_length([], 0).                         % Base case: length of an empty list is 0
list_length([_|Tail], Length) :-
    list_length(Tail, LengthTail),          % Recursive call to find the length of the tail
    Length is LengthTail + 1.               % Calculate the length
