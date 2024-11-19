% Главный предикат для замены всех цифр на нули в строке
replace_digits_with_zero(InputString, OutputString) :-
    atom_chars(InputString, Chars),               % Преобразуем строку в список символов
    replace_digits(Chars, ReplacedChars),         % Заменяем цифры на нули
    atom_chars(OutputString, ReplacedChars).      % Преобразуем измененный список обратно в строку

% Замена цифр на нули в списке символов
replace_digits([], []).                         % Пустой список — ничего не меняем
replace_digits([H | T], [H | ReplacedTail]) :-  % Если символ не цифра, оставляем его
    \+ char_type(H, digit),                     % Проверка на цифру
    replace_digits(T, ReplacedTail).
replace_digits([H | T], ['0' | ReplacedTail]) :-  % Если символ цифра, заменяем на '0'
    char_type(H, digit),
    replace_digits(T, ReplacedTail).

test :- 
    write("Enter a string: "), nl,
    read_line_to_string(user_input, X),          % Считываем строку
    atom_string(AtomX, X),                       % Преобразуем строку в атом
    replace_digits_with_zero(AtomX, Y),          % Заменяем цифры на нули
    atom_string(Y, Output),                      % Преобразуем результат обратно в строку
    write("Modified string: "), writeln(Output).  % Выводим результат