
count_short_lines(FileName, MaxLength, Count) :-
    open(FileName, read, Stream),                % Открываем файл для чтения
    count_lines(Stream, MaxLength, 0, Count),    % Подсчитываем строки с длиной меньше MaxLength
    close(Stream).                               % Закрываем файл

count_lines(Stream, MaxLength, Count, Count) :-  % Если достигнут конец файла, выводим счетчик
    at_end_of_stream(Stream).                   % Проверка на конец файла
count_lines(Stream, MaxLength, CurrentCount, Count) :-
    \+ at_end_of_stream(Stream),                % Если не конец файла
    read_line_to_string(Stream, Line),          % Читаем строку
    string_length(Line, Length),                 % Получаем длину строки
    (Length < MaxLength ->                      % Если длина меньше MaxLength
        NewCount is CurrentCount + 1,           % Увеличиваем счетчик
        count_lines(Stream, MaxLength, NewCount, Count)  % Рекурсивно продолжаем
    ;
        count_lines(Stream, MaxLength, CurrentCount, Count)  % Иначе продолжаем без изменения счетчика
    ).

test :- 
    write("Enter the maximum length: "), nl,
    read(MaxLength),                     % Считываем максимальную длину
    count_short_lines('example.txt', MaxLength, Count),   % Подсчитываем количество строк
    write("Number of short lines: "), writeln(Count). % Выводим результат
