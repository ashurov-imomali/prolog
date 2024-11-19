% Главный предикат: находит слова с числовыми символами
find_words_with_digits(Sentence, WordsWithDigits) :-
    split_string(Sentence, " ", "", Words),  % Разделяем строку на слова
    include(contains_digit, Words, WordsWithDigits). % Оставляем только слова с цифрами

% Проверяет, содержит ли строка числовой символ
contains_digit(Word) :-
    string_chars(Word, Chars),     % Преобразуем строку в список символов
    member(Char, Chars),           % Перебираем символы
    char_type(Char, digit).        % Проверяем, является ли символ цифрой

test :-
    write("String: "),
    read_line_to_string(user_input, InputString),
    find_words_with_digits(InputString, Res),
    write(Res).
