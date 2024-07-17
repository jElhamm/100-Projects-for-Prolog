% *******************************************************************************************************
%                               Simulating Coin Tosses and Calculating Probability                      *
%                                                                                                       *
%      This set of predicates simulates a given number of coin tosses and calculates the probability    *
%      of getting heads.                                                                                *
%                                                                                                       *
%      Usage: coin_toss(Flips, Result)                                                                  *
%             probability_heads(Flips, Probability)                                                     *
%          - Flips: The number of coin tosses.                                                          *
%          - Result: The list of outcomes from the coin tosses.                                         *
%          - Probability: The calculated probability of getting heads.                                  *
%                                                                                                       *
%                                       Example usage:                                                  *
%                            ?- probability_heads(100, Probability).                                    *
%                                     Probability = 0.44.                                               *
% *******************************************************************************************************



% -----------------------------------------------Predicate to simulate a number of coin tosses-------------------------------------------------------------

coin_toss(Flips, Result) :-
    findall(Outcome, (between(1, Flips, _), random_member(Outcome, [heads, tails])), Result).           % Generate a list of random coin toss outcomes


% --------------------------------------------Predicate to calculate the probability of getting heads-------------------------------------------------------

probability_heads(Flips, Probability) :-
    coin_toss(Flips, Result),                                                                           % Simulate the coin tosses
    include(==(heads), Result, Heads),                                                                  % Filter the list to include only heads
    length(Heads, HeadsCount),                                                                          % Count the number of heads
    Probability is HeadsCount / Flips.                                                                  % Calculate the probability of getting heads
