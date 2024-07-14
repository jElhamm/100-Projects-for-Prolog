% *******************************************************************************************************
%                                     Multiplying Two Matrices                                          *
%                                                                                                       *
%      This predicate performs matrix multiplication. The second matrix is first transposed,            *
%      and then the dot product is calculated for corresponding rows and columns.                       *
%                                                                                                       *
%      Usage: matrix_multiplication(Matrix1, Matrix2, Result)                                           *
%          - Matrix1: The first input matrix.                                                           *
%          - Matrix2: The second input matrix.                                                          *
%          - Result: The resulting matrix after multiplication.                                         *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- matrix_multiplication([[1, 2], [3, 4]], [[5, 6], [7, 8]], Result).              *
%                            Result = [[19, 22], [43, 50]].                                             *
%                                                                                                       *
%                    ?- matrix_multiplication([[1, 2]], [[3], [4]], Result).                            *
%                            Result = [[11]].                                                           *
%                                                                                                       *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to multiply two matrices---------------------------------------------

matrix_multiplication(Matrix1, Matrix2, Result) :-
    transpose_matrix(Matrix2, TransposedMatrix2), % Transpose the second matrix
    matrix_multiplication(Matrix1, TransposedMatrix2, [], Result).


% ---------------------------------------------Base case: No more rows to process--------------------------------------------------

matrix_multiplication([], _, Result, Result).


% ----------------------------------------Recursive case: Multiply rows with columns-----------------------------------------------

matrix_multiplication([Row1|Rest1], Matrix2, Temp, Result) :-
    matrix_multiplication_row(Row1, Matrix2, [], RowResult),                    % Multiply a row with each column
    append(Temp, [RowResult], NewTemp),                                         % Append row result to temporary result
    matrix_multiplication(Rest1, Matrix2, NewTemp, Result).                     % Recursively multiply the rest


% -------------------------------------------Base case: No more columns to process-------------------------------------------------

matrix_multiplication_row(_, [], Result, Result).


% -------------------------------Recursive case: Calculate dot product of a row with each column------------------------------------

matrix_multiplication_row(Row1, [Row2|Rest2], Temp, Result) :-
    dot_product(Row1, Row2, 0, DotProduct),                                     % Calculate dot product
    append(Temp, [DotProduct], NewTemp),                                        % Append dot product to temporary row result
    matrix_multiplication_row(Row1, Rest2, NewTemp, Result).                    % Recursively process the rest


% -----------------------------------------Base case: No more elements to process---------------------------------------------------

dot_product([], [], DotProduct, DotProduct).


% ------------------------------------------Recursive case: Calculate dot product---------------------------------------------------

dot_product([H1|T1], [H2|T2], Temp, DotProduct) :-
    Product is H1 * H2,                                                         % Multiply corresponding elements
    NewTemp is Temp + Product,                                                  % Add product to temporary sum
    dot_product(T1, T2, NewTemp, DotProduct).                                   % Recursively process the rest
