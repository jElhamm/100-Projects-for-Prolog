% *******************************************************************************************************
%                                   Checking if a Matrix is Symmetric                                   *
%                                                                                                       *
%      This predicate checks if a matrix is symmetric. A matrix is symmetric if it is equal to its      *
%      transpose.                                                                                       *
%                                                                                                       *
%      Usage: is_symmetric_matrix(Matrix)                                                               *
%          - Matrix: The input matrix.                                                                  *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- is_symmetric_matrix([[1, 2, 3], [2, 4, 5], [3, 5, 6]]).                         *
%                            true.                                                                      *
%                                                                                                       *
%                    ?- is_symmetric_matrix([[1, 0, 0], [0, 1, 0], [1, 0, 1]]).                         *
%                            false.                                                                     *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to check if a matrix is symmetric---------------------------------------------

is_symmetric_matrix(Matrix) :-
    transpose_matrix(Matrix, Transposed),                                   % Transpose the matrix
    Matrix = Transposed.                                                    % Check if the matrix is equal to its transpose


% --------------------------------------------------Helper predicate to transpose a matrix--------------------------------------------------

transpose_matrix([], []).
transpose_matrix([[]|_], []).


% -----------------------------------Recursive case: Transpose the first column and process the rest----------------------------------------

transpose_matrix(Matrix, [Row|Transposed]) :-
    transpose_first_column(Matrix, Row, RestMatrix),                        % Extract first column
    transpose_matrix(RestMatrix, Transposed).                               % Recursively transpose remaining matrix


% ---------------------------------------------Helper predicate to extract the first column-------------------------------------------------

transpose_first_column([], [], []).


% ---------------------------------Recursive case: Extract head of each row and form the new column-----------------------------------------

transpose_first_column([[H|T]|Rest], [H|Col], [T|RestMatrix]) :-
    transpose_first_column(Rest, Col, RestMatrix).                          % Recursively extract columns
