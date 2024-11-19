% Главный предикат для продублирования каждой второй строки в текстовом файле
duplicate_second_lines(FileName) :-
    open(FileName, read, Stream),             % Открываем файл для чтения
    open('output.txt', write, OutStream),     % Открываем новый файл для записи
    duplicate_second_lines_in_file(Stream, OutStream, 1),  % Начинаем с первой строки
    close(Stream),                            % Закрываем исходный файл
    close(OutStream),                        % Закрываем файл для записи
    write('Process completed. Check "output.txt" for results.').

% Рекурсивный предикат для обработки строк файла
duplicate_second_lines_in_file(Stream, OutStream, LineNumber) :-
    read_line_to_string(Stream, Line),       % Читаем строку из файла
    (Line == end_of_file ->                  % Если достигнут конец файла
        true                                  % Завершаем
    ;   (LineNumber mod 2 =:= 0 ->            % Если номер строки четный
            writeln(OutStream, Line),         % Записываем её дважды
            writeln(OutStream, Line)
        ;   writeln(OutStream, Line)),        % Если нечетный номер строки, просто записываем её
        NextLineNumber is LineNumber + 1,     % Переходим к следующей строке
        duplicate_second_lines_in_file(Stream, OutStream, NextLineNumber)).

% Пример использования
test :-
    duplicate_second_lines('example.txt').        % Продублируем каждую вторую строку
