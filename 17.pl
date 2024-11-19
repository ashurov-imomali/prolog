% Главный предикат для добавления запятой после каждого слова, кроме последнего
add_commas_between_words(String, Result) :-
    split_string(String, " ", "", Words),  % Разбиваем строку на слова
    add_commas(Words, ResultWords),         % Добавляем запятую после каждого слова, кроме последнего
    atomics_to_string(ResultWords, "", Result).  % Собираем результат в строку

% Рекурсивный предикат для добавления запятых
add_commas([Word], [Word]).  % Если остался один элемент, не добавляем запятую
add_commas([Word | Rest], [Word, ', ' | ResultRest]) :-  % Для всех слов, кроме последнего, добавляем запятую
    add_commas(Rest, ResultRest).

% Пример использования
test :-
    write("Enter a sequence of words: "), nl,
    read_line_to_string(user_input, InputString),  % Считываем строку
    add_commas_between_words(InputString, Result),  % Обрабатываем строку
    write("Resulting string: "), writeln(Result).    % Выводим результат
