# CIS343LanguageCreation

To run the Lexer by itself call

flex my_lang.lex

clang lex.yy.c -lfl

then run the a.out file   ./a.out

To run the bison file 

bison -d zjs.y

flex zjs.flex

gcc -o zjs zjs.c lex.yy.c zjs.tab.c -lSDL2 -lm

then run the zjs file ./zjs
