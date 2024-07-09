%*****************************************************************************************************
%                                                                                                    *
%                                Predicate to Find the Length of a String                            *
%                                                                                                    *
%  The following Prolog code defines predicates `my_string_length/2` and `my_string_length/3`        *
%  to find the length of a string using an accumulator.                                              *
%                                                                                                    *
%  - `my_string_length/2`: Entry point to find the length of a string.                               *
%  - `my_string_length/3`: Helper predicate that recursively finds the length using an accumulator.  *
%                                                                                                    *
%                                       Example usage:                                               *
%                           ?- my_string_length("hello", Length).                                    *
%                                       Length = 5                                                   *
%                                                                                                    *
%*****************************************************************************************************



% ----------------------------------------Predicate to find the length of a string----------------------------------------

my_string_length(String, Length) :-
    my_string_length(String, 0, Length).                % Initiate with accumulator set to 0


% ----------------------------------------Helper predicate to find the length of a string using an accumulator----------------------------------------

my_string_length([], Acc, Acc).                         % Base case: Empty list/string, return accumulated length
my_string_length([_|T], Acc, Length) :-                 % Recursive case: Count characters using accumulator
    NewAcc is Acc + 1,                                  % Increment accumulator for current character
    my_string_length(T, NewAcc, Length).                % Recursively find length of the rest of the string
