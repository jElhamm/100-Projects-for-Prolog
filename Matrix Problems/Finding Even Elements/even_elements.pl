% *******************************************************************************************************
%                                   Finding Even Elements in a List                                     *
%                                                                                                       *
%      This predicate extracts all even elements from a list. It recursively checks each element and    *
%      includes it in the result if it is even.                                                         *
%                                                                                                       *
%      Usage: even_elements(List, Evens)                                                                *
%          - List: The input list.                                                                      *
%          - Evens: The list of even elements.                                                          *
%                                                                                                       *
%                                       Example usage:                                                  *
%                    ?- even_elements([1, 2, 3, 4], Evens).                                             *
%                            Evens = [2, 4].                                                            *
%                                                                                                       *
%                    ?- even_elements([5, 7, 8], Evens).                                                *
%                            Evens = [8].                                                               *
%                                                                                                       *
% *******************************************************************************************************



% ---------------------------------------------Base case: An empty list results in an empty list of evens---------------------------------------------

even_elements([], []).


% ---------------------------------------------Recursive case: Head is even, include it in the result---------------------------------------------

even_elements([H|T], [H|Evens]) :-
    0 is H mod 2,                                                       % Check if the element is even
    even_elements(T, Evens).                                            % Recursively process the rest of the list


% ---------------------------------------------Recursive case: Head is not even, skip it---------------------------------------------

even_elements([_|T], Evens) :-
    even_elements(T, Evens).                                           % Recursively process the rest of the list
