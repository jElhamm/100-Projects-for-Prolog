%****************************************************************************************************
%                                                                                                   *
%                       Predicate to Find the Last Occurrence of a Character                        *
%                                                                                                   *
%  The following Prolog code defines a predicate to find the index of the last occurrence of a      *
%  specific character in a given string.                                                            *
%                                                                                                   *
%  - `last_occurrence/3`: Entry point to find the index of the last occurrence of a character.      *
%                                                                                                   *
%                                       Example usage:                                              *
%                         ?- last_occurrence("hello", 'l', Index).                                  *
%                                        Index = 3                                                  *
%                                                                                                   *
%****************************************************************************************************



% ---------------------------Predicate to find the last occurrence of a character in a string----------------------------------------

last_occurrence(String, Char, Index) :-
    string_chars(String, CharList),                             % Convert string to list of characters
    reverse(CharList, RevCharList),                             % Reverse the list of characters
    nth0(RevIndex, RevCharList, Char),                          % Find the index of Char in the reversed list
    length(CharList, Length),                                   % Find the length of the original string
    Index is Length - RevIndex - 1.                             % Calculate the index in the original string
