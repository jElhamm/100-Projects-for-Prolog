
% *******************************************************************************************************
%                                  Converting a Matrix to a List                                        *
%                                                                                                       *
%      This predicate converts a matrix (list of lists) to a flat list.                                 *
%                                                                                                       *
%      Usage: matrix_to_list(Matrix, List)                                                              *
%          - Matrix: The input matrix.                                                                  *
%          - List: The resulting flat list.                                                             *
%                                                                                                       *
%                                       Example usage:                                                  *
%                       ?- matrix_to_list([[1, 2], [3, 4]], List).                                      *
%                                   List = [1, 2, 3, 4].                                                *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to convert a matrix to a list---------------------------------------------

matrix_to_list([], []).


% ---------------------------------------------Recursive case: Flatten each row and append to the result---------------------------------------------

matrix_to_list([Row|RestMatrix], List) :-
    matrix_to_list(RestMatrix, RestList),  % Recursively flatten the rest of the matrix
    append(Row, RestList, List).           % Append the current row to the flattened rest


% ---------------------------------------------Helper predicate to append two lists (if append/3 is not used)---------------------------------------------

append([], L, L).


% ---------------------------------------------Recursive case: Append elements one by one---------------------------------------------
append([H|T], L, [H|R]) :-
    append(T, L, R).
