%************************************************************************************************************
%                                                                                                           *
%                                         Graph Path Finder                                                 *
%                                                                                                           *
%       This Prolog code defines a simple graph using edge facts and determines if there                    *
%       is a path between two nodes.                                                                        *
%       The 'edge' facts represent directed edges between nodes.                                            *
%       The 'path' rules define a path between two nodes X and Y.                                           *
%       The first rule states that there is a path from X to Y if there is a direct edge from X to Y.       *
%       The second rule states that there is a path from X to Y if there is a direct edge from X            *
%       to some node Z and there is a path from Z to Y, ensuring that nodes are not revisited to prevent    *
%       cycles.                                                                                             *
%                                                                                                           *
%                                          Example usage:                                                   *
%                                          ?- path(a, f).                                                   *
%                                          Expected: true                                                   *
%                                                                                                           *
%************************************************************************************************************




%------------------------------The main part of the code to find the path between two nodes--------------------------------------------------

edge(a, b).                                         % There is a direct edge from node 'a' to node 'b'
edge(b, c).                                         % There is a direct edge from node 'b' to node 'c'
edge(b, d).                                         % There is a direct edge from node 'b' to node 'd'
edge(c, e).                                         % There is a direct edge from node 'c' to node 'e'
edge(d, e).                                         % There is a direct edge from node 'd' to node 'e'
edge(e, f).                                         % There is a direct edge from node 'e' to node 'f'
edge(f, g).                                         % There is a direct edge from node 'f' to node 'g'
edge(g, h).                                         % There is a direct edge from node 'g' to node 'h'
edge(h, i).                                         % There is a direct edge from node 'h' to node 'i'

path(X, Y) :- path(X, Y, []).                      % Rule to find a path between X and Y using an empty visited list
path(X, Y, _) :- edge(X, Y).                       % Rule to define a direct path between X and Y
path(X, Y, Visited) :-                             % Rule to find a path between X and Y with a non-empty visited list
    edge(X, Z),                                    % There exists an edge from X to Z
    \+ member(Z, Visited),                         % Z is not already visited (to prevent cycles)
    path(Z, Y, [Z|Visited]).                       % Continue the path from Z to Y, adding Z to Visited

member(X, [X|_Tail]).                              % Base case: X is the head of the list
member(X, [_Head|Tail]) :-                         % Recursive case: X is a member of the Tail of the list
    member(X, Tail). 







%------------------------------Test queries to find paths between nodes--------------------------------------------------

% Simple direct path
% ?- path(a, b).                                     % Expected: true

% Path with one intermediate node
% ?- path(a, c).                                     % Expected: true

% Path with multiple intermediate nodes
% ?- path(a, f).                                     % Expected: true (a -> c -> e -> f)

% No path between nodes
% ?- path(b, a).                                     % Expected: false

% Path with two intermediate nodes
% ?- path(b, d).                                     % Expected: true (b -> c -> d)

% Path that goes through all nodes
% ?- path(a, e).                                     % Expected: true (a -> c -> e)

% Complex path
% ?- path(a, f).                                     % Expected: true (a -> c -> e -> f)

% Path to itself
% ?- path(a, a).                                     % Expected: false (no self-loop in the graph)

% Path not existing
% ?- path(d, b).                                     % Expected: false
