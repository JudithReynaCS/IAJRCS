% Hechos
hombre(antonio).
hombre(juan).
hombre(luis).
hombre(rodrigo).
hombre(ricardo).
mujer(isabel).
mujer(ana).
mujer(marta).
mujer(carmen).
mujer(laura).
mujer(alicia).

% Matrimonios
matrimonio(antonio, ana).
matrimonio(juan, carmen).
matrimonio(luis, isabel).
matrimonio(rodrigo, laura).

% Hijos
hijo(juan, antonio).
hijo(juan, ana).
hijo(rodrigo, antonio).
hijo(rodrigo, ana).
hijo(marta, antonio).
hijo(marta, ana).
hijo(carmen, luis).
hijo(carmen, isabel).
hijo(ricardo, juan).
hijo(ricardo, carmen).
hijo(alicia, rodrigo).
hijo(alicia, isabel).

% Reglas
matrimonio_reflexivo(X, Y) :- matrimonio(Y, X).
%reglas
nieto(X, Z) :- padre(X, Y), padre(Y, Z).
abuelo(X, Z) :- nieto(Z, Y), hijo(X, Y), hombre(X).
abuela(X, Z) :- nieto(Z, Y), hijo(X, Y), mujer(X).
hermano(X, Y) :- hijo(X, Z), hijo(Y, Z), X \= Y, hombre(X).
hermana(X, Y) :- hija(X, Z), hija(Y, Z), X \= Y, mujer(X).
tio(X, Y) :- hijo(Y, Z), hermano(X, Z).
tia(X, Y) :- hijo(Y, Z), hermana(X, Z).
primo(X, Y) :- hijo(X, Z), hijo(Y, W), hermano(Z, W), X \= Y, hombre(X).
prima(X, Y) :- hija(X, Z), hijo(Y, W), hermano(Z, W), X \= Y, mujer(X).
suegro(X, Y) :- matrimonio(Y, Z), hijo(X, Z), hombre(X).
suegra(X, Y) :- matrimonio(Y, Z), hijo(X, Z), mujer(X).
