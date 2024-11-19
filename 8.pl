% Предикат для проверки наличия цифр в строке и вывода их
find_digits_in_string(String, Digits) :-
    string_chars(String, Chars),         % Преобразуем строку в список символов
    find_digits(Chars, Digits).          % Находим все цифры

% Вспомогательный предикат для нахождения всех цифр в списке символов
find_digits([], []).                    % Если список пустой, цифр нет
find_digits([H | T], [H | Digits]) :-   % Если текущий символ цифра, добавляем его в результат
    char_type(H, digit),                % Проверяем, является ли символ цифрой
    find_digits(T, Digits).             % Рекурсивно продолжаем для хвоста списка
find_digits([_ | T], Digits) :-         % Если символ не цифра, пропускаем его
    find_digits(T, Digits).

% Пример использования
test :- 
    write("Enter a string: "), nl,
    read_line_to_string(user_input, InputString),  % Считываем строку с консоли
    find_digits_in_string(InputString, Digits),    % Находим цифры
    (Digits == [] -> 
        write("No digits found."), nl;
        write("Digits in the string: "), writeln(Digits)
    ).
