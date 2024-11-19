:- use_module(library(readutil)).

% Главный предикат для удаления строк с длиной больше заданной
remove_long_lines(MaxLength) :-
    open('example.txt', read, InStream),           % Открываем входной файл example.txt
    read_lines(InStream, Lines),                  % Читаем строки
    close(InStream),                              % Закрываем файл
    filter_lines(Lines, MaxLength, Filtered),     % Фильтруем строки по длине
    write("Filtered lines:"), nl,                 % Выводим заголовок результата
    print_lines(Filtered).                        % Печатаем отфильтрованные строки

% Чтение всех строк из файла
read_lines(Stream, Lines) :-
    read_line_to_string(Stream, Line),
    (   Line == end_of_file
    ->  Lines = []
    ;   Lines = [Line | Rest],
        read_lines(Stream, Rest)
    ).

% Фильтрация строк по длине
filter_lines([], _, []).
filter_lines([Line | Rest], MaxLength, [Line | FilteredRest]) :-
    string_length(Line, Length),
    Length =< MaxLength,                        % Оставляем строку, если длина не превышает MaxLength
    filter_lines(Rest, MaxLength, FilteredRest).
filter_lines([_ | Rest], MaxLength, FilteredRest) :-
    filter_lines(Rest, MaxLength, FilteredRest).

% Печать строк на экран
print_lines([]).
print_lines([Line | Rest]) :-
    writeln(Line),                              % Печатаем строку
    print_lines(Rest).


test:-
    write("num: "), nl,
    read(X),
    remove_long_lines(X), nl.


