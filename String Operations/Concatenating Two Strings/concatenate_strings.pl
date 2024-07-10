%****************************************************************************************************
%                                                                                                   *
%                               Predicate to Concatenate Two Strings                                *
%                                                                                                   *
%  The following Prolog code defines the predicate `concatenate_strings/3` to concatenate two       *
%  strings into one.                                                                                *
%                                                                                                   *
%  - `concatenate_strings/3`: Entry point to concatenate two strings.                               *
%                                                                                                   *
%                                       Example usage:                                              *
%                        ?- concatenate_strings("hello", "world", Result).                          *
%                                    Result = "helloworld"                                          *
%                                                                                                   *
%****************************************************************************************************



% ----------------------------------------Predicate to concatenate two strings----------------------------------------

concatenate_strings(String1, String2, Result) :-
    string_chars(String1, CharList1),                       % Convert first string to list of characters
    string_chars(String2, CharList2),                       % Convert second string to list of characters
    append(CharList1, CharList2, ResultList),               % Concatenate the lists of characters
    string_chars(Result, ResultList).                       % Convert the concatenated list back to a string
