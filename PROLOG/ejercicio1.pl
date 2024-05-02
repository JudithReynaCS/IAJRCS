% Hechos
ama(juan, ana).
ama(ana, miguel).
ama(luis, isabel).
ama(miguel, ana).
ama(laura, juan).
ama(isabel, luis).

% Preguntas
% ¿A quién ama “Juan”?
quien_ama_a_juan(X) :- ama(juan, X).

% ¿Quién ama a “Ana”?
quien_ama_a_ana(X) :- ama(X, ana).

% ¿Quién ama a alguien?
quien_ama_a_alguien(X) :- ama(X, _).

% ¿Quién es amado por alguien?
es_amado_por_alguien(X) :- ama(_, X).

% ¿Quiénes se aman mutuamente?
se_aman_mutuamente(X, Y) :- ama(X, Y), ama(Y, X), X \= Y.

% ¿Quién ama sin ser correspondido?
ama_sin_ser_correspondido(X) :- ama(X, Y), not(ama(Y, X)).

% Regla para describir a los "amantes"
amantes(X, Y) :- ama(X, Y), ama(Y, X), X \= Y.
