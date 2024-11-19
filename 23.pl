% Предикат для сортировки строк файла по их длине
sort_lines_by_length(Filename) :-
    open(Filename, read, Stream),        % Открываем файл для чтения
    read_lines(Stream, Lines),           % Считываем все строки
    close(Stream),                       % Закрываем файл
    sort_by_length(Lines, SortedLines),  % Сортируем строки по длине
    print_sorted_lines(SortedLines).     % Выводим отсортированные строки

% Считывание строк из потока
read_lines(Stream, Lines) :-
    read_line_to_string(Stream, Line),
    ( Line \= end_of_file ->
        read_lines(Stream, Rest),
        Lines = [Line | Rest]
    ; Lines = []
    ).

% Сортировка строк по их длине
sort_by_length(Lines, SortedLines) :-
    map_list_to_pairs(string_length, Lines, Lengths),
    keysort(Lengths, SortedLengths),        % Сортируем по длине
    pairs_values(SortedLengths, SortedLines). % Получаем отсортированные строки

% Вывод отсортированных строк
print_sorted_lines([]).
print_sorted_lines([Line | Rest]) :-
    writeln(Line),
    print_sorted_lines(Rest).


test :-
    sort_lines_by_length('example.txt').