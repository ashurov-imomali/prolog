% Главный предикат для удаления двух последних элементов
remove_last_two([X, Y], []).   % Если в списке два элемента, возвращаем пустой список
remove_last_two([H|T], [H|R]) :-  % Рекурсивно сохраняем элементы в новый список
    remove_last_two(T, R).
% Пример использования
test :-
    write("Enter a list: "), nl,
    read(List),     
    %List = [1, 2, 3, 4, 5],     % Исходный список
    remove_last_two(List, NewList),  % Удаляем два последних элемента
    write("Modified list: "), writeln(NewList).  % Выводим результат
