% Главный предикат для удаления всех вхождений заданного элемента в списке
remove_all_occurrences([], _, []).  % Если список пуст, возвращаем пустой список
remove_all_occurrences([X | T], X, T1) :-  % Если элемент совпадает, пропускаем его
    remove_all_occurrences(T, X, T1).
remove_all_occurrences([H | T], X, [H | T1]) :-  % Если элемент не совпадает, добавляем его в новый список
    remove_all_occurrences(T, X, T1).

% Пример использования
test :-
    write("Enter a list: "), nl,
    read(List),                         % Считываем список
    write("Enter the element to remove: "), nl,
    read(Element),                      % Считываем элемент для удаления
    remove_all_occurrences(List, Element, Result),  % Удаляем все вхождения элемента
    write("Updated list: "), writeln(Result).  % Выводим обновленный список
