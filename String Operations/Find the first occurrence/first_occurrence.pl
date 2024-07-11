%****************************************************************************************************
%                                                                                                   *
%                       Predicate to Find the First Occurrence of a Character                       *
%                                                                                                   *
%  The following Prolog code defines a predicate to find the index of the first occurrence of a     *
%  specific character in a given string.                                                            *
%                                                                                                   *
%  - `first_occurrence/3`: Entry point to find the index of the first occurrence of a character.    *
%                                                                                                   *
%                                       Example usage:                                              *
%                         ?- first_occurrence("hello", 'l', Index).                                 *
%                                         Index = 2                                                 *
%                                                                                                   *
%****************************************************************************************************



% ----------------------------------------Predicate to find the first occurrence of a character in a string----------------------------------------

% Entry point to find the index of the first occurrence of a character.
first_occurrence(String, Char, Index) :-
    string_chars(String, CharList),                                             % Convert string to list of characters
    nth0(Index, CharList, Char).                                                % Find the index of the first occurrence of Char


% ----------------------------------------nth0: Predicate to find the index of an element in a list.----------------------------------------

nth0(0, [X|_], X).                                                              % Base case: the element at index 0 is the head of the list
nth0(Index, [_|Tail], Element) :-
    Index > 0,                                                                  % Ensure Index is positive
    NextIndex is Index - 1,
    nth0(NextIndex, Tail, Element).