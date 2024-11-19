:- use_module(library(readutil)).

average_line_length(File, Average) :-
    open(File, read, Stream),       
    read_lines(Stream, Lines),             
    close(Stream),                          
    calculate_average(Lines, Average).      
read_lines(Stream, Lines) :-
    read_line_to_string(Stream, Line),
    (   Line == end_of_file
    ->  Lines = []
    ;   Lines = [Line | Rest],
        read_lines(Stream, Rest)
    ).

calculate_average(Lines, Average) :-
    maplist(string_length, Lines, Lengths), 
    sum_list(Lengths, TotalLength),        
    length(Lengths, Count),                
    Count > 0,                            
    Average is TotalLength / Count.        


test :-
    average_line_length('example.txt', Average),
    writeln(Average).

