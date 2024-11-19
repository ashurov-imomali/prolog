% Главный предикат для подсчета количества цифровых символов в файле
count_digits_in_file(FileName) :-
    open(FileName, read, Stream),            % Открываем файл для чтения
    count_digits_in_lines(Stream, TotalCount), % Подсчитываем цифры в строках
    close(Stream),                            % Закрываем файл
    write("Total number of digits: "), writeln(TotalCount).

% Рекурсивный предикат для подсчета цифр в строках
count_digits_in_lines(Stream, TotalCount) :-
    read_line_to_string(Stream, Line),       % Читаем строку
    (Line == end_of_file ->                  % Если конец файла
        TotalCount = 0                       % Возвращаем 0
    ;   count_digits_in_line(Line, LineCount), % Подсчитываем цифры в строке
        count_digits_in_lines(Stream, RestCount), % Рекурсивно подсчитываем для оставшихся строк
        TotalCount is LineCount + RestCount).  % Суммируем общее количество

% Подсчет цифр в одной строке
count_digits_in_line(Line, Count) :-
    atom_chars(Line, Chars),                  % Преобразуем строку в список символов
    count_digits_in_chars(Chars, Count).       % Подсчитываем цифры в списке символов

% Подсчет цифр в списке символов
count_digits_in_chars([], 0).                  % Если список пустой, цифр нет
count_digits_in_chars([H | T], Count) :-
    (char_type(H, digit) ->                    % Если символ — цифра
        count_digits_in_chars(T, TailCount),   % Рекурсивно продолжаем для остальных символов
        Count is TailCount + 1                 % Увеличиваем счетчик
    ;   count_digits_in_chars(T, Count)).       % Если не цифра, просто продолжаем

% Пример использования
test :-
    count_digits_in_file('example.txt').           % Подсчитываем цифры
