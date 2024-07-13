% ***************************************************************************************************
%                                   Predicate to Check if Two Strings are Equal                     *
%                                                                                                   *
%   This Prolog code defines a predicate to check if two strings are equal by comparing their       *
%   constituent characters.                                                                         *
%                                                                                                   *
%               - `strings_equal/2`: Predicate to check equality of two strings.                    *
%                                                                                                   *
%                                               Example usage:                                      *
%                                   ?- strings_equal("hello", "hello").                             *
%                                                   true.                                           *
%                                   ?- strings_equal("hello", "world").                             *
%                                                   false.                                          *
%                                                                                                   *
% ***************************************************************************************************




% ---------------------------------- Predicate to check if two strings are equal ----------------------------------

% Check if two strings are equal by comparing their character lists
strings_equal(String1, String2) :-
    string_chars(String1, Chars1),                              % Convert String1 to a list of characters
    string_chars(String2, Chars2),                              % Convert String2 to a list of characters
    Chars1 = Chars2.                                            % Unify the character lists to check equality
