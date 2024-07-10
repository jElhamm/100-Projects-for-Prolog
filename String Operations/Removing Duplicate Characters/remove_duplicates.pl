%****************************************************************************************************
%                                                                                                   *
%                        Predicate to Remove Duplicate Characters from a String                     *
%                                                                                                   *
%  The following Prolog code defines a predicate to remove duplicate characters from a string,      *
%  retaining only the first occurrence of each character.                                           *
%                                                                                                   *
%  - `remove_duplicates/2`: Entry point to remove duplicates from a string.                         *
%                                                                                                   *
%                                       Example usage:                                              *
%                          ?- remove_duplicates("banana", Result).                                  *
%                                       Result = "abn"                                              *
%                                                                                                   *
%****************************************************************************************************



% ----------------------------------------Predicate to remove duplicate characters from a string----------------------------------------

remove_duplicates(String, Result) :-
    string_chars(String, CharList),            % Convert string to list of characters
    sort(CharList, SortedList),                % Sort and remove duplicates
    string_chars(Result, SortedList).          % Convert the list back to a string
