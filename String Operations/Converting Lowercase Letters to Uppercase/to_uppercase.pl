%****************************************************************************************************
%                                                                                                   *
%                        Predicate to Convert Lowercase Letters to Uppercase                        *
%                                                                                                   *
%  The following Prolog code defines predicates to convert all lowercase letters in a string to     *
%  uppercase letters.                                                                               *
%                                                                                                   *
%  - `to_uppercase/2`: Entry point to convert a string to uppercase.                                *
%  - `char_uppercase/2`: Helper predicate to convert a character to uppercase.                      *
%                                                                                                   *
%                                       Example usage:                                              *
%                        ?- to_uppercase("hello", UppercaseString).                                 *
%                                   UppercaseString = "HELLO"                                       *
%                                                                                                   *
%****************************************************************************************************



% ----------------------------------------Predicate to convert lowercase letters to uppercase----------------------------------------

to_uppercase(String, UppercaseString) :-
    string_chars(String, CharList),                                         % Convert string to list of characters
    maplist(char_uppercase, CharList, UppercaseCharList),                   % Convert characters to uppercase
    string_chars(UppercaseString, UppercaseCharList).                       % Convert the list back to a string


% ----------------------------------------Helper predicate to convert a character to uppercase----------------------------------------

char_uppercase(Char, UppercaseChar) :-
    char_type(Char, lower),                                                 % Check if the character is lowercase
    char_type(UppercaseChar, to_lower(Char)).                               % Convert to uppercase
char_uppercase(Char, Char) :-
    \+ char_type(Char, lower).                                              % If not lowercase, keep the character unchanged
