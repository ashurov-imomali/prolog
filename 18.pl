% Главный предикат для удаления повторяющихся элементов из списка
remove_duplicates([], []).  % Пустой список остается пустым
remove_duplicates([Head | Tail], Result) :-
    member(Head, Tail),            % Если элемент уже встречается в хвосте, пропускаем его
    remove_duplicates(Tail, Result).  % Рекурсивно обрабатываем хвост
remove_duplicates([Head | Tail], [Head | Result]) :-
    \+ member(Head, Tail),         % Если элемента нет в хвосте, добавляем его в результат
    remove_duplicates(Tail, Result).

% Пример использования
test :-
    write("Enter a list of elements: "), nl,
    read(List),                       % Считываем список
    remove_duplicates(List, Result),  % Убираем повторяющиеся элементы
    write("List without duplicates: "), writeln(Result).  % Выводим результат
