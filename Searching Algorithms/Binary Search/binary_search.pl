%****************************************************************************************************
%                                                                                                   *
%                                   Binary Search in a Sorted List                                  *
%                                                                                                   *
%       The given Prolog code defines predicates to perform a binary search for an element in a     *
%       sorted list. The `binary_search` predicate ensures the list is sorted before calling the    *
%       helper predicate. The `binary_search_helper` predicate handles the binary search with three *
%       cases:                                                                                      *
%       1. Base case: The element is found at the head of the list.                                 *
%       2. Recursive case 1: If the element is less than the middle element, search in the left half.*
%       3. Recursive case 2: If the element is greater than the middle element, search in the right *
%          half.                                                                                    *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- binary_search(3, [1, 2, 3, 4, 5]).                                   *
%                                        true.                                                      *
%                           ?- binary_search(6, [1, 2, 3, 4, 5]).                                   *
%                                        false.                                                     *
%                                                                                                   *
%****************************************************************************************************



% ---------------------------------------The predicate to perform binary search on a sorted list-------------------------------------

binary_search(Element, List) :-
    sort(List, SortedList),                                                 % Ensure the list is sorted.
    binary_search_helper(Element, SortedList).                              % Call the helper predicate with the sorted list.


% -----------------------------------------Base case: Element found at the head of the list-------------------------------------

binary_search_helper(Element, [Element|_]).


% ------------------------------Recursive case: Perform binary search with additional checks and partitioning-------------------------------------

binary_search_helper(Element, List) :-
    length(List, Length),
    Length > 1,                                                             % Ensure there is more than one element.
    Middle is Length // 2,
    nth0(Middle, List, MidElement),
    ( Element = MidElement                                                  % If the middle element is the target element.
    ; Element < MidElement,                                                 % If the target element is in the left half.
      nth0_prefix(List, Middle, LeftHalf),
      binary_search_helper(Element, LeftHalf)
    ; Element > MidElement,                                                 % If the target element is in the right half.
      nth0_suffix(List, Middle, RightHalf),
      binary_search_helper(Element, RightHalf)
    ).


% ----------------------------------------Get the prefix (left half) of the list up to the given index-------------------------------------

nth0_prefix(List, Index, Prefix) :-
    length(Prefix, Index),
    append(Prefix, _, List).


% -----------------------------------------Get the suffix (right half) of the list from the given index-------------------------------------

nth0_suffix(List, Index, Suffix) :-
    append(_, Suffix, List),
    length(_, Index).
