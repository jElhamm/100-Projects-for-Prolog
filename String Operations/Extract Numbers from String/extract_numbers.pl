% ***********************************************************************************************************
%                             Predicate to Extract Numbers from a String                                    *
%                                                                                                           *
%       This Prolog code defines a predicate to extract all numbers from a given string. It splits          *
%       the string into atoms based on spaces and includes only those atoms that are numeric.               *
%                                                                                                           *
%               - `extract_numbers/2`: Predicate to extract numbers from a string.                          *
%               - `number_atom/1`: Helper predicate to check if an atom is a number.                        *
%                                                                                                           *
%                                        Example usage:                                                     *
%                        ?- extract_numbers("abc 123 def 45.6 xyz", Numbers).                               *
%                                   Numbers = [123, 45.6].                                                  *
%                                                                                                           *
% ***********************************************************************************************************



% ---------------------------------- Predicate to extract numbers from a string ----------------------------------

% Extract numbers from a string by splitting it into atoms and selecting numeric atoms
extract_numbers(String, Numbers) :-
    atomic_list_concat(L, ' ', String),                         % Split string into list of atoms by spaces
    include(number_atom, L, Numbers).                           % Include only atoms that are numbers

% Helper predicate to check if an atom is a number
number_atom(Atom) :-
    atom_number(Atom, _).                                       % Convert atom to number; if successful, it's a number
