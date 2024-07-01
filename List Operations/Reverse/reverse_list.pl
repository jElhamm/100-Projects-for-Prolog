%****************************************************************************************************
%                                                                                                   *
%                                       Reverse List                                                *
%                                                                                                   *
%         This Prolog code defines a predicate reverse_list/2 to reverse a list.                    *
%         It consists of two rules. The first rule specifies the base case for an empty list,       *
%         where the predicate reverse_list([], []). states that reversing an empty list results     *
%         in an empty list. The second rule defines the main predicate for reversing a list.        *
%         It states that to reverse a list [Head|Tail] (where Head is the first element and Tail    *
%         is the remainder of the list), the predicate first recursively reverses the Tail of the   *
%         list to obtain ReversedTail. Then, using the append/3 predicate, it appends [Head] to     *
%         the ReversedTail to obtain the Reversed list.                                             *
%                                                                                                   *
%                                       Example usage:                                              *
%                           ?- reverse_list([1, 2, 3, 4], Reversed).                                *
%                                   Reversed = [4, 3, 2, 1]                                         *
%                                                                                                   *
%****************************************************************************************************



% Predicate to reverse an empty list
reverse_list([], []).                  

% Predicate to reverse a list
reverse_list([Head|Tail], Reversed) :- 
    reverse_list(Tail, ReversedTail),               % Recursively reverse the tail of the list
    append(ReversedTail, [Head], Reversed).         % Append the reversed tail with the head to get the reversed list
