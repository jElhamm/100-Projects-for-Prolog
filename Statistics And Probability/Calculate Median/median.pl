% *******************************************************************************************************
%                                          Calculating the Median of a List                             *
%                                                                                                       *
%      This predicate calculates the median value of a list of numbers. The median is the middle value  *
%      in a sorted list of numbers. If the list has an even number of elements, the median is the       *
%      average of the two middle values.                                                                *
%                                                                                                       *
%      Usage: median(List, Median)                                                                      *
%          - List: The input list of numbers.                                                           *
%          - Median: The calculated median value of the list.                                           *
%                                                                                                       *
%                                       Example usage:                                                  *
%                          ?- median([3, 1, 4, 1, 5, 9, 2], Median).                                    *
%                                         Median = 3.                                                   *
% *******************************************************************************************************



% ----------------------------------------Main predicate to calculate the median----------------------------------------

median(List, Median) :-
    msort(List, Sorted),                                                % Sort the list
    length(Sorted, Length),                                             % Get the length of the sorted list
    (Length mod 2 =:= 0 ->                                              % If the length is even
        Mid1 is Length // 2,                                            % Calculate the first middle index
        Mid2 is Mid1 + 1,                                               % Calculate the second middle index
        nth1(Mid1, Sorted, Elem1),                                      % Get the element at the first middle index
        nth1(Mid2, Sorted, Elem2),                                      % Get the element at the second middle index
        Median is (Elem1 + Elem2) / 2                                   % Calculate the median as the average of the two middle elements
    ;
        Mid is Length // 2 + 1,                                         % Calculate the middle index for odd length
        nth1(Mid, Sorted, Median)                                       % Get the median element
    ).
