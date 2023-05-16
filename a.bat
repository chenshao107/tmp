flex token.l
bison -d expr.y
gcc  lex.yy.cc  expr.tab.c  -o  expr
test.txt > expr