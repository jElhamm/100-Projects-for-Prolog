%****************************************************************************************************
%                                                                                                   *
%                        Predicate to Convert Uppercase Letters to Lowercase                        *
%                                                                                                   *
%  The following Prolog code defines predicates to convert all uppercase letters in a string to     *
%  lowercase letters.                                                                               *
%                                                                                                   *
%  - `to_lowercase/2`: Entry point to convert a string to lowercase.                                *
%  - `char_lowercase/2`: Helper predicate to convert a character to lowercase.                      *
%                                                                                                   *
%                                       Example usage:                                              *
%                        ?- to_lowercase("HELLO", LowercaseString).                                 *
%                                   LowercaseString = "hello"                                       *
%                                                                                                   *
%****************************************************************************************************



% ----------------------------------------Predicate to convert uppercase letters to lowercase----------------------------------------

to_lowercase(String, LowercaseString) :-
    string_chars(String, CharList),                                         % Convert string to list of characters
    maplist(char_lowercase, CharList, LowercaseCharList),                   % Convert characters to lowercase
    string_chars(LowercaseString, LowercaseCharList).                       % Convert the list back to a string


% ----------------------------------------Helper predicate to convert a character to lowercase----------------------------------------

char_lowercase(Char, LowercaseChar) :-
    char_type(Char, upper),                                                 % Check if the character is uppercase
    char_type(LowercaseChar, to_upper(Char)).                               % Convert to lowercase
char_lowercase(Char, Char) :-
    \+ char_type(Char, upper).                                              % If not uppercase, keep the character unchanged
