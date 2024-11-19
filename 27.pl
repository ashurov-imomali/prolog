% Главный предикат для извлечения строк, содержащих числовые данные
extract_lines_with_numbers(File) :-
    open(File, read, Stream),       % Открываем файл для чтения
    read_lines_with_numbers(Stream), % Читаем и обрабатываем строки
    close(Stream).                  % Закрываем файл

% Рекурсивный предикат для чтения строк из файла
read_lines_with_numbers(Stream) :-
    read_line_to_string(Stream, Line), % Читаем строку
    (   Line \= end_of_file             % Пока не достигнут конец файла
    ->  (   contains_number(Line)      % Если строка содержит число
        ->  write(Line), nl           % Выводим строку
        ;   true                       % Иначе ничего не делаем
        ),
        read_lines_with_numbers(Stream)  % Рекурсивно обрабатываем следующую строку
    ;   true).                          % Когда конец файла, завершаем выполнение

% Предикат для проверки, содержит ли строка числовые символы
contains_number(Line) :-
    string_codes(Line, Codes),    % Преобразуем строку в список кодов символов
    member(Code, Codes),          % Ищем любой символ
    Code >= 48, Code =< 57.       % Проверяем, что символ — это цифра (код от 48 до 57)


test :-
    extract_lines_with_numbers('example.txt').