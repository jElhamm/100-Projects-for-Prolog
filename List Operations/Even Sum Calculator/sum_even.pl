%****************************************************************************************************
%                                                                                                   *
%                                           Sum Even                                                *
%                                                                                                   *
%         Define a predicate to calculate the sum of even numbers in a list.                        *
%         sum_even(List, Sum) is true if Sum is the sum of all even numbers in the List.            *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- sum_even([1, 2, 3, 4, 5, 6], Sum).                                   *
%                                         Sum = 12.                                                 *
%                                                                                                   *
%****************************************************************************************************





% Base case: The sum of even numbers in an empty list is 0.
sum_even([], 0).

% Recursive case 1: If the head of the list is even, 
% add it to the sum of the even numbers in the tail.
sum_even([Head|Tail], Sum) :-
    Head mod 2 =:= 0,                               % If the head is even
    sum_even(Tail, SumTail),                        % Sum of even numbers in the tail
    Sum is Head + SumTail.                          % Sum is the head plus the sum of even numbers in the tail.

% Recursive case 2: If the head of the list is not even, skip it.
sum_even([_|Tail], Sum) :-
    sum_even(Tail, Sum).
