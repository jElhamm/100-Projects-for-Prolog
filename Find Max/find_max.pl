%****************************************************************************************************
%                                                                                                   *
%                                          MAX List                                                 *
%                                                                                                   *
%       This Prolog program defines a predicate `max_list/2` that finds the maximum                 *
%       element in a list of numbers. The predicate has two cases:                                  *
%                                                                                                   *
%       1. Base case: When the list has only one element, that element is the maximum.              *
%       2. Recursive case: For a list with a head and a tail, the maximum element                   *
%       is determined by comparing the head with the maximum element of the tail.                   *
%                                                                                                   *
%       The `max_list/2` predicate takes two arguments:                                             *
%           - The first argument is a list of numbers.                                              *
%           - The second argument is a variable that will be unified with                           *
%             the maximum number in the list.                                                       *
%                                                                                                   *
%                                      Example usage:                                               *
%                             ?- max_list([3, 5, 2, 9, 1], Max).                                    *
%                                           Max = 9.                                                *
%                                                                                                   *
%****************************************************************************************************



% Base case: the maximum of a list with one element is the element itself.
max_list([X], X).

% Recursive case: find the maximum element of the tail, 
% then the maximum of the head and the maximum of the tail.
max_list([Head|Tail], Max) :-        
    max_list(Tail, MaxTail),
    Max is max(Head, MaxTail).

% Test case
% Find the maximum element in the list [3, 5, 2, 9, 1].
% Expected result: Max = 9
