
% *******************************************************************************************************
%                                  Summing Even Numbers in Each Column of a Matrix                      *
%                                                                                                       *
%      This predicate calculates the sum of all even numbers in each column of a matrix.                *
%                                                                                                       *
%      Usage: sum_even_numbers_in_columns(Matrix, Sums)                                                 *
%          - Matrix: The input matrix.                                                                  *
%          - Sums: A list containing the sum of even numbers for each column.                           *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- sum_even_numbers_in_columns([[1, 2, 3], [4, 5, 6]], Sums).                      *
%                                      Sums = [4, 2, 6].                                                *
% *******************************************************************************************************



% ------------------------------Main predicate to sum even numbers in each column of a matrix----------------------------------------

sum_even_numbers_in_columns(Matrix, Sums) :-
    transpose(Matrix, TransposedMatrix),                                % Transpose the matrix to process columns as rows
    sum_even_numbers_in_rows(TransposedMatrix, Sums).                   % Use the row-summing predicate on the transposed matrix


% ----------------------------------------Helper predicate to transpose a matrix-----------------------------------------------------

transpose([], []).
transpose([[]|_], []).
transpose(Matrix, [Row|Transposed]) :-
    transpose_first_column(Matrix, Row, RestMatrix),                    % Extract the first column as a row
    transpose(RestMatrix, Transposed).                                  % Recursively transpose the remaining matrix


% -------------------------------Helper predicate to extract the first column from a matrix-----------------------------------------

transpose_first_column([], [], []).
transpose_first_column([[H|T]|Rest], [H|Col], [T|RestMatrix]) :-
    transpose_first_column(Rest, Col, RestMatrix).                      % Recursively extract columns from the remaining rows


% ------------------------------------Helper predicate to sum even numbers in a list------------------------------------------------

sum_even_numbers([], 0).
sum_even_numbers([H|T], Sum) :-
    sum_even_numbers(T, RestSum),                                       % Recursively sum the rest of the list
    (0 is H mod 2 -> Sum is H + RestSum;                                % Add the element if it is even
    Sum is RestSum).                                                    % Otherwise, ignore the element
