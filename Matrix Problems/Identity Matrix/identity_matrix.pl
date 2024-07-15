% *******************************************************************************************************
%                                 Creating an Identity Matrix of Size N                                 *
%                                                                                                       *
%      This predicate creates an identity matrix of size N. An identity matrix is a square matrix with  *
%      1s on the main diagonal and 0s elsewhere.                                                        *
%                                                                                                       *
%      Usage: identity_matrix(N, Matrix)                                                                *
%          - N: The size of the identity matrix.                                                        *
%          - Matrix: The resulting identity matrix.                                                     *
%                                                                                                       *
%                                       Example usage:                                                  *
%                               ?- identity_matrix(3, Matrix).                                          *
%                            Matrix = [[1, 0, 0], [0, 1, 0], [0, 0, 1]].                                *
%                                                                                                       *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to create an identity matrix---------------------------------------------

identity_matrix(N, Matrix) :-
    identity_matrix(N, 1, Matrix). % Start with index 1


% --------------------------------------------------Base case: No more rows to create--------------------------------------------------

identity_matrix(0, _, []).


% -------------------------------Recursive case: Create the next row and process the remaining matrix-----------------------------------

identity_matrix(N, Index, [Row|Rest]) :-
    length(Row, N),                                                                 % Ensure the row has N elements
    set_identity_row(Row, Index, 1),                                                % Set the appropriate element to 1
    NewIndex is Index + 1,                                                          % Increment index for next row
    N1 is N - 1,                                                                    % Decrement N
    identity_matrix(N1, NewIndex, Rest).                                            % Recursively create remaining rows


% ---------------------------------------------Helper predicate to set the identity row------------------------------------------------

set_identity_row([], _, _).

% Set the diagonal element to 1
set_identity_row([1|Rest], 1, 1) :-
    set_identity_row(Rest, 0, 0).

% Set other elements to 0
set_identity_row([0|Rest], 1, 0) :-
    set_identity_row(Rest, 0, 0).

% Continue setting the row
set_identity_row([0|Rest], N, M) :-
    N > 1,
    M1 is M + 1,
    set_identity_row(Rest, N, M1).
