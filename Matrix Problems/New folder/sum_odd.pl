% *******************************************************************************************************
%                                  Calculating the Trace of a Square Matrix                             *
%                                                                                                       *
%      This predicate calculates the trace of a square matrix. The trace is the sum of the elements on  *
%      the main diagonal (from the top left to the bottom right).                                       *
%                                                                                                       *
%      Usage: matrix_trace(Matrix, Trace)                                                               *
%          - Matrix: The input square matrix.                                                           *
%          - Trace: The trace of the matrix.                                                            *
%                                                                                                       *
%                                       Example usage:                                                  *
%                        ?- matrix_trace([[1, 2], [3, 4]], Trace).                                      *
%                                         Trace = 5.                                                    *
%                                                                                                       *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to calculate the trace---------------------------------------------

matrix_trace(Matrix, Trace) :-
    matrix_trace(Matrix, 0, 1, Trace).                              % Initialize accumulator and index


% ----------------------------------Base case: No more rows, return the accumulated trace---------------------------------------------

matrix_trace([], Trace, _, Trace).


% -------------------------------Recursive case: Add the diagonal element to the accumulator---------------------------------------------

matrix_trace([Row|Rest], Acc, Index, Trace) :-
    nth1(Index, Row, Element),                                      % Get the element at the diagonal position
    NewAcc is Acc + Element,                                        % Update accumulator
    NewIndex is Index + 1,                                          % Increment index for next row
    matrix_trace(Rest, NewAcc, NewIndex, Trace).                    % Process remaining rows
