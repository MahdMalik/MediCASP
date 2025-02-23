-member(Element, []).
member(Element, [Element | T]).
member(Element, [H | T]) :- member(Element, T).

barrelChest(X, 1) :- member(barrel_chest, X).
barrel_chest(X, 0).

shallow_breathing(X, 1) :- member(shallow_breathing, X).
shallow_breathing(X, 0).

wheezing(X, 1) :- member(wheezing, X).
wheezing(X, 0).

low_pulse_ox(X, 1) :- member(low_pulse_ox, X).
low_pulse_ox(X, 0).

wet_lung_sounds(X, 1) :- member(wet_lung_sounds, X).
wet_lung_sounds(X, 0).

diminished_breath_sounds(X, 1) :- member(diminished_breath_sounds, X).
diminished_breath_sounds(X, 0).

has_copd(X, Y) :-
    barrelChest(X, C1),
    shallow_breathing(X, C2),
    wheezing(X, C3),
    low_pulse_ox(X, C4),
    wet_lung_sounds(X, C5),
    diminished_breath_sounds(X, C6),
    Y is C1 + C2 + C3 + C4 + C5 + C6,
    Y > 1.
?- has_copd([barrel_chest, not_shallow_breathing, wheezing, low_pulse_ox, wet_lung_sounds, not_diminished_breath_sounds], Y).
?- has_copd([barrel_chest, not_shallow_breathing, wheezing, low_pulse_ox, wet_lung_sounds, not_diminished_breath_sounds], Y).
?- has_copd([barrel_chest, shallow_breathing, wheezing, low_pulse_ox, wet_lung_sounds, diminished_breath_sounds], Y).
?- has_copd([barrel_chest, shallow_breathing, wheezing, low_pulse_ox, wet_lung_sounds, diminished_breath_sounds], Y).
?- has_copd([barrel_chest, shallow_breathing, wheezing, low_pulse_ox, wet_lung_sounds, diminished_breath_sounds], Y).
?- has_copd([barrel_chest, shallow_breathing, wheezing, low_pulse_ox, wet_lung_sounds, diminished_breath_sounds], Y).
?- has_copd([barrel_chest, shallow_breathing, wheezing, low_pulse_ox, wet_lung_sounds, diminished_breath_sounds], Y).