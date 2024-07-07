%****************************************************************************************************
%                                                                                                   *
%                            Convert a Directed Graph to an Undirected Graph                        *
%                                                                                                   *
%       The given Prolog code defines predicates to convert a directed graph into an                *
%       undirected graph by defining edges in both directions. The `directed_edge` predicate        *
%       defines the directed edges, while the `undirected_edge` predicate creates undirected        *
%       edges by considering both directions of each directed edge.                                 *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- undirected_edge(a, b).                                               *
%                                        true                                                       *
%                           ?- undirected_edge(b, a).                                               *
%                                        true                                                       *
%                                                                                                   *
%****************************************************************************************************




% -----------------------------------------Define directed edges of the graph------------------------------------------------

directed_edge(a, b).
directed_edge(a, c).
directed_edge(b, d).
directed_edge(c, d).
directed_edge(c, e).
directed_edge(d, f).
directed_edge(e, f).


% The predicate to convert a directed edge to an undirected edge.
undirected_edge(X, Y) :-
    directed_edge(X, Y).

undirected_edge(X, Y) :-
    directed_edge(Y, X).
