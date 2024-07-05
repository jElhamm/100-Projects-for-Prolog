%****************************************************************************************************
%                                                                                                   *
%                                 Find and Count All Nodes in a Graph                               *
%                                                                                                   *
%       The given Prolog code defines predicates to find and count all nodes in a graph.            *
%       The `nodes` predicate uses the `findall` predicate to collect all nodes by checking         *
%       both the start and end of each edge. The `count_nodes` predicate counts the number of       *
%       unique nodes found by the `nodes` predicate.                                                *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- nodes(Nodes).                                                        *
%                                        Nodes = [a, b, c, d, e, f]                                 *
%                           ?- count_nodes(Count).                                                  *
%                                        Count = 6                                                  *
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


% The predicate to find all nodes in a graph.
nodes(Nodes) :-
    % Use findall to collect all nodes, both from the start and end of each edge.
    findall(Node, (edge(Node, _); edge(_, Node)), NodeList),
    % Remove duplicates and sort the list of nodes.
    sort(NodeList, Nodes).


% The predicate to count the number of nodes in a graph.
count_nodes(Count) :-
    % Find all unique nodes.
    nodes(Nodes),
    % Count the number of nodes.
    length(Nodes, Count).
