%****************************************************************************************************
%                                                                                                   *
%                                Predicate to Reverse a String                                      *
%                                                                                                   *
%  The following Prolog code defines predicates `reverse_string/2` and `reverse_list/2` to reverse  *
%  the characters in a string.                                                                      *
%                                                                                                   *
%  - `reverse_string/2`: Entry point to reverse a string.                                           *
%  - `reverse_list/2`: Helper predicate that recursively reverses a list of characters.             *
%                                                                                                   *
%                                       Example usage:                                              *
%                              ?- reverse_string("hello", Reversed).                                *
%                                      Reversed = "olleh"                                           *
%                                                                                                   *
%****************************************************************************************************



% Predicate to reverse a string

reverse_string(String, Reversed) :-
    string_chars(String, CharList),                 % Convert string to list of characters
    reverse_list(CharList, ReversedList),           % Reverse the list of characters
    string_chars(Reversed, ReversedList).           % Convert the reversed list back to a string


% Helper predicate to reverse a list

reverse_list([], []).                               % Base case: An empty list is its own reverse
reverse_list([H|T], Reversed) :-                    % Recursive case: Reverse the rest of the list
    reverse_list(T, RevT),                          % Reverse the tail of the list
    append(RevT, [H], Reversed).                    % Append the head to the reversed tail
