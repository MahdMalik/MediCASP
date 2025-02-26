% This is the prolog program for Arthritis screening. 

% BEGIN queries.

% Custom member predicate.
-member(Element, []).
member(Element, [Element | T]).
member(Element, [H | T]) :- member(Element, T).

% Rheumatoid Arthritis (RA) diagnostic features

joint_swelling(X) :- member(joint_swelling, X).
small_joint_involvement(X) :- member(small_joint_involvement, X).
symmetric_arthritis(X) :- member(symmetric_arthritis, X).
positive_rf(X) :- member(positive_rf, X).
positive_acpa(X) :- member(positive_acpa, X).
elevated_crp(X) :- member(elevated_crp, X).
elevated_esr(X) :- member(elevated_esr, X).
symptom_duration(X) :- member(symptom_duration, X).

% Rheumatoid Arthritis diagnosis: At least 5 symptoms must be present.
has_rheumatoid_arthritis(X) :-
    count_symptoms(X, Count),
    Count >= 5.

% Count present symptoms.
count_symptoms(X, Count) :-
    count_criteria(X, 0, Count).

% Base case: No more symptoms to check.
count_criteria(_, Acc, Count) :- Count is Acc.

% Recursive case: Check each symptom.
count_criteria(X, Acc, Count) :-
    joint_swelling(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper(X, Acc1, Count).
count_criteria(X, Acc, Count) :-
    count_criteria_helper(X, Acc, Count).

count_criteria_helper(X, Acc, Count) :-
    small_joint_involvement(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper2(X, Acc1, Count).
count_criteria_helper(X, Acc, Count) :-
    count_criteria_helper2(X, Acc, Count).

count_criteria_helper2(X, Acc, Count) :-
    symmetric_arthritis(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper3(X, Acc1, Count).
count_criteria_helper2(X, Acc, Count) :-
    count_criteria_helper3(X, Acc, Count).

count_criteria_helper3(X, Acc, Count) :-
    positive_rf(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper4(X, Acc1, Count).
count_criteria_helper3(X, Acc, Count) :-
    count_criteria_helper4(X, Acc, Count).

count_criteria_helper4(X, Acc, Count) :-
    positive_acpa(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper5(X, Acc1, Count).
count_criteria_helper4(X, Acc, Count) :-
    count_criteria_helper5(X, Acc, Count).

count_criteria_helper5(X, Acc, Count) :-
    elevated_crp(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper6(X, Acc1, Count).
count_criteria_helper5(X, Acc, Count) :-
    count_criteria_helper6(X, Acc, Count).

count_criteria_helper6(X, Acc, Count) :-
    elevated_esr(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper7(X, Acc1, Count).
count_criteria_helper6(X, Acc, Count) :-
    count_criteria_helper7(X, Acc, Count).

count_criteria_helper7(X, Acc, Count) :-
    symptom_duration(X), !,
    Count is Acc + 1.
count_criteria_helper7(_, Acc, Count) :-
    Count is Acc.

% Define severity levels based on symptom count.

mild_ra(X) :-
    has_rheumatoid_arthritis(X),
    count_symptoms(X, 5).

moderate_ra(X) :-
    has_rheumatoid_arthritis(X),
    count_symptoms(X, 6).

severe_ra(X) :-
    has_rheumatoid_arthritis(X),
    count_symptoms(X, 7).

has_ra(X, Y) :-
    Y = severe, severe_ra(X).

has_ra(X, Y) :-
    Y = moderate, moderate_ra(X).

has_ra(X, Y) :-
    Y = mild, mild_ra(X).
?- has_ra([joint_swelling, small_joint_involvement, symmetric_arthritis, not_positive_rf, positive_acpa, not_elevated_crp, elevated_esr, symptom_duration], Y).
?- has_ra([joint_swelling, small_joint_involvement, symmetric_arthritis, positive_rf, positive_acpa, elevated_crp, elevated_esr, symptom_duration], Y).
?- has_ra([joint_swelling, small_joint_involvement, symmetric_arthritis, positive_rf, positive_acpa, elevated_crp, elevated_esr, symptom_duration], Y).