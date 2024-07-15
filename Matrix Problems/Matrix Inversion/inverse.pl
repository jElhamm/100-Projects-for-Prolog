% ***********************************************************************************************************
%                                      Calculating the Inverse of a 2x2 Matrix                              *
%                                                                                                           *
%      This predicate calculates the inverse of a 2x2 matrix. The inverse exists only if the determinant    *
%      of the matrix is non-zero.                                                                           *
%                                                                                                           *
%      Usage: inverse_2x2(Matrix, Inverse)                                                                  *
%          - Matrix: The input 2x2 matrix.                                                                  *
%          - Inverse: The resulting inverse matrix.                                                         *
%                                                                                                           *
%                                       Example usage:                                                      *
%                        ?- inverse_2x2([[1, 2], [3, 4]], Inverse).                                         *
%                            Inverse = [[-2.0, 1.0], [1.5, -0.5]].                                          *
%                                                                                                           *
% ***********************************************************************************************************



% -----------------------------------Main predicate to calculate the inverse of a 2x2 matrix----------------------------------------

inverse_2x2([[A, B], [C, D]], [[InvA, InvB], [InvC, InvD]]) :-
    Det is A * D - B * C,                                                           % Calculate the determinant
    Det \= 0,                                                                       % Ensure the determinant is non-zero
    InvDet is 1 / Det,                                                              % Calculate the inverse of the determinant
    InvA is D * InvDet,                                                             % Calculate each element of the inverse matrix
    InvB is -B * InvDet,
    InvC is -C * InvDet,
    InvD is A * InvDet.
