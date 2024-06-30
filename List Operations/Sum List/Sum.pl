%********************************************************************************************
%                                                                                           *
%                                         Sum List                                          *
%                                                                                           *
%        sum_list calculates the sum of elements in a list Takes a list of numbers as       *
%        the first argument and returns the sum as the second argument                      *  
%                                                                                           *
%                                   Example usage:                                          *
%                          ?- sum_list([1, 2, 3, 4, 5], X).                                 *
%                                     X = 15.                                               *
%                          ?- sum_list([3, 5, 2], X).                                       *
%                                     X = 10.                                               *
%                          ?- sum_list([], X).                                              *
%                                     X = 0.                                                *
%                                                                                           *
%********************************************************************************************




% sum_list/2 calculates the sum of elements in a list
sum_list([], 0).                                % Base case: sum of an empty list is 0

sum_list([Head|Tail], Sum) :-
    sum_list(Tail, TailSum),                    % Recursively calculate sum of the tail
    Sum is Head + TailSum.                      % Sum is the head plus the sum of the tail
    