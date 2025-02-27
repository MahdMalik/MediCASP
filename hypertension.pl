% This is the prolog program for hypertension/hypotension screening. 

% BEGIN queries.

infant_toddler_hyper_hypo_tension(Systolic, Diastolic, hypertension) :-
    Systolic > 105.

infant_toddler_hyper_hypo_tension(Systolic, Diastolic, hypertension) :-
    Diastolic > 66.

infant_toddler_hyper_hypo_tension(Systolic, Diastolic, hypotension) :-
    Systolic < 87.

infant_toddler_hyper_hypo_tension(Systolic, Diastolic, hypotension) :-
    Diastolic < 53.

% Infant and toddler hypertension/hypotension
has_hyper_hypo_tension(Systolic, Diastolic, Year, Gender, Y) :-
    Year < 4, infant_toddler_hyper_hypo_tension(Systolic, Diastolic, Y).


preschool_hyper_hypo_tension(Systolic, Diastolic, hypertension) :-
    Systolic > 110.

preschool_hyper_hypo_tension(Systolic, Diastolic, hypertension) :-
    Diastolic > 70.

preschool_hyper_hypo_tension(Systolic, Diastolic, hypotension) :-
    Systolic < 95.

preschool_hyper_hypo_tension(Systolic, Diastolic, hypotension) :-
    Diastolic < 56.

% Preschool hypertension/hypotension
has_hyper_hypo_tension(Systolic, Diastolic, Year, Gender, Y) :-
    Year < 7, preschool_hyper_hypo_tension(Systolic, Diastolic, Y).


schoolage_hyper_hypo_tension(Systolic, Diastolic, hypertension) :-
    Systolic > 112.

schoolage_hyper_hypo_tension(Systolic, Diastolic, hypertension) :-
    Diastolic > 71.

schoolage_hyper_hypo_tension(Systolic, Diastolic, hypotension) :-
    Systolic < 97.

schoolage_hyper_hypo_tension(Systolic, Diastolic, hypotension) :-
    Diastolic < 57.

% School-age hypertension/hypotension
has_hyper_hypo_tension(Systolic, Diastolic, Year, Gender, Y) :-
    Year < 13, schoolage_hyper_hypo_tension(Systolic, Diastolic, Y).


teenage_hyper_hypo_tension(Systolic, Diastolic, hypertension) :-
    Systolic > 128.

teenage_hyper_hypo_tension(Systolic, Diastolic, hypertension) :-
    Diastolic > 80.

teenage_hyper_hypo_tension(Systolic, Diastolic, hypotension) :-
    Systolic < 112.

teenage_hyper_hypo_tension(Systolic, Diastolic, hypotension) :-
    Diastolic < 66.

% Teenage hypertension/hypotension
has_hyper_hypo_tension(Systolic, Diastolic, Year, Gender, Y) :-
    Year < 18, teenage_hyper_hypo_tension(Systolic, Diastolic, Y).


young_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypertension) :-
    Systolic > 134.

young_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypertension) :-
    Diastolic > 85.

young_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypotension) :-
    Systolic < 104.

young_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypotension) :-
    Diastolic < 55.

young_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypertension) :-
    Systolic > 125.

young_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypertension) :-
    Diastolic > 83.

young_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypotension) :-
    Systolic < 95.

young_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypotension) :-
    Diastolic < 53.

% Young adult hypertension/hypotension
has_hyper_hypo_tension(Systolic, Diastolic, Year, Gender, Y) :-
    Year < 40, young_adult_hyper_hypo_tension(Systolic, Diastolic, Gender, Y).


mid_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypertension) :-
    Systolic > 139.

mid_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypertension) :-
    Diastolic > 92.

mid_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypotension) :-
    Systolic < 109.

mid_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypotension) :-
    Diastolic < 62.

mid_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypertension) :-
    Systolic > 137.

mid_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypertension) :-
    Diastolic > 89.

mid_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypotension) :-
    Systolic < 107.

mid_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypotension) :-
    Diastolic < 59.

% Middle adult hypertension/hypotension
has_hyper_hypo_tension(Systolic, Diastolic, Year, Gender, Y) :-
    Year < 60, mid_adult_hyper_hypo_tension(Systolic, Diastolic, Gender, Y).


old_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypertension) :-
    Systolic > 148.

old_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypertension) :-
    Diastolic > 84.

old_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypotension) :-
    Systolic < 118.

old_adult_hyper_hypo_tension(Systolic, Diastolic, male, hypotension) :-
    Diastolic < 54.

old_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypertension) :-
    Systolic > 154.

old_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypertension) :-
    Diastolic > 83.

old_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypotension) :-
    Systolic < 124.

old_adult_hyper_hypo_tension(Systolic, Diastolic, female, hypotension) :-
    Diastolic < 53.

% Old adult hypertension/hypotension
has_hyper_hypo_tension(Systolic, Diastolic, Year, Gender, Y) :-
    old_adult_hyper_hypo_tension(Systolic, Diastolic, Gender, Y).
    
?- has_hyper_hypo_tension(140, 40, 20, male, Y).