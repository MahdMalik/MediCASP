% BEGIN queries.

% Custom member predicate.
-member(Element, []).
member(Element, [Element | T]).
member(Element, [H | T]) :- member(Element, T).

% Type 2 Diabetes Diagnostic Features

% A1C test categories.
a1c_below_0517_percent(X) :- member(a1c_below_0517_percent, X). % Normal
a1c_0517_to_064_percent(X) :- member(a1c_0517_to_064_percent, X). % Prediabetes
a1c_above_065_percent(X) :- member(a1c_above_065_percent, X). % Diabetes

% Fasting Blood Sugar test.
fbs_below_100_mgdl(X) :- member(fbs_below_100_mgdl, X). % Normal
fbs_100_to_125_mgdl(X) :- member(fbs_100_to_125_mgdl, X). % Prediabetes
fbs_above_126_mgdl(X) :- member(fbs_above_126_mgdl, X). % Diabetes

% Random Blood Sugar test.
rbs_above_200_mgdl(X) :- member(rbs_above_200_mgdl, X). % Diabetes

% Oral Glucose Tolerance Test (OGTT).
ogtt_below_140_mgdl(X) :- member(ogtt_below_140_mgdl, X). % Normal
ogtt_140_to_199_mgdl(X) :- member(ogtt_140_to_199_mgdl, X). % Prediabetes
ogtt_above_200_mgdl(X) :- member(ogtt_above_200_mgdl, X). % Diabetes

% Common Symptoms of Type 2 Diabetes
frequent_urination(X) :- member(frequent_urination, X).
increased_thirst(X) :- member(increased_thirst, X).
fatigue(X) :- member(fatigue, X).
blurred_vision(X) :- member(blurred_vision, X).
slow_healing_wounds(X) :- member(slow_healing_wounds, X).
unexplained_weight_loss(X) :- member(unexplained_weight_loss, X).
tingling_numbness_hands_feet(X) :- member(tingling_numbness_hands_feet, X).
dark_skin_patches(X) :- member(dark_skin_patches, X).

% Type 2 Diabetes diagnosis: At least **4 symptoms** or **a diagnostic test** for diabetes must be present.
has_type_2(X) :-
    diabetes_diagnostic_test(X).
has_type_2(X) :-
    count_symptoms(X, Count),
    Count >= 4.

% Diagnostic test confirmation.
diabetes_diagnostic_test(X) :-
    a1c_above_065_percent(X).
diabetes_diagnostic_test(X) :-
    fbs_above_126_mgdl(X).
diabetes_diagnostic_test(X) :-
    rbs_above_200_mgdl(X).
diabetes_diagnostic_test(X) :-
    ogtt_above_200_mgdl(X).

% Count present symptoms.
count_symptoms(X, Count) :-
    count_criteria(X, 0, Count).

% Base case: No more symptoms to check.
count_criteria(_, Acc, Count) :- Count is Acc.

% Recursive case: Check each symptom.
count_criteria(X, Acc, Count) :-
    frequent_urination(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper(X, Acc1, Count).
count_criteria(X, Acc, Count) :-
    count_criteria_helper(X, Acc, Count).

count_criteria_helper(X, Acc, Count) :-
    increased_thirst(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper2(X, Acc1, Count).
count_criteria_helper(X, Acc, Count) :-
    count_criteria_helper2(X, Acc, Count).

count_criteria_helper2(X, Acc, Count) :-
    fatigue(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper3(X, Acc1, Count).
count_criteria_helper2(X, Acc, Count) :-
    count_criteria_helper3(X, Acc, Count).

count_criteria_helper3(X, Acc, Count) :-
    blurred_vision(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper4(X, Acc1, Count).
count_criteria_helper3(X, Acc, Count) :-
    count_criteria_helper4(X, Acc, Count).

count_criteria_helper4(X, Acc, Count) :-
    slow_healing_wounds(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper5(X, Acc1, Count).
count_criteria_helper4(X, Acc, Count) :-
    count_criteria_helper5(X, Acc, Count).

count_criteria_helper5(X, Acc, Count) :-
    unexplained_weight_loss(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper6(X, Acc1, Count).
count_criteria_helper5(X, Acc, Count) :-
    count_criteria_helper6(X, Acc, Count).

count_criteria_helper6(X, Acc, Count) :-
    tingling_numbness_hands_feet(X), !,
    Acc1 is Acc + 1,
    count_criteria_helper7(X, Acc1, Count).
count_criteria_helper6(X, Acc, Count) :-
    count_criteria_helper7(X, Acc, Count).

count_criteria_helper7(X, Acc, Count) :-
    dark_skin_patches(X), !,
    Count is Acc + 1.
count_criteria_helper7(_, Acc, Count) :-
    Count is Acc.

% Define severity levels based on symptom count.

prediabetes(X) :-
    count_symptoms(X, Count),
    Count = 3.
prediabetes(X) :-
    a1c_0517_to_064_percent(X).
prediabetes(X) :-
    fbs_100_to_125_mgdl(X).
prediabetes(X) :-
    ogtt_140_to_199_mgdl(X).

mild_diabetes(X) :-
    has_type_2(X),
    count_symptoms(X, 4).

moderate_diabetes(X) :-
    has_type_2(X),
    count_symptoms(X, 5).

severe_diabetes(X) :-
    has_type_2(X),
    count_symptoms(X, 6).
