% *******************************************************************************************************
%                                   Transposing a Matrix                                                *
%                                                                                                       *
%      This predicate transposes a matrix represented as a list of lists, where each inner list         *
%      represents a row. The transposition swaps rows and columns, turning rows into columns and        *
%      vice versa.                                                                                      *
%                                                                                                       *
%      Usage: transpose_matrix(Matrix, Transposed)                                                      *
%          - Matrix: Input matrix to be transposed.                                                     *
%          - Transposed: Resulting transposed matrix.                                                   *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- transpose_matrix([[1, 2, 3], [4, 5, 6]], Transposed).                           *
%                            Transposed = [[1, 4], [2, 5], [3, 6]].                                     *
%                                                                                                       *
%                             ?- transpose_matrix([], Transposed).                                      *
%                                     Transposed = [].                                                  *
%                                                                                                       *
%                        ?- transpose_matrix([[], [], []], Transposed).                                 *
%                                    Transposed = [].                                                   *
%                                                                                                       *
%      Notes:                                                                                           *
%          - If the input matrix has empty rows, they are treated as nonexistent in the transposed      *
%            matrix due to the base case handling.                                                      *
%          - This predicate assumes rectangular matrices (all rows have the same length), otherwise     *
%            it may not function correctly.                                                             *
% *******************************************************************************************************





% ---------------------------------------------transpose_matrix predicate transposes a matrix-----------------------------------------------

transpose_matrix(Matrix, Transposed) :-
    transpose_matrix(Matrix, [], Transposed).


% ----------------------------------------Base case: Transposing an empty matrix results in itself------------------------------------------

transpose_matrix([], Transposed, Transposed).
transpose_matrix([[]|_], Transposed, Transposed).                                               % Handling matrices with empty rows (which are not valid, but handled)


% --------------------------------------------------------Transpose the matrix---------------------------------------------------------------

transpose_matrix(Matrix, Temp, Transposed) :-
    transpose_column(Matrix, Col, RestMatrix),                                                  % Extract a column from the matrix and the rest of the transposed matrix
    append(Temp, [Col], NewTemp),                                                               % Append the extracted column to the temporary transposed result
    transpose_matrix(RestMatrix, NewTemp, Transposed).                                          % Recursively transpose the rest of the matrix


% ------------------------------------transpose_column predicate extracts the first column from the matrix---------------------------------------

% Usage: transpose_column(Matrix, Column, RestMatrix)
transpose_column([], [], []).


% -------------------------------------------Extract the first element of each row as a column------------------------------------------------

transpose_column([[H|T]|RestMatrix], [H|Col], [T|RestTransposed]) :-
    transpose_column(RestMatrix, Col, RestTransposed).                                          % Recursively extract columns from the remaining rows
