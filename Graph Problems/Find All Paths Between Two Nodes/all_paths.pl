%****************************************************************************************************
%                                                                                                   *
%                                 Find All Paths Between Two Nodes                                  *
%                                                                                                   *
%       The given Prolog code defines predicates to find all paths between two nodes in a graph.    *
%       The `all_paths` predicate uses the `findall` predicate to collect all paths found by        *
%       the `travel_all` predicate. The `travel_all` predicate handles both the base case and       *
%       the recursive case:                                                                         *
%       1. Base case: A direct edge exists between two nodes.                                       *
%       2. Recursive case: Move to the next node and find the path recursively, ensuring no cycles. *
%                                                                                                   *
%                                       Example usage:                                              *
%                                ?- all_paths(a, f, Paths).                                         *
%                      Paths = [[a, b, d, f], [a, c, d, f], [a, c, e, f]]                           *
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


% -------------------------------------The predicate to find all paths between two nodes----------------------------------------------------

all_paths(X, Y, Paths) :-
    findall(Path, travel_all(X, Y, [X], Path), Paths).                          % Use findall to collect all paths found by travel_all.


% ------------------------------------Base case: A direct edge exists between two nodes----------------------------------------------------

travel_all(X, Y, Visited, Path) :-
    edge(X, Y),
    reverse([Y|Visited], Path).


% -----------------------------------Recursive case: Move to the next node and find the path recursively------------------------------------------------------

travel_all(X, Y, Visited, Path) :-
    edge(X, Z),
    \+ member(Z, Visited),                                                      % Ensure no cycles by checking if the node has not been visited.
    travel_all(Z, Y, [Z|Visited], Path).
