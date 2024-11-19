% Главный предикат для удаления строк без заглавных букв
remove_lines_without_uppercase(FileName) :-
    open(FileName, read, Stream),              % Открываем файл для чтения
    open('output.txt', write, OutStream),      % Открываем новый файл для записи
    remove_lines_without_uppercase_in_file(Stream, OutStream),  % Обрабатываем строки
    close(Stream),                             % Закрываем исходный файл
    close(OutStream),                         % Закрываем файл для записи
    write('Process completed. Check "output.txt" for results.').

% Рекурсивный предикат для обработки строк файла
remove_lines_without_uppercase_in_file(Stream, OutStream) :-
    read_line_to_string(Stream, Line),        % Читаем строку
    (Line == end_of_file ->                   % Если достигнут конец файла
        true                                    % Заканчиваем
    ;   (contains_uppercase(Line) ->           % Если строка содержит заглавную букву
            writeln(OutStream, Line)           % Записываем её в новый файл
        ;   true),                             % Иначе пропускаем
        remove_lines_without_uppercase_in_file(Stream, OutStream)).  % Рекурсивно обрабатываем остальные строки

% Предикат для проверки, есть ли заглавные буквы в строке
contains_uppercase(Line) :-
    atom_chars(Line, Chars),                  % Преобразуем строку в список символов
    contains_uppercase_in_chars(Chars).       % Проверяем, есть ли заглавные буквы среди символов

% Рекурсивный предикат для проверки символов на заглавные буквы
contains_uppercase_in_chars([]) :- false.    % Если список пустой, то заглавных букв нет
contains_uppercase_in_chars([H | _]) :-
    char_type(H, upper).                     % Если встретилась заглавная буква, возвращаем true
contains_uppercase_in_chars([_ | T]) :-
    contains_uppercase_in_chars(T).          % Продолжаем проверку для остальных символов

% Пример использования
test :-                            % Считываем имя файла
    remove_lines_without_uppercase('example.txt').   % Удаляем строки без заглавных букв
