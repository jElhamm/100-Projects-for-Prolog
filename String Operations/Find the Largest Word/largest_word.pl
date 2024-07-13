% ***************************************************************************************************************
%                                Predicate to Find the Largest Word in a Sentence                               *
%                                                                                                               *
%       This Prolog code defines a predicate to find the largest word in a sentence. It splits the              *
%       sentence into words based on various separator characters and then determines the maximum               *
%       word based on their lengths.                                                                            *
%                                                                                                               *
%       - `largest_word/2`: Predicate to find the largest word in a sentence.                                   *
%       - `split_string/4`: Helper predicate to split a string into words based on separator characters.        *
%       - `max_list/2`: Helper predicate to find the maximum element in a list of numbers.                      *
%                                                                                                               *
%                                           Example usage:                                                      *
%                   ?- largest_word("Hello world! This is a test.", LargestWord).                               *
%                                       LargestWord = "world".                                                  *
%                                                                                                               *
% ***************************************************************************************************************



% ---------------------------------------------Predicate to find the largest word in a sentence--------------------------------------------------

largest_word(Sentence, LargestWord) :-
    split_string(Sentence, " .,;!?()[]{}", " .,;!?()[]{}", Words),          % Split sentence into words based on separator characters
    max_list(Words, LargestWord).


% --------------------------------------Predicate to split a string into words based on separator characters--------------------------------------

split_string(Input, SepChars, SepChars, Words) :-
    atom_chars(Input, Chars),
    split_chars(Chars, SepChars, Words).


% ----------------------------------Helper predicate to split a list of characters based on separator characters----------------------------------

split_chars([], _, []) :- !.
split_chars(Chars, SepChars, [Word|Words]) :-
    append(WordChars, [SepChar|RestChars], Chars),
    member(SepChar, SepChars),
    WordChars \== [],
    atom_chars(Word, WordChars),
    split_chars(RestChars, SepChars, Words).
split_chars(Chars, SepChars, [Word]) :-
    append(WordChars, [], Chars),
    WordChars \== [],
    atom_chars(Word, WordChars).


% -----------------------------------------Predicate to find the maximum element in a list of numbers----------------------------------------------

max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, TMax),
    (H @>= TMax -> Max = H ; Max = TMax).
