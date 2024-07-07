%****************************************************************************************************
%                                                                                                   *
%                                Check if a Graph is Connected                                      *
%                                                                                                   *
%       The given Prolog code defines predicates to check if a graph is connected. The `nodes`      *
%       predicate finds all unique nodes in the graph. The `is_connected` predicate verifies        *
%       connectivity by ensuring every node can reach all other nodes using the `check_all_paths`   *
%       and `path_to_all` predicates. The `path` and `travel` predicates are used to find paths     *
%       between nodes.                                                                              *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- is_connected.                                                        *
%                                        true                                                       *
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

% -----------------------------------------The predicate to find all nodes in a graph--------------------------------------------------------

nodes(Nodes) :-
    findall(Node, (edge(Node, _); edge(_, Node)), NodeList),    % Use findall to collect all nodes, both from the start and end of each edge.
    sort(NodeList, Nodes).                                      % Remove duplicates and sort the list of nodes.


% -----------------------------------------The predicate to check if the graph is connected--------------------------------------------------------

is_connected :-
    nodes(Nodes),                                               % Find all nodes in the graph.
    check_all_paths(Nodes).                                     % Check if all nodes can reach each other.


% -----------------------------------------The predicate to check paths between all nodes--------------------------------------------------------

check_all_paths([]).
check_all_paths([Node|Nodes]) :-
    path_to_all(Node, Nodes),                                   % Check if the current node can reach all other nodes.
    check_all_paths(Nodes).                                     % Recursively check for the remaining nodes.


% -----------------------------------------The predicate to check paths from one node to all other nodes--------------------------------------------------------

path_to_all(_, []).
path_to_all(Node, [OtherNode|Nodes]) :-
    path(Node, OtherNode),                                      % Check if there is a path from Node to OtherNode.
    path_to_all(Node, Nodes).                                   % Recursively check for the remaining nodes.


% -----------------------------------------The predicate to find a path between two nodes--------------------------------------------------------

path(X, Y) :-
    travel(X, Y, [X]).


% -----------------------------------------The travel predicate handles both the base case and the recursive case--------------------------------------------------------

travel(X, Y, _) :-
    % Base case: A direct edge exists between two nodes.
    edge(X, Y).

travel(X, Y, Visited) :-
    edge(X, Z),                                                 % Recursive case: Move to the next node and continue finding the path.
    \+ member(Z, Visited),                                      % Ensure no node is revisited.
    travel(Z, Y, [Z | Visited]).
