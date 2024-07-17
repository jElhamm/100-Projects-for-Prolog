
% *******************************************************************************************************
%                              Converting a List to a Matrix with Given Dimensions                      *
%                                                                                                       *
%      This predicate converts a flat list to a matrix (list of lists) with given dimensions.           *
%                                                                                                       *
%      Usage: list_to_matrix(List, Rows, Cols, Matrix)                                                  *
%          - List: The input flat list.                                                                 *
%          - Rows: The number of rows in the resulting matrix.                                          *
%          - Cols: The number of columns in the resulting matrix.                                       *
%          - Matrix: The resulting matrix.                                                              *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- list_to_matrix([1, 2, 3, 4], 2, 2, Matrix).                                     *
%                                Matrix = [[1, 2], [3, 4]].                                             *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to convert a list to a matrix---------------------------------------------

list_to_matrix(_, 0, _, []).
list_to_matrix(List, Rows, Cols, [Row|Matrix]) :-                           % Recursive case: Split the list into rows of the specified size
    length(Row, Cols),                                                      % Ensure the row has the specified number of columns
    append(Row, RestList, List),                                            % Split the list into the current row and the rest
    Rows1 is Rows - 1,                                                      % Decrement the number of rows
    list_to_matrix(RestList, Rows1, Cols, Matrix).                          % Recursively process the rest of the list
