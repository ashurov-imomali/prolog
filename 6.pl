% Предикат для удаления всех элементов до заданного X, включая сам X
remove_before_element([], _, []).  % Если список пуст, возвращаем пустой список
remove_before_element([X | T], X, T).  % Если нашли X, начинаем новый список с хвоста (без X)
remove_before_element([_ | T], X, Result) :-  % Если X не найден в текущем элементе, продолжаем искать
    remove_before_element(T, X, Result).


% Предикат для ввода строки с консоли
test :- 
    write("Enter the list: "), nl,
    read(List),                      % Считываем список
    write("Enter the element to start from: "), nl,
    read(X),                          % Считываем элемент X
    remove_before_element(List, X, Result),   % Выполняем удаление
    write("Resulting list: "), writeln(Result). % Выводим результат
