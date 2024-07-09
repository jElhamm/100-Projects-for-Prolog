%************************************************************************************************************
%                                                                                                           *
%                       Convert a Binary List Representation to Decimal Number                              *
%                                                                                                           *
%  The following Prolog code defines predicates `binary_to_decimal/2` and `binary_to_decimal_recursive/4`   *
%  to convert a binary list (LSB first) into its decimal representation.                                    *
%                                                                                                           *
%  - `binary_to_decimal/2`: Entry point to convert binary list BinList to decimal number Dec.               *
%  - `binary_to_decimal_recursive/4`: Helper predicate that performs the conversion recursively.            *
%                                                                                                           *
%                                       Example usage:                                                      *
%                          ?- binary_to_decimal([1, 1, 0, 1], Dec).                                         *
%                                       Dec = 13                                                            *
%                                                                                                           *
%************************************************************************************************************



% ----------------------------------------Base case: Empty list represents binary 0----------------------------------------

binary_to_decimal([], 0).


% ----------------------------------------Convert binary list BinList to decimal number Dec----------------------------------------

binary_to_decimal(BinList, Dec) :-
    reverse(BinList, RevBinList),                                   % Reverse to process LSB (Least Significant Bit) first
    binary_to_decimal_recursive(RevBinList, 0, 0, Dec).


% ----------------------------------------Helper predicate to convert binary list to decimal number recursively----------------------------------------

binary_to_decimal_recursive([], _, Dec, Dec).
binary_to_decimal_recursive([Bit | Rest], Pos, Acc, Dec) :-
    Bit = 0 ; Bit = 1,                                              % Validate Bit as binary (0 or 1).
    Acc1 is Acc + Bit * (2^Pos),                                    % Compute the contribution of current bit.
    Pos1 is Pos + 1,                                                % Move to next bit position.
    binary_to_decimal_recursive(Rest, Pos1, Acc1, Dec).
