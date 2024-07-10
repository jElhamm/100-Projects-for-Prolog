%****************************************************************************************************
%                                                                                                   *
%                          Predicate to Find All Subsequences of a String                           *
%                                                                                                   *
%  The following Prolog code defines predicates to find all unique subsequences of a given string.  *
%                                                                                                   *
%  - `subsequences/2`: Entry point to find all subsequences of a string.                            *
%  - `subsequence/2`: Helper predicate to generate subsequences of a list of characters.            *
%                                                                                                   *
%                                       Example usage:                                              *
%                             ?- subsequences("abc", Subsequences).                                 *
%                 Subsequences = ["", "a", "b", "c", "ab", "ac", "bc", "abc"]                       *
%                                                                                                   *
%****************************************************************************************************



% ----------------------------------------Predicate to find all subsequences of a string----------------------------------------

subsequences(String, Subsequences) :-
    string_chars(String, CharList),                                                     % Convert string to list of characters
    findall(Subsequence, subsequence(CharList, Subsequence), SubseqList),               % Find all subsequences
    list_to_set(SubseqList, UniqueSubseqList),                                          % Remove duplicate subsequences
    maplist(atom_chars, Subsequences, UniqueSubseqList).                                % Convert lists of characters back to strings


% ----------------------------------------Helper predicate to find a subsequence of a list----------------------------------------

subsequence([], []).                                                                    % Base case: The empty list is a subsequence of itself
subsequence([H|T], [H|SubT]) :-                                                         % Recursive case 1: Include the head in the subsequence
    subsequence(T, SubT).
subsequence([_|T], SubT) :-                                                             % Recursive case 2: Exclude the head from the subsequence
    subsequence(T, SubT).
