%****************************************************************************************************
%                                                                                                   *
%                                 Detect Cycles in a Directed Graph                                 *
%                                                                                                   *
%       The given Prolog code defines predicates to detect cycles in a directed graph.              *
%       The `has_cycle` predicate checks for the existence of a cycle by starting from each node    *
%       with an outgoing edge. The `cycle` predicate handles both the base case and the recursive   *
%       case:                                                                                       *
%       1. Base case: A cycle is detected if a node revisits any node in the visited list.          *
%       2. Recursive case: Move to the next node and continue checking for cycles, ensuring no      *
%          node is revisited.                                                                       *
%                                                                                                   *
%                                       Example usage:                                              *
%                                       ?- has_cycle.                                               *
%                                           true                                                    *
%                                                                                                   *
%****************************************************************************************************



% -----------------------------------------Define edges of the graph--------------------------------------------------------

edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(c, e).
edge(d, f).
edge(e, f).
edge(f, c).


% The predicate to check if the graph has any cycle.
has_cycle :-
    edge(X, _),                                                 % Start from each node with an outgoing edge.
    cycle(X, [X]).                                              % Check for cycles starting from node X.

% Base case: A cycle is detected if a node revisits any node in the visited list.
cycle(X, Visited) :-
    edge(X, Z),
    member(Z, Visited).

% Recursive case: Move to the next node and continue checking for cycles.
cycle(X, Visited) :-
    edge(X, Z),
    \+ member(Z, Visited),                                      % Ensure no node is revisited.
    cycle(Z, [Z|Visited]).
