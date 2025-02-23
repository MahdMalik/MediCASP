% BEGIN queries.

% If the list is empty, the element can't be a member
-member(Element, []).
% If found the head and current element match, that's a rule now.
member(Element, [Element | T]).
% Otherwise, skip the head and keep searching.
member(Element, [H | T]) :- member(Element, T).

% Persistent deficits in social communication 
% and social interaction. 3/3 must be met.
social_emotional_deficits(X) :- member(social_emotional_deficits, X). 
non_verbal_comm_deficits(X) :- member(non_verbal_comm_deficits, X). 
rel_maintenance_deficits(X) :- member(rel_maintenance_deficits, X). 

% Restricted, repetitive patterns of behavior, 
% interests, or activities. 2/4 must be met (minimum). 
motor_stereotypes(X) :- member(motor_stereotypes, X). 
rigid_behaviour_patterns(X) :- member(rigid_behaviour_patterns, X). 
highly_perseverative_interests(X) :- member(highly_perseverative_interests, X). 
hyper_hyporeactivity(X) :- member(hyper_hyporeactivity, X). 

% BEGIN rules.

% Per the DSM-V, autism is defined as:
has_autism(X) :- 
    social_emotional_deficits(X),
    non_verbal_comm_deficits(X),
    rel_maintenance_deficits(X),
    restricted_patterns_behaviours(X, _).

% Count matching restricted patterns of behaviors.
restricted_patterns_behaviours(X, Count) :-
    count_restricted_patterns(X, 0, Count).

% Helper rule to count matching restricted patterns.
count_restricted_patterns(X, Acc, Count) :-
    motor_stereotypes(X), !,
    Acc1 is Acc + 1,
    count_restricted_patterns_helper(X, Acc1, Count).
count_restricted_patterns(X, Acc, Count) :-
    count_restricted_patterns_helper(X, Acc, Count).

count_restricted_patterns_helper(X, Acc, Count) :-
    rigid_behaviour_patterns(X), !,
    Acc1 is Acc + 1,
    count_restricted_patterns_helper2(X, Acc1, Count).
count_restricted_patterns_helper(X, Acc, Count) :-
    count_restricted_patterns_helper2(X, Acc, Count).

count_restricted_patterns_helper2(X, Acc, Count) :-
    highly_perseverative_interests(X), !,
    Acc1 is Acc + 1,
    count_restricted_patterns_helper3(X, Acc1, Count).
count_restricted_patterns_helper2(X, Acc, Count) :-
    count_restricted_patterns_helper3(X, Acc, Count).

count_restricted_patterns_helper3(X, Acc, Count) :-
    hyper_hyporeactivity(X), !,
    Count is Acc + 1.
count_restricted_patterns_helper3(_, Acc, Count) :-
    Count is Acc.

% Define levels.
level_one(X) :- 
    social_emotional_deficits(X),
    non_verbal_comm_deficits(X),
    rel_maintenance_deficits(X),
    restricted_patterns_behaviours(X, Count),
    Count = 2.

level_two(X) :- 
    social_emotional_deficits(X),
    non_verbal_comm_deficits(X),
    rel_maintenance_deficits(X),
    restricted_patterns_behaviours(X, Count),
    Count = 3.

level_three(X) :- 
    social_emotional_deficits(X),
    non_verbal_comm_deficits(X),
    rel_maintenance_deficits(X),
    restricted_patterns_behaviours(X, Count),
    Count = 4.