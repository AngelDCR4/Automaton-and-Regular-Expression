% Importacion regex
:- use_module(library(regex)).

% Definición de automata
move('A','B',b).
move('B','C',a).
move('B','H',i).
move('C','I',r).
move('C','D',k).
move('C','Z',z).
move('D','E',l).
move('D','G',k).
move('D','Z',h).
move('E','F',a).
move('F','G',w).
move('G','Z',a).
move('H','C',d).
move('I','J',i).
move('I','D',a).
move('J','I',y).
move('Z','B',b).


% Caso base o estado final
accepting_state('Z').

transaction(InputList) :-
    transactionHelper(InputList, 'A').

    % Lista vacia - Final
    transactionHelper([], CurrentState) :-
        accepting_state(CurrentState).

    % Transacciones - Recursivo
    transactionHelper([Symbol | Rest], CurrentState) :-
        move(CurrentState, NextState, Symbol),
        transactionHelper(Rest, NextState).

% Automata V1 y V2
valid_word(Word) :-
    regex('^b(a(k(ka$|lawa$)|z$|raka$)|idriyah$)', [], Word, _).

% Automata V3
valid_word2(Word) :-
    regex('^(b(a(k(ka|lawa)|z|raka)|idriyah))+$', [], Word, _).
