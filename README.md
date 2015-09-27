# Nested-Stack-Decoder-Fractal
MIPS program that reverses strings set between brackets and creates a fractal.\t

This program does four things:
1. If given an input file that contains characters nested in parenthasis, the program will read the file and
create an output file with all the words in parenthasis reversed.
2. The second functionality of the program is the same as the first only it will also reverse words in nested
parenthasis and other bracket types such as '[' & ']' or '{' & '}'
3. The program contains a countN function that will accept two numbers. The first is any arbitrary number N and
the second is a digit 0-9. The function uses recursion to count the number of times the digit occurrs in N and
double counts the digit if it occurs consecutively.
4. The final function creates a boxfractal in an output file. The function takes a character and any number 0-5
and creates a fractal of relative size in the output file using the input character.
