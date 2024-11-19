% Главный предикат для замены символа после первого '*'
replace_star_with_plus(String, Result) :-
    atom_chars(String, Chars),                % Преобразуем строку в список символов
    replace_star_with_plus_in_list(Chars, ResultChars),  % Рекурсивно обрабатываем список
    atom_chars(Result, ResultChars).          % Преобразуем обратно в строку

% Рекурсивный предикат для обработки списка символов
replace_star_with_plus_in_list([], []).      % Если список пустой, возвращаем пустой список
replace_star_with_plus_in_list([* | [X | T]], [* | [+ | T]]) :-  % Если нашли *, заменяем следующий символ на '+'
    replace_star_with_plus_in_list(T, _).    % Дальше не обрабатываем, так как символ после * уже заменен
replace_star_with_plus_in_list([H | T], [H | ResultTail]) :-  % Если символ не *, просто копируем его в результат
    replace_star_with_plus_in_list(T, ResultTail).
  
% Пример использования
test :-
    write("Enter a string: "), nl,
    read_line_to_string(user_input, InputString),  % Считываем строку
    replace_star_with_plus(InputString, Result),   % Заменяем символ после *
    write("Updated string: "), writeln(Result).    % Выводим результат
