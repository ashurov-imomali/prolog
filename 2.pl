has_consecutive_duplicates(String) :-
    string_chars(String, Chars),  % Преобразуем строку в список символов
    check_duplicates(Chars).     % Проверяем список символов

check_duplicates([X, X | _]) :- !.  % Если два подряд одинаковых символа, вернуть true
check_duplicates([_ | Rest]) :-     % Иначе продолжаем проверять оставшуюся часть списка
    check_duplicates(Rest).
check_duplicates([]) :- fail.       % Если список закончился, вернуть false


test :-
    write("string: "), nl,
    read(X),
    (has_consecutive_duplicates(X) ->
        writeln("Yes, the string contains consecutive duplicate characters.");
        writeln("No, the string does not contain consecutive duplicate characters.")
    ).

% Запуск:
?- test.
