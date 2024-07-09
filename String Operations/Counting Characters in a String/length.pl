%*******************************************************************************************************
%                                                                                                       *
%                            Predicate to Count the Number of Characters in a String                    *
%                                                                                                       *
%  The following Prolog code defines predicates `my_atom_length/2` and `count_chars/2` to count the     *
%  number of characters in a string (as an atom or list of characters).                                 *
%                                                                                                       *
%  - `my_atom_length/2`: Entry point to count characters in an atom or string.                          *
%  - `count_chars/2`: Helper predicate that recursively counts characters in a list.                    *
%                                                                                                       *
%                                       Example usage:                                                  *
%                            ?- my_atom_length('hello', Length).                                        *
%                                        Length = 5                                                     *
%                                                                                                       *
%********************************************************************************************************



% ----------------------------------------Predicate to count the number of characters in an atom or string----------------------------------------

my_atom_length(AtomOrString, Length) :-
    atom_chars(AtomOrString, Chars),    % Convert atom or string to list of characters
    count_chars(Chars, Length).         % Count characters in the list


% ----------------------------------------Helper predicate to count characters in a list of characters----------------------------------------

count_chars([], 0).                     % Base case: Empty list has 0 characters
count_chars([_|T], Count) :-            % Recursive case: Count characters in the rest of the list
    count_chars(T, SubCount),           % Recursively count characters in the tail
    Count is SubCount + 1.              % Increment count for the current character
