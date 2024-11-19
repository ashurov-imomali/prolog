% Главный предикат для удаления гласных из строки
remove_vowels(Input, Result) :-
    atom_chars(Input, Chars),      % Преобразуем строку в список символов
    remove_vowels_from_list(Chars, ResultChars),  % Удаляем гласные
    atom_chars(Result, ResultChars).  % Преобразуем результат обратно в строку

% Проверка, является ли символ гласной буквой
is_vowel(Char) :-
    member(Char, ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']).

% Рекурсивно удаляем гласные из списка символов
remove_vowels_from_list([], []).  % Если список пуст, возвращаем пустой список
remove_vowels_from_list([H | T], Result) :-
    ( is_vowel(H) ->             % Если символ - гласная, пропускаем его
      remove_vowels_from_list(T, Result)
    ; Result = [H | Rest],       % Если не гласная, оставляем её в списке
      remove_vowels_from_list(T, Rest)
    ).


test :-
    write("String: "), 
    read(X),
    remove_vowels(X, Res),
    write(Res).