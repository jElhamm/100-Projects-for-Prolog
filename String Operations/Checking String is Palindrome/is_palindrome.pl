%****************************************************************************************************
%                                                                                                   *
%                            Predicate to Check if a String is a Palindrome                         *
%                                                                                                   *
%  The following Prolog code defines predicates `is_palindrome/1` and `reverse_list/2` to check if  *
%  a string is a palindrome (reads the same forward and backward).                                  *
%                                                                                                   *
%  - `is_palindrome/1`: Entry point to check if a string is a palindrome.                           *
%  - `reverse_list/2`: Helper predicate that recursively reverses a list of characters.             *
%                                                                                                   *
%                                       Example usage:                                              *
%                                ?- is_palindrome("madam").                                         *
%                                           true                                                    *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------Predicate to check if a string is a palindrome----------------------------------------

is_palindrome(String) :-
    string_chars(String, CharList),        % Convert string to list of characters
    reverse_list(CharList, CharList).      % Check if the list is the same when reversed


% ----------------------------------------Helper predicate to reverse a list----------------------------------------

reverse_list([], []).                      % Base case: An empty list is its own reverse
reverse_list([H|T], Reversed) :-            % Recursive case: Reverse the rest of the list
    reverse_list(T, RevT),                  % Reverse the tail of the list
    append(RevT, [H], Reversed).            % Append the head to the reversed tail
