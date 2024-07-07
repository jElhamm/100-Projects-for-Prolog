%****************************************************************************************************
%                                                                                                   *
%                             Check Homomorphism Between Two Graphs                                 *
%                                                                                                   *
%       The given Prolog code defines predicates to check if two graphs are homomorphic. The        *
%       `edge1` and `edge2` predicates define the edges of the two graphs. The `is_homomorphic`     *
%       predicate checks if there is a homomorphism between the two graphs by comparing the         *
%       nodes and edges. The `check_homomorphism` predicate verifies the homomorphism by            *
%       ensuring that the edges in the first graph map correctly to the edges in the second graph.  *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- is_homomorphic.                                                      *
%                                        true                                                       *
%                                                                                                   *
%****************************************************************************************************



% ----------------------------------------Define edges of the first graph---------------------------------------------------

edge1(a, b).
edge1(a, c).
edge1(b, d).
edge1(c, d).
edge1(c, e).
edge1(d, f).
edge1(e, f).

% ----------------------------------------Define edges of the second graph--------------------------------------------------

edge2(1, 2).
edge2(1, 3).
edge2(2, 4).
edge2(3, 4).
edge2(3, 5).
edge2(4, 6).
edge2(5, 6).

% ----------------------------------------The predicate to check if two graphs are homomorphic----------------------------------------

is_homomorphic :-
    nodes1(Nodes1),                                                                         % Get the nodes of both graphs.
    nodes2(Nodes2),
    length(Nodes1, L),                                                                      % Ensure both graphs have the same number of nodes.
    length(Nodes2, L),
    findall((Node1, Node2), (member(Node1, Nodes1), member(Node2, Nodes2)), Pairs),         % Find all possible pairs of nodes.
    permutation(Pairs, Permutation),                                                        % Check permutations of these pairs.
    check_homomorphism(Permutation).                                                        % Verify the homomorphism for each permutation.


% ----------------------------------------The predicate to check if a permutation of node pairs forms a valid homomorphism----------------------------------------

check_homomorphism([]).
check_homomorphism([(X, Y)|Rest]) :-
    (edge1(X, Z) -> edge2(Y, W), member((Z, W), Rest); true),                               % Ensure that edges in the first graph map correctly to edges in the second graph.
    check_homomorphism(Rest).


% ----------------------------------------The predicate to find all nodes in the first graph----------------------------------------

nodes1(Nodes) :-
    findall(Node, (edge1(Node, _); edge1(_, Node)), NodeList),                              % Collect all nodes from the edges.
    sort(NodeList, Nodes).                                                                  % Remove duplicates and sort the list of nodes. 


% ----------------------------------------The predicate to find all nodes in the second graph----------------------------------------

nodes2(Nodes) :-
    findall(Node, (edge2(Node, _); edge2(_, Node)), NodeList),                              % Collect all nodes from the edges.
    sort(NodeList, Nodes).                                                                  % Remove duplicates and sort the list of nodes.
