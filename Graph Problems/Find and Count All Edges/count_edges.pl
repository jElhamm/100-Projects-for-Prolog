%****************************************************************************************************
%                                                                                                   *
%                                Find and Count All Edges in a Graph                                *
%                                                                                                   *
%       The given Prolog code defines predicates to find and count all edges in a graph.            *
%       The `edges` predicate uses the `findall` predicate to collect all edges as pairs.           *
%       The `count_edges` predicate counts the number of edges found by the `edges` predicate.      *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- edges(Edges).                                                        *
%                                        Edges = [(a,b), (a,c), (b,d), (c,d), (c,e), (d,f), (e,f)]   *
%                           ?- count_edges(Count).                                                  *
%                                        Count = 7                                                  *
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


% The predicate to find all edges in a graph.
edges(Edges) :-
    findall((X, Y), edge(X, Y), Edges).                         % Use findall to collect all edges as pairs.


% The predicate to count the number of edges in a graph.
count_edges(Count) :-
    edges(Edges),                                               % Find all edges.
    length(Edges, Count).                                       % Count the number of edges.
