%****************************************************************************************************
%                                                                                                   *
%                           Predicate to Replace a Character in a String                            *
%                                                                                                   *
%  The following Prolog code defines predicates to replace all occurrences of a character in a      *
%  string with another character.                                                                   *
%                                                                                                   *
%  - `replace_char/4`: Entry point to replace a character in a string.                              *
%  - `replace/4`: Helper predicate to replace characters.                                           *
%                                                                                                   *
%                                       Example usage:                                              *
%                       ?- replace_char("hello", 'l', 'x', Result).                                  *
%                                   Result = "hexxo"                                                *
%                                                                                                   *
%****************************************************************************************************




% ----------------------------------------Predicate to replace a character in a string----------------------------------------

replace_char(String, OldChar, NewChar, Result) :-
    string_chars(String, CharList),                                         % Convert string to list of characters
    maplist(replace(OldChar, NewChar), CharList, ResultList),               % Replace characters
    string_chars(Result, ResultList).                                       % Convert the list back to a string


% ----------------------------------------Helper predicate to replace a character----------------------------------------

replace(OldChar, NewChar, OldChar, NewChar).                                % If the character matches OldChar, replace with NewChar
replace(OldChar, _, Char, Char) :-                                          % If the character does not match OldChar, keep it unchanged
    OldChar \= Char.
