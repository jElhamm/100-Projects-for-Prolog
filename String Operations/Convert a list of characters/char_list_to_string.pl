% ***********************************************************************************************************
%                            Predicate to Convert a List of Characters to a String                          *
%                                                                                                           *
%           This Prolog code defines predicates to convert a list of characters into a string and           *
%                     to break down a string into its constituent characters.                               *
%                                                                                                           *
%   - `char_list_to_string/2`: Entry point to convert a list of characters to a string.                     *
%   - `string_chars/2`: Helper predicate to convert a string into a list of characters and vice versa.      *
%                                                                                                           *
%                                               Example usage:                                              *
%                           ?- char_list_to_string([h, e, l, l, o], String).                                *
%                                             String = "hello".                                             *
%                                                                                                           *
% ***********************************************************************************************************



% -------------------------------------- Predicate to convert a list of characters to a string ----------------------------------------

% Convert a list of characters to a string using string_chars/2
char_list_to_string(CharList, String) :-
    string_chars(String, CharList).


% ---------------------------------------- Predicate to break a string into a list of characters ----------------------------------------

% Base case: An empty string corresponds to an empty list of characters
string_chars("", []).

% Recursive case: Decompose the string into its first character and the rest
string_chars(String, [Char|Chars]) :-
    sub_string(String, 0, 1, After, Char), % Get the first character
    sub_string(String, 1, After, 0, Rest), % Get the rest of the string
    string_chars(Rest, Chars).             % Recursive call to process the rest of the string
