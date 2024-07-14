% *******************************************************************************************************
%                                   Finding the Smallest Element in a Matrix                            *
%                                                                                                       *
%      This predicate finds the smallest element in a matrix represented as a list of lists. It first   *
%      flattens the matrix into a single list and then finds the minimum element.                       *
%                                                                                                       *
%      Usage: smallest_element(Matrix, Smallest)                                                        *
%          - Matrix: The input matrix.                                                                  *
%          - Smallest: The smallest element in the matrix.                                              *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- smallest_element([[1, 2], [3, 4]], Smallest).                                   *
%                            Smallest = 1.                                                              *
%                                                                                                       *
%                    ?- smallest_element([[5, 3], [2, 7]], Smallest).                                   *
%                            Smallest = 2.                                                              *
%                                                                                                       *
% *******************************************************************************************************



% ----------------------------------------Main predicate to find the smallest element in a matrix---------------------------------------------

smallest_element(Matrix, Smallest) :-
    flatten(Matrix, Flattened),                                         % Flatten the matrix into a single list
    min_list(Flattened, Smallest).                                      % Find the minimum element in the flattened list
