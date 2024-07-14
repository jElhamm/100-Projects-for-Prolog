% *******************************************************************************************************
%                                       Adding Two Matrices                                             *
%                                                                                                       *
%      This predicate performs the element-wise addition of two matrices represented as lists of lists. *
%                                                                                                       *
%      Usage: matrix_addition(Matrix1, Matrix2, Result)                                                 *
%          - Matrix1: The first input matrix.                                                           *
%          - Matrix2: The second input matrix.                                                          *
%          - Result: The resulting matrix after addition.                                               *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- matrix_addition([[1, 2], [3, 4]], [[5, 6], [7, 8]], Result).                    *
%                                Result = [[6, 8], [10, 12]].                                           *
%                                                                                                       *
%                    ?- matrix_addition([[1, 2]], [[3, 4]], Result).                                    *
%                                    Result = [[4, 6]].                                                 *
%                                                                                                       *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to add two matrices---------------------------------------------

matrix_addition(Matrix1, Matrix2, Result) :-
    matrix_addition(Matrix1, Matrix2, [], Result).


% ---------------------------------------------Base case: Both matrices are empty---------------------------------------------

matrix_addition([], [], Result, Result).


% -----------------------------------------Recursive case: Add rows of both matrices---------------------------------------------

matrix_addition([Row1|Rest1], [Row2|Rest2], Temp, Result) :-
    matrix_addition_row(Row1, Row2, [], RowResult), % Add corresponding rows
    append(Temp, [RowResult], NewTemp),            % Append row result to temporary result
    matrix_addition(Rest1, Rest2, NewTemp, Result). % Recursively add the rest


% ---------------------------------------------Base case: Both rows are empty---------------------------------------------

matrix_addition_row([], [], Result, Result).


% ----------------------------------------Recursive case: Add elements of both rows---------------------------------------------

matrix_addition_row([H1|T1], [H2|T2], Temp, Result) :-
    Sum is H1 + H2,                                                                % Add corresponding elements
    append(Temp, [Sum], NewTemp),                                                  % Append sum to temporary row result
    matrix_addition_row(T1, T2, NewTemp, Result).                                  % Recursively add the rest of the elements
