% Предикат для удаления первого вхождения заданного элемента в списке
remove_first_occurrence([], _, []).   % Если список пустой, возвращаем пустой список
remove_first_occurrence([X | T], X, T).  % Если нашли элемент X, возвращаем хвост списка (без X)
remove_first_occurrence([H | T], X, [H | T1]) :-  % Если элемент не X, продолжаем искать
    remove_first_occurrence(T, X, T1).

% Пример использования
test :-
    write("Enter a list: "), nl,
    read(List),                      % Считываем список
    write("Enter the element to remove: "), nl,
    read(Element),                   % Считываем элемент для удаления
    remove_first_occurrence(List, Element, Result),  % Удаляем первый элемент
    write("Updated list: "), writeln(Result).  % Выводим обновленный список
