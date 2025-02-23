%--------------------------------------------------
% List Membership
%--------------------------------------------------
member(Element, [Element|_]).
member(Element, [_|T]) :- member(Element, T).

%--------------------------------------------------
% Cognitive Domains (Modest Deficits)
%--------------------------------------------------
complex_attention(X)    :- member(complex_attention, X).
executive_function(X)   :- member(executive_function, X).
learning_memory(X)      :- member(learning_memory, X).
language(X)             :- member(language, X).
perceptual_motor(X)     :- member(perceptual_motor, X).
social_cognition(X)     :- member(social_cognition, X).

%--------------------------------------------------
% Cognitive Domains (Substantial Deficits)
%--------------------------------------------------
substantial_complex_attention(X)    :- member(substantial_complex_attention, X).
substantial_executive_function(X)     :- member(substantial_executive_function, X).
substantial_learning_memory(X)        :- member(substantial_learning_memory, X).
substantial_language(X)               :- member(substantial_language, X).
substantial_perceptual_motor(X)       :- member(substantial_perceptual_motor, X).
substantial_social_cognition(X)       :- member(substantial_social_cognition, X).

% Define a domain as having a substantial decline if any substantial variant is present.
substantial_decline(X) :-
    member(substantial_complex_attention, X).
substantial_decline(X) :-
    member(substantial_executive_function, X).
substantial_decline(X) :-
    member(substantial_learning_memory, X).
substantial_decline(X) :-
    member(substantial_language, X).
substantial_decline(X) :-
    member(substantial_perceptual_motor, X).
substantial_decline(X) :-
    member(substantial_social_cognition, X).

%--------------------------------------------------
% Functional Status and Exclusions
%--------------------------------------------------
functional_impairment(X)  :- member(functional_impairment, X).

no_delirium(X)           :- not member(delirium, X).
no_other_mental_disorder(X) :- not member(other_mental_disorder, X).

%--------------------------------------------------
% Counting Affected Cognitive Domains (Modest Deficits)
%--------------------------------------------------
cognitive_decline(X, Count) :-
    count_domains(X, 0, Count).

count_domains(X, Acc, Count) :-
    complex_attention(X), !,
    Acc1 is Acc + 1,
    count_domains_helper(X, Acc1, Count).
count_domains(X, Acc, Count) :-
    count_domains_helper(X, Acc, Count).

count_domains_helper(X, Acc, Count) :-
    executive_function(X), !,
    Acc1 is Acc + 1,
    count_domains_helper2(X, Acc1, Count).
count_domains_helper(X, Acc, Count) :-
    count_domains_helper2(X, Acc, Count).

count_domains_helper2(X, Acc, Count) :-
    learning_memory(X), !,
    Acc1 is Acc + 1,
    count_domains_helper3(X, Acc1, Count).
count_domains_helper2(X, Acc, Count) :-
    count_domains_helper3(X, Acc, Count).

count_domains_helper3(X, Acc, Count) :-
    language(X), !,
    Acc1 is Acc + 1,
    count_domains_helper4(X, Acc1, Count).
count_domains_helper3(X, Acc, Count) :-
    count_domains_helper4(X, Acc, Count).

count_domains_helper4(X, Acc, Count) :-
    perceptual_motor(X), !,
    Acc1 is Acc + 1,
    count_domains_helper5(X, Acc1, Count).
count_domains_helper4(X, Acc, Count) :-
    count_domains_helper5(X, Acc, Count).

count_domains_helper5(X, Acc, Count) :-
    social_cognition(X), !,
    Count is Acc + 1.
count_domains_helper5(_, Acc, Count) :-
    Count is Acc.

% Helper predicate: succeeds if Count is at least 2.
geq(3,3).
geq(4,3).
geq(5,3).
geq(6,3).

%--------------------------------------------------
% Diagnostic Rules for Neurocognitive Disorders
%--------------------------------------------------

% Minor Neurocognitive Disorder (MCI):
has_minor_ncd(X) :-
    cognitive_decline(X, Count),
    Count >= 1,
    not functional_impairment(X),
    no_delirium(X),
    no_other_mental_disorder(X).

% Major Neurocognitive Disorder (Dementia):
% Option 1: One domain with a substantial deficit is sufficient.
has_major_ncd(X) :-
    functional_impairment(X),
    no_delirium(X),
    no_other_mental_disorder(X),
    substantial_decline(X).

% Option 2: If no substantial deficit is present, then at least two modest deficits are required.
has_major_ncd(X) :-
    functional_impairment(X),
    no_delirium(X),
    no_other_mental_disorder(X),
    cognitive_decline(X, Count),
    geq(Count, 3).

has_dementia(X, major) :-
    has_major_ncd(X).

has_dementia(X, minor) :-
    has_minor_ncd(X).
?- has_dementia([functional_impairment, no_delirium, no_other_mental_disorder, complex_attention, executive_function, learning_memory, language], Y).
?- has_dementia([functional_impairment,  no_delirium, no_other_mental_disorder, complex_attention, executive_function, learning_memory, language], Y).
?- has_dementia([functional_impairment, learning_memory(decline)], Y).
?- has_dementia([functional_impairment],Y).
?- has_dementia([functional_impairment, no_delirium, no_other_mental_disorder, complex_attention, executive_function, learning_memory, language], Y).
?- has_dementia([functional_impairment, complex_attention, executive_function, learning_memory, language], Y).
?- has_dementia([functional_impairment, no_delirium, no_other_mental_disorder, complex_attention, executive_function, learning_memory, language], Y).
?- has_dementia([functional_impairment, not_no_delirium, no_other_mental_disorder, complex_attention, executive_function, learning_memory, language], Y).
?- has_dementia([functional_impairment, delirium, not_other_mental_disorders, complex_attention, executive_function, not_learning_memory, language, not_perceptual_motor, social_cognition, substantial_complex_attention, substantial_executive_function, substantial_learning_memory, substantial_language, substantial_perceptual_motor, substantial_social_cognition], Y).