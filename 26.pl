% Главный предикат: находит первые N положительных элементов списка
first_n_positive_elements(List, N, Result) :-
    find_positive_elements(List, N, Result).

% Рекурсивно находим первые N положительных элементов
find_positive_elements(_, 0, []). % Базовый случай: если N = 0, возвращаем пустой список
find_positive_elements([], _, []). % Если список пуст, ничего не возвращаем
find_positive_elements([H | T], N, [H | Rest]) :-
    H > 0,                       % Если элемент положительный
    N1 is N - 1,                 % Уменьшаем счётчик N
    find_positive_elements(T, N1, Rest). % Рекурсивно обрабатываем остаток списка
find_positive_elements([_ | T], N, Rest) :-
    find_positive_elements(T, N, Rest). % Пропускаем отрицательный или нулевой элемент

% Тестовый предикат для работы через консоль
test :-
    write("List: "),
    read_line_to_string(user_input, Input), % Считываем строку
    split_string(Input, " ", "", StrList),  % Разбиваем строку на список строк
    maplist(safe_number_string, StrList, List), % Преобразуем строки в числа
    write("N: "), read(X),                 % Считываем значение N
    integer(X),                            % Убедимся, что X — это целое число
    first_n_positive_elements(List, X, Res), % Вызываем предикат для нахождения N элементов
    write("Result: "), write(Res), nl.     % Выводим результат

% Предикат для безопасного преобразования строки в число
safe_number_string(Str, Num) :-
    catch(number_string(Num, Str), _, fail). % Если преобразование не удалось, предикат завершится с неудачей
