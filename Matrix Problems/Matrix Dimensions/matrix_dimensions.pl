% *******************************************************************************************************
%                                     Determining Matrix Dimensions                                     *
%                                                                                                       *
%      This predicate determines the dimensions (number of rows and columns) of a matrix represented    *
%      as a list of lists.                                                                              *
%                                                                                                       *
%      Usage: matrix_dimensions(Matrix, Rows, Cols)                                                     *
%          - Matrix: The input matrix.                                                                  *
%          - Rows: Number of rows in the matrix.                                                        *
%          - Cols: Number of columns in the matrix.                                                     *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- matrix_dimensions([[1, 2], [3, 4]], Rows, Cols).                                *
%                            Rows = 2, Cols = 2.                                                        *
%                                                                                                       *
%                    ?- matrix_dimensions([[1, 2, 3]], Rows, Cols).                                     *
%                            Rows = 1, Cols = 3.                                                        *
%                                                                                                       *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to determine matrix dimensions---------------------------------------------

matrix_dimensions(Matrix, Rows, Cols) :-
    length(Matrix, Rows),                                       % Calculate number of rows
    Matrix = [Row|_],                                           % Take the first row
    length(Row, Cols).                                          % Calculate number of columns
