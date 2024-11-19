% Главный предикат для запуска интерфейса
run :-
    write("Inter elems: "), nl,
    read_line_to_string(user_input, Input),          % Считываем строку с элементами
    split_string(Input, " ", "", ListStrings),       % Разделяем строку на список строк
    maplist(atom_string, List, ListStrings),         % Преобразуем строки в атомы
    move_last_to_front(List, Result),               % Перемещаем последний элемент в начало
    write("Result: "), writeln(Result).          % Выводим результат

% Предикат для перемещения последнего элемента в начало списка
move_last_to_front([], []) :- !.                    % Пустой список остается пустым
move_last_to_front([X], [X]) :- !.                 % Если один элемент, он остается на месте
move_last_to_front(List, [Last | Rest]) :-         % Основной случай
    append(Rest, [Last], List).                    % Разделяем список на начало и последний элемент
