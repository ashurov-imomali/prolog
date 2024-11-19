% Главный предикат для циклического сдвига влево
shift_left(List, N, Result) :-
    length(List, Len),
    ShiftedN is N mod Len,  % В случае, если N больше длины списка, получаем остаток
    split_at(ShiftedN, List, Front, Back),  % Разбиваем список на две части
    append(Back, Front, Result).            % Соединяем их в обратном порядке

% Главный предикат для циклического сдвига вправо
shift_right(List, N, Result) :-
    length(List, Len),
    ShiftedN is N mod Len,  % В случае, если N больше длины списка, получаем остаток
    split_at(Len - ShiftedN, List, Front, Back),  % Разбиваем список с конца
    append(Back, Front, Result).            % Соединяем их в обратном порядке

% Вспомогательный предикат для разбиения списка на две части
split_at(0, List, [], List).  % Если N == 0, первая часть пустая, вторая — весь список
split_at(_, [], [], []).      % Если список пуст, возвращаем пустые части
split_at(N, [H | T], [H | Front], Back) :-
    N > 0,
    N1 is N - 1,
    split_at(N1, T, Front, Back).

% Пример использования
test :-
    write("Enter a list: "), nl,
    read(List),                         % Считываем список
    write("Enter the number of positions to shift: "), nl,
    read(N),                             % Считываем количество позиций для сдвига
    write("Enter direction (left or right): "), nl,
    read(Direction),                     % Считываем направление сдвига
    (Direction == left -> shift_left(List, N, Result) ; shift_right(List, N, Result)),  % В зависимости от направления выполняем сдвиг
    write("Resulting list: "), writeln(Result).  % Выводим результат
