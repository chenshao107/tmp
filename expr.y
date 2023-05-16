%require "3.2"
%language "c++"{
#include <stdio.h>
#include <vector>
#include "my.cpp"
using namespace std;
using JSON=std::vector<Jitem*>;
using INTLIST=vector<int>;




%}

%token DIGIT STRING LEFT_bracket RIGHT_bracket   OPENING_brace CLOSING_brace  COMMA SEMICOLON STOP
%type < std::vector<Jitem*> > itemlist
%type < std::vector<Jitem*> > json
%type < Jitem > item
%type < string > STRING
%type < vector<int> > intList
%type < int > DIGIT
%%
start : json STOP {

    for(jsonItem i:$1)
    {
        i.show();
        cout<<endl;
    }
    exit(1);
};
json:OPENING_brace itemList CLOSING_brace {
    $$=$2;
};
itemList:item{
$$.push_back(&$1);
}
|itemList COMMA item{$1.push_back(&$2);$$=$1;}

item:STRING SEMICOLON DIGIT{intItem t=new intItem();t.value=$3;t.name=$1;$$=t;}
|STRING SEMICOLON STRING{stringItem t=new stringItem();t.value=$3;t.name=$1;$$=t;}
|STRING SEMICOLON intList{listItem t=new listItem();t.value=$3;t.name=$1;$$=t;}

intList:LEFT_bracket nums RIGHT_bracket{$$=$2; }

nums:nums COMMA DIGIT{
	$1.push_back($3);
	$$=$1;
}
| DIGIT{$$.push_back($1);}
| {};

%%

main(){
    printf("Type something followed by Return. Type 'q' to end.\n");
    printf("\n");
    return(yyparse());          /* Start the parser */
}

yyerror(s)
char *s; {
    printf("yacc error: %s\n", s);
}

yywrap(){
    return(0);
}