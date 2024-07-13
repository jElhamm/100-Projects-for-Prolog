% ***************************************************************************************************************
%                              Predicate to Find the Smallest Word in a Sentence                                *          
%                                                                                                               *
%       This Prolog code defines a predicate to find the smallest word in a sentence by splitting the           *
%       sentence into words based on separator characters and finding the minimum word lexically.               *
%                                                                                                               *
%       - `smallest_word/2`: Predicate to find the smallest word in a sentence.                                 *
%                                                                                                               *
%                                       Example usage:                                                          *
%               ?- smallest_word("The quick brown fox jumps over the lazy dog", Smallest).                      *
%                                      Smallest = "The".                                                        *
%                                                                                                               *
% ***************************************************************************************************************



% ----------------------------------Predicate to find the smallest word in a sentence----------------------------------

smallest_word(Sentence, SmallestWord) :-
    split_string(Sentence, " .,;!?()[]{}", " .,;!?()[]{}", Words),              % Split sentence into words based on separator characters
    min_word(Words, SmallestWord).


% --------------------------Helper predicate to find the smallest word in a list of words----------------------------------

min_word([Word], Word).
min_word([Word | Words], MinWord) :-
    min_word(Words, TailMin),
    (   Word @< TailMin ->                                                      % Compare words lexicographically
        MinWord = Word
    ;   MinWord = TailMin
    ).
