%require "3.2"
%language "c++"
%{
#include "expr.tab.h"
%}

%%
<<EOF>>   return STOP;
"{"   return OPENING_brace;
"}"   return CLOSING_brace;
"["  return LEFT_bracket;
"]"  return RIGHT_bracket;
":"  return SEMICOLON;
","  COMMA;
"\"[^\"]\""  return STRING;

[0-9]+ {yylval=atoi(yytext); return DIGIT;}
%%