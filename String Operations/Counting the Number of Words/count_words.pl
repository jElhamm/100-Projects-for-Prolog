%****************************************************************************************************
%                                                                                                   *
%                          Predicate to Count the Number of Words in a Sentence                     *
%                                                                                                   *
%  The following Prolog code defines a predicate to count the number of words in a given sentence.  *
%                                                                                                   *
%  - `count_words/2`: Entry point to count words in a sentence.                                     *
%                                                                                                   *
%                                       Example usage:                                              *
%                        ?- count_words("This is a sample sentence.", Count).                       *
%                                        Count = 5                                                  *
%                                                                                                   *
%****************************************************************************************************



% ----------------------------------------Predicate to count the number of words in a sentence----------------------------------------
count_words(Sentence, Count) :-
    split_string(Sentence, " ", "", Words),   % Split the sentence into words based on spaces
    length(Words, Count).                     % Count the number of words in the list
