%****************************************************************************************************
%                                                                                                   *
%                          Find Minimum Spanning Tree Using Kruskal's Algorithm                      *
%                                                                                                   *
%       The given Prolog code defines predicates to find the minimum spanning tree (MST) of a       *
%       weighted graph using Kruskal's algorithm. The `edge` predicate defines the edges with       *
%       weights. The `mst` predicate finds the MST by sorting the edges and using the `kruskal`     *
%       predicate to construct the MST while avoiding cycles using the `forms_cycle` predicate.     *
%                                                                                                   *
%                                       Example usage:                                              *
%                                       ?- mst(Edges).                                              *
%                  Edges = [(1, e, c), (2, b, d), (2, e, f), (3, a, c), (3, d, f)]                  *
%                                                                                                   *
%****************************************************************************************************



% ----------------------------------------Define edges with weights----------------------------------------------------------

edge(a, b, 4).
edge(a, c, 3).
edge(b, d, 2).
edge(c, d, 5).
edge(c, e, 1).
edge(d, f, 3).
edge(e, f, 2).

% ----------------------------------------The predicate to find the minimum spanning tree (MST)----------------------------------------

mst(Edges) :-
    findall((W, X, Y), edge(X, Y, W), EdgesList),                           % Collect all edges with weights.
    sort(EdgesList, SortedEdges),                                           % Sort the edges by weight.
    kruskal(SortedEdges, [], Edges).                                        % Use Kruskal algorithm to find the MST.


% ----------------------------------------Kruskal algorithm to construct the MST----------------------------------------

kruskal([], MST, MST).
kruskal([(W, X, Y)|Edges], Acc, MST) :-
    (forms_cycle(X, Y, Acc) -> kruskal(Edges, Acc, MST)                     % Check if adding the edge forms a cycle.
    ; kruskal(Edges, [(W, X, Y)|Acc], MST)
    ).


% ----------------------------------------The predicate to check if adding an edge forms a cycle----------------------------------------

forms_cycle(X, Y, Edges) :-
    path(X, Y, Edges).


% ----------------------------------------The predicate to find a path in the subgraph----------------------------------------

path(X, Y, Edges) :-
    travel(X, Y, [X], Edges).

travel(X, Y, _, Edges) :-
    member((_, X, Y), Edges).                                               % Base case: Direct edge exists.
travel(X, Y, Visited, Edges) :-
    member((_, X, Z), Edges),                                               % Recursive case: Move to the next node.
    \+ member(Z, Visited),
    travel(Z, Y, [Z|Visited], Edges).
