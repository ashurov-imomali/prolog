% Главный предикат для извлечения слов, где первый и последний символ одинаковы
select_words_with_same_first_last_char(Sentence, SelectedWords) :-
    split_string(Sentence, " ", "", Words),    % Разбиваем строку на слова
    filter_same_first_last(Words, SelectedWords). % Фильтруем слова, где первый и последний символ одинаковы

% Фильтруем слова, где первый и последний символ одинаковы
filter_same_first_last([], []). % Базовый случай: если список слов пуст, то возвращаем пустой список
filter_same_first_last([Word | Rest], [Word | SelectedRest]) :-
    word_has_same_first_last_char(Word), % Проверяем условие для первого слова
    filter_same_first_last(Rest, SelectedRest). % Рекурсивно продолжаем для остальных
filter_same_first_last([_ | Rest], SelectedRest) :-
    filter_same_first_last(Rest, SelectedRest). % Пропускаем слово, если оно не соответствует условию

% Предикат для проверки, что первый и последний символ слова одинаковы
word_has_same_first_last_char(Word) :-
    string_length(Word, Len),
    Len > 0, % Проверяем, что слово не пустое
    sub_string(Word, 0, 1, _, FirstChar), % Первый символ
    sub_string(Word, Len - 1, 1, 0, LastChar), % Последний символ
    FirstChar = LastChar. % Проверяем, что они одинаковы

test:-
    write("Enter a sequence of words: "), nl,
    read_line_to_string(user_input, InputString),  % Считываем строку
    select_words_with_equal_first_last_char(InputString, Result),  % Находим подходящие слова
    write("Words with equal first and last characters: "), writeln(Result).
