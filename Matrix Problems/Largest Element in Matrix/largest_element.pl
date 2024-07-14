% *******************************************************************************************************
%                                   Finding the Largest Element in a Matrix                             *
%                                                                                                       *
%      This predicate finds the largest element in a matrix represented as a list of lists. It first    *
%      flattens the matrix into a single list and then finds the maximum element.                       *
%                                                                                                       *
%      Usage: largest_element(Matrix, Largest)                                                          *
%          - Matrix: The input matrix.                                                                  *
%          - Largest: The largest element in the matrix.                                                *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- largest_element([[1, 2], [3, 4]], Largest).                                     *
%                            Largest = 4.                                                               *
%                                                                                                       *
%                    ?- largest_element([[5, 3], [2, 7]], Largest).                                     *
%                            Largest = 7.                                                               *
%                                                                                                       *
% *******************************************************************************************************



% ---------------------------------------------Main predicate to find the largest element in a matrix---------------------------------------------

largest_element(Matrix, Largest) :-
    flatten(Matrix, Flattened),       % Flatten the matrix into a single list
    max_list(Flattened, Largest).     % Find the maximum element in the flattened list
