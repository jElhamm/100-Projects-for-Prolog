%********************************************************************************************************
%                                                                                                       *
%                        Predicate to Convert a String to a List of Characters                          *
%                                                                                                       *
%  The following Prolog code defines predicates to convert a given string into a list of characters.    *
%                                                                                                       *
%  - `string_chars/2`: Entry point to convert a string (either atom or double-quoted string) to a       *
%                      list of characters.                                                              *
%                                                                                                       *
%                                       Example usage:                                                  *
%                            ?- string_chars('hello', CharList).                                        *
%                                  CharList = [h, e, l, l, o].                                          *
%                                                                                                       *
%********************************************************************************************************



% ----------------------------------------Predicate to convert a string to a list of characters (atom case)----------------------------------------

string_chars(String, CharList) :-
    atom(String),                                                   % Check if String is an atom (string)
    atom_chars(String, CharList).                                   % Convert atom to list of characters


% ----------------------------------------Predicate to convert a string to a list of characters (string case)----------------------------------------

string_chars(String, CharList) :-
    string(String),                                                 % Check if String is a string (double-quoted)
    string_chars(String, CharList).                                 % Convert string to list of characters

