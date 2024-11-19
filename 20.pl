% Главный предикат для создания палиндрома
create_palindrome(List, Palindrome) :-
    reverse(List, ReversedList),          % Разворачиваем список
    append(List, ReversedList, Palindrome).  % Соединяем оригинальный список с его развёрнутой копией

% Пример использования
test :-
    write("Enter a list: "), nl,
    read(List),                             % Считываем список
    create_palindrome(List, Palindrome),    % Создаём палиндром
    write("Palindrome: "), writeln(Palindrome).  % Выводим палиндром
