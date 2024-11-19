% Главный предикат для выбора слов, у которых первый и последний символы одинаковые
select_words_with_equal_first_last_char(String, Result) :-
    split_string(String, " ", "", Words),      % Разделяем строку на список слов
    find_words_with_equal_first_last(Words, Result).  % Находим подходящие слова

% Вспомогательный предикат для поиска слов, у которых первый и последний символы одинаковые
find_words_with_equal_first_last([], []).      % Если список слов пуст, результат пустой
find_words_with_equal_first_last([Word | T], [Word | Result]) :-
    atom_chars(Word, [First | Rest]),           % Преобразуем слово в список символов
    last(Rest, Last),                           % Получаем последний символ
    First == Last,                              % Проверяем, равны ли первый и последний символ
    find_words_with_equal_first_last(T, Result). % Рекурсивно продолжаем для остальных слов
find_words_with_equal_first_last([_ | T], Result) :-
    find_words_with_equal_first_last(T, Result).  % Если не равны, пропускаем слово

% Пример использования
test :-
    write("Enter a sequence of words: "), nl,
    read_line_to_string(user_input, InputString),  % Считываем строку
    select_words_with_equal_first_last_char(InputString, Result),  % Находим подходящие слова
    write("Words with equal first and last characters: "), writeln(Result).
