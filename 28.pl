% Главный предикат: удаляем элементы начиная с X
remove_from_element(X, List, Result) :-
    remove_from_element_helper(List, X, Result).

% Если в списке ничего не осталось, возвращаем пустой список
remove_from_element_helper([], _, []).

% Если нашли элемент X, возвращаем пустой список
remove_from_element_helper([X | _], X, []).

% Если элемент не равен X, продолжаем искать и добавляем текущий элемент в результат
remove_from_element_helper([H | T], X, [H | Rest]) :-
    remove_from_element_helper(T, X, Rest).

test :-
    write("LIST: "),
    read(List),
    write("Elems: "),
    read(X),
    remove_from_element(X,List, Res),
    write(Res).