%****************************************************************************************************************
%                                                                                                               *
%                                             Check Membership                                                  *
%                                                                                                               *
%       The code above defines a predicate list_member/2 to check if an element is a member of a list.          *
%       The first clause states that an element X is a member of the list if it is the head of the list.        *
%       The second clause states that X is a member of the list if it is a member of the tail of the list.      *
%                                                                                                               *
%                                                 Example:                                                      *
%                                   ?- list_member(2, [1, 2, 3, 4]).                                            *
%                              Yes, 2 is a member of the list [1, 2, 3, 4].                                     *
%                                                                                                               *
%****************************************************************************************************************




list_member(X, [X|_]).       
list_member(X, [_|Tail]) :-  
    list_member(X, Tail).
