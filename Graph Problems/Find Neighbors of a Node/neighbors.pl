%****************************************************************************************************
%                                                                                                   *
%                                Find Neighbors of a Node in a Graph                                *
%                                                                                                   *
%       The given Prolog code defines a predicate to find all neighbors of a node in a graph.       *
%       The `neighbors` predicate uses the `findall` predicate to collect all neighbors by          *
%       checking both incoming and outgoing edges. The neighbors are then sorted and returned.      *
%                                                                                                   *
%                                       Example usage:                                              *
%                                 ?- neighbors(c, Neighbors).                                       *
%                                    Neighbors = [a, d, e, f]                                       *
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

% The predicate to find all neighbors of a node.
neighbors(Node, Neighbors) :-
    findall(Neighbor, (edge(Node, Neighbor); edge(Neighbor, Node)), NeighborsList),             % Use findall to collect all neighbors, considering both directions of edges.
    sort(NeighborsList, Neighbors).                                                             % Remove duplicates and sort the list of neighbors.
