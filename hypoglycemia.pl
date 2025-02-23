% BEGIN queries.

% Custom member predicate.
-member(Element, []).
member(Element, [Element | T]).
member(Element, [H | T]) :- member(Element, T).

% Hypoglycemia symptoms

low_blood_sugar(X) :- member(low_blood_sugar, X).  % Blood glucose below 70 mg/dL
shakiness(X) :- member(shakiness, X).
sweating(X) :- member(sweating, X).
hunger(X) :- member(hunger, X).
irritability(X) :- member(irritability, X).
dizziness(X) :- member(dizziness, X).
confusion(X) :- member(confusion, X).
weakness(X) :- member(weakness, X).
blurred_vision(X) :- member(blurred_vision, X).
loss_of_consciousness(X) :- member(loss_of_consciousness, X).

% Hypoglycemia diagnosis: At least 4 symptoms must be present.
has_hypoglycemia(X) :-
    count_symptoms(X, Count),
    Count >= 4.

% Count present symptoms.
count_symptoms(X, Count) :-
    count_criteria(X, 0, Count).

% Base case: No more symptoms to check.
count_criteria(_, Acc, Count) :- Count is Acc.

% Recursive case: Check each symptom.
count_criteria(X, Acc, Count) :-
    low_blood_sugar(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper(X, Acc1, Count).
count_criteria(X, Acc, Count) :-
    count_criteria_helper(X, Acc, Count).

count_criteria_helper(X, Acc, Count) :-
    shakiness(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper2(X, Acc1, Count).
count_criteria_helper(X, Acc, Count) :-
    count_criteria_helper2(X, Acc, Count).

count_criteria_helper2(X, Acc, Count) :-
    sweating(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper3(X, Acc1, Count).
count_criteria_helper2(X, Acc, Count) :-
    count_criteria_helper3(X, Acc, Count).

count_criteria_helper3(X, Acc, Count) :-
    hunger(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper4(X, Acc1, Count).
count_criteria_helper3(X, Acc, Count) :-
    count_criteria_helper4(X, Acc, Count).

count_criteria_helper4(X, Acc, Count) :-
    irritability(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper5(X, Acc1, Count).
count_criteria_helper4(X, Acc, Count) :-
    count_criteria_helper5(X, Acc, Count).

count_criteria_helper5(X, Acc, Count) :-
    dizziness(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper6(X, Acc1, Count).
count_criteria_helper5(X, Acc, Count) :-
    count_criteria_helper6(X, Acc, Count).

count_criteria_helper6(X, Acc, Count) :-
    confusion(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper7(X, Acc1, Count).
count_criteria_helper6(X, Acc, Count) :-
    count_criteria_helper7(X, Acc, Count).

count_criteria_helper7(X, Acc, Count) :-
    weakness(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper8(X, Acc1, Count).
count_criteria_helper7(X, Acc, Count) :-
    count_criteria_helper8(X, Acc, Count).

count_criteria_helper8(X, Acc, Count) :-
    blurred_vision(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper9(X, Acc1, Count).
count_criteria_helper8(X, Acc, Count) :-
    count_criteria_helper9(X, Acc, Count).

count_criteria_helper9(X, Acc, Count) :-
    loss_of_consciousness(X), !,
    Count is Acc + 1.
count_criteria_helper9(_, Acc, Count) :-
    Count is Acc.

% Define severity levels based on symptom count.

mild_hypoglycemia(X) :-
    has_hypoglycemia(X),
    count_symptoms(X, 4).

moderate_hypoglycemia(X) :-
    has_hypoglycemia(X),
    count_symptoms(X, 5).

severe_hypoglycemia(X) :-
    has_hypoglycemia(X),
    count_symptoms(X, 6).
