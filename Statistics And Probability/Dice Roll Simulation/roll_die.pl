
% *******************************************************************************************************
%                            Simulating Die Rolls and Calculating Probabilities                         *
%                                                                                                       *
%      This set of predicates simulates rolling a die and calculates the probability of each outcome    *
%      from 1 to 6 after a specified number of rolls.                                                   *
%                                                                                                       *
%      Usage: roll_die(Outcome)                                                                         *
%             roll_dice(N, Results)                                                                     *
%             probability_roll(N, Probability)                                                          *
%          - Outcome: The result of a single die roll.                                                  *
%          - N: The number of die rolls.                                                                *
%          - Results: The list of outcomes from the die rolls.                                          *
%          - Probability: The calculated probabilities of each outcome from 1 to 6.                     *
%                                                                                                       *
%                                         Example usage:                                                *
%                              ?- probability_roll(100, Probability).                                   *
%                         Probability = [0.14, 0.21, 0.14, 0.19, 0.18, 0.14].                           *
% *******************************************************************************************************



% -------------------------------------------------------------Predicate to simulate a single die roll-------------------------------------------------------------------

roll_die(Outcome) :-
    random_between(1, 6, Outcome).                                                                                          % Generate a random number between 1 and 6


% -----------------------------------------------Predicate to simulate a specified number of die rolls and collect results-----------------------------------------------

roll_dice(N, Results) :-
    findall(Outcome, (between(1, N, _), roll_die(Outcome)), Results).                                                       % Collect N die roll results


% -----------------------------------------------Predicate to calculate the probability of each outcome from 1 to 6------------------------------------------------------

probability_roll(N, Probability) :-
    roll_dice(N, Results), % Roll the die N times
    findall(P, (between(1, 6, Face), count_occurrences(Face, Results, Count), P is Count / N), Probability).                % Calculate probabilities


% -----------------------------------------------Helper predicate to count the occurrences of each number in the results-------------------------------------------------

count_occurrences(X, List, Count) :-
    include(==(X), List, Filtered),                                                                                         % Filter the list to include only occurrences of X
    length(Filtered, Count).                                                                                                % Count the number of occurrences
