% Главный предикат для уменьшения всех элементов списка на среднее арифметическое
subtract_average(List, Result) :-
    average(List, Avg),           % Вычисляем среднее арифметическое
    subtract_average_from_list(List, Avg, Result).  % Уменьшаем элементы на это значение

average(List, Avg) :-
    sum_list(List, Sum),          % Суммируем элементы списка
    length(List, Len),            % Получаем количество элементов
    Len > 0,                      % Проверяем, что список не пуст
    Avg is Sum / Len.             % Вычисляем среднее


subtract_average_from_list([], _, []).  % Базовый случай: пустой список
subtract_average_from_list([H | T], Avg, [NewH | Rest]) :-
    NewH is H - Avg,               % Вычитаем среднее арифметическое
    subtract_average_from_list(T, Avg, Rest).  % Рекурсивно обрабатываем остаток списка


test:-
    write("List: "),
    read(List),
    subtract_average(List, Res),
    write(Res).s