%************************************************************************************************************
%                                                                                                           *
%                       Convert a Decimal Number to a Binary List Representation                            *
%                                                                                                           *
%  The following Prolog code defines predicates `decimal_to_binary/2` and `decimal_to_binary_recursive/3`   *
%  to convert a decimal number into its binary representation as a list of binary digits.                   *
%                                                                                                           *
%  - `decimal_to_binary/2`: Entry point to convert decimal number N to binary list BinList.                 *
%  - `decimal_to_binary_recursive/3`: Helper predicate that performs the conversion recursively.            *
%                                                                                                           *
%                                       Example usage:                                                      *
%                              ?- decimal_to_binary(13, BinList).                                           *
%                                    BinList = [1, 1, 0, 1]                                                 *
%                                                                                                           *
%************************************************************************************************************



% ----------------------------------------Base case: Convert 0 to [0]----------------------------------------

decimal_to_binary(0, [0]).


% ---------------------------------Recursive case: Convert decimal number N to binary list BinList----------------------------------------

decimal_to_binary(N, BinList) :-
    N > 0,
    decimal_to_binary_recursive(N, [], BinList).


% -------------------------Helper predicate to convert decimal number N to binary list BinList recursively----------------------------------------

decimal_to_binary_recursive(0, Acc, Acc).
decimal_to_binary_recursive(N, Acc, BinList) :-
    N > 0,
    Bit is N mod 2,               % Get the least significant bit.
    N1 is N // 2,                 % Shift right by dividing N by 2.
    decimal_to_binary_recursive(N1, [Bit | Acc], BinList).
