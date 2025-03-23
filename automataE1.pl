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

% Pruebas 
bakka:-
    write('bakka'),nl,
    write('Se espera: true'),nl,
    transaction([b,a,k,k,a]).

bidriyah:-
    write('bidriyah'),nl,
    write('Se espera: true'),nl,
    transaction([b,i,d,r,i,y,a,h]).

bakkabakka:-
    write('bakkabakka'),nl,
    write('Se espera: true'),nl,
    transaction([b,a,k,k,a,b,a,k,k,a]).
    
barakabaz:-
    write('barakabaz'),nl,
    write('Se espera: true'),nl,
    transaction([b,a,r,a,k,a,b,a,z]).
    
bazbarakabidriyah:-
    write('bazbarakabidriyah'),nl,
    write('Se espera: true'),nl,
    transaction([b,a,z,b,a,r,a,k,a,b,i,d,r,i,y,a,h]).

abakka:-
    write('abakka'),nl,
    write('Se espera: false'),nl,
    transaction([a,b,a,k,k,a]).

baikka:-
    write('baikka'),nl,
    write('Se espera: false'),nl,
    transaction([b,a,i,k,k,a]).

bakkala:-
    write('bakkala'),nl,
    write('Se espera: false'),nl,
    transaction([b,a,k,k,a,l,a]).
