-member(Element, []).
member(Element, [Element | T]).
member(Element, [H | T]) :- member(Element, T).
hasFever(X, 1) :- member(fever, X).
hasFever(X, 0).
hasMucusCough(X, 1) :- member(coughing_sputum, X).
hasMucusCough(X, 0).
hasShallowBreath(X, 1) :- member(shallow_breath, X).
hasShallowBreath(X, 0).
hasTachypnea(X, 1) :- member(rapid_breathing, X).
hasTachypnea(X, 0).
hasWetLungSounds(X, 1) :- member(wet_lung_sounds, X).
hasWetLungSounds(X, 0).
hasChills(X, 1) :- member(chills, X).
hasChills(X, 0).

has_pneumonia(X, Y):-
    hasFever(X, True1),
    hasMucusCough(X, True2),
    hasShallowBreath(X, True3),
    hasTachypnea(X, True4),
    hasWetLungSounds(X, True5),
    hasChills(X, True6),
    Y is True1 + True2 + True3 + True4 + True5 + True6,
    Y > 1.
?- has_pneumonia([fever, coughing_sputum, shallow_breath, rapid_breathing, wet_lung_sounds, chills], Y).