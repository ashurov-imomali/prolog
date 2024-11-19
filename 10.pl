% Главный предикат для сортировки строк файла по длине
sort_lines_by_length(FileName) :-
    open(FileName, read, Stream),               % Открываем файл для чтения
    read_lines(Stream, Lines),                  % Читаем все строки файла
    sort_lines_by_length(Lines, SortedLines),   % Сортируем строки по длине
    print_lines(SortedLines),                   % Выводим отсортированные строки
    close(Stream).                              % Закрываем файл

% Чтение всех строк из файла
read_lines(Stream, Lines) :-
    read_line_to_string(Stream, Line),         % Читаем строку
    (Line == end_of_file ->                    % Если достигнут конец файла
        Lines = []                             % Возвращаем пустой список
    ;   read_lines(Stream, RestLines),         % Иначе читаем оставшиеся строки
        Lines = [Line | RestLines]             % Добавляем строку в список
    ).

% Сортировка строк по длине
sort_lines_by_length(Lines, SortedLines) :-
    map_list_to_pairs(string_length, Lines, Pairs), % Создаем пары (длина строки, строка)
    keysort(Pairs, SortedPairs),                     % Сортируем пары по длине
    pairs_values(SortedPairs, SortedLines).          % Извлекаем отсортированные строки

% Вывод отсортированных строк
print_lines([]).
print_lines([Line | Rest]) :-
    writeln(Line),      % Печатаем строку
    print_lines(Rest).  % Рекурсивно печатаем оставшиеся строки


test :-
    sort_lines_by_length('example.txt').
