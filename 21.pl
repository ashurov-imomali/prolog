% Главный предикат для подсчета количества слов в предложении
count_words_in_sentence(Sentence, Count) :-
    split_string(Sentence, " ", "", Words),  % Разделяем строку на слова по пробелам
    sort(Words, NewWords),
    length(NewWords, Count).                     % Считаем количество элементов в списке

% Пример использования
test :-
    write("Enter a sentence: "), nl,
    read_line_to_string(user_input, Sentence),  % Считываем строку
    count_words_in_sentence(Sentence, Count),    % Подсчитываем количество слов
    Res is Count - 1,
    write("Number of words: "), write(Res).  % Выводим результат
