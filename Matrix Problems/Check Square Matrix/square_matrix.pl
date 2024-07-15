
% *******************************************************************************************************
%                                     Checking if a Matrix is Square                                    *
%                                                                                                       *
%      This predicate checks if a matrix (list of lists) is square, meaning it has the same number of   *
%      rows and columns.                                                                                *
%                                                                                                       *
%      Usage: is_square_matrix(Matrix)                                                                  *
%          - Matrix: The input matrix.                                                                  *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- is_square_matrix([[1, 2], [3, 4]]).                                             *
%                            true.                                                                      *
%                                                                                                       *
%                    ?- is_square_matrix([[1, 2, 3], [4, 5, 6]]).                                       *
%                            false.                                                                     *
%                                                                                                       *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to check if a matrix is square---------------------------------------------

is_square_matrix(Matrix) :-
    length(Matrix, Rows),                                                       % Get the number of rows
    Matrix = [FirstRow|_],                                                      % Take the first row
    length(FirstRow, Cols),                                                     % Get the number of columns
    Rows =:= Cols.                                                              % Check if the number of rows equals the number of columns
