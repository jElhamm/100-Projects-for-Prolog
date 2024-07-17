
% *******************************************************************************************************
%                                    Summing Odd Numbers in Each Row of a Matrix                        *
%                                                                                                       *
%      This predicate calculates the sum of all odd numbers in each row of a matrix.                    *
%                                                                                                       *
%      Usage: sum_odd_numbers_in_rows(Matrix, Sums)                                                     *
%          - Matrix: The input matrix.                                                                  *
%          - Sums: A list containing the sum of odd numbers for each row.                               *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- sum_odd_numbers_in_rows([[1, 2, 3], [4, 5, 6]], Sums).                          *
%                                       Sums = [4, 5].                                                  *
% *******************************************************************************************************



% ----------------------------------------Main predicate to sum odd numbers in each row of a matrix----------------------------------------

sum_odd_numbers_in_rows([], []).

sum_odd_numbers_in_rows([Row|RestMatrix], [Sum|RestSums]) :-
    sum_odd_numbers(Row, Sum),                                                  % Sum odd numbers in the current row
    sum_odd_numbers_in_rows(RestMatrix, RestSums).                              % Recursively process the remaining rows


% ----------------------------------------Helper predicate to sum odd numbers in a list----------------------------------------

sum_odd_numbers([], 0).

sum_odd_numbers([H|T], Sum) :-
    sum_odd_numbers(T, RestSum),                                                % Recursively sum the rest of the list
    (1 is H mod 2 -> Sum is H + RestSum;                                        % Add the element if it is odd
    Sum is RestSum).                                                            % Otherwise, ignore the element
