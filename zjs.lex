%{
	#include <stdio.h>
	#include "zjs.tab.h"
	void printLexeme();

	int lineNumber = 0; 
	
%}

%option noyywrap

%%


end 		{return END;}
;		{return END_STATEMENT;}
point		{return POINT;}
line		{return LINE;}
circle		{return CIRCLE;}
rectangle	{return RECTANGLE;}
set_color	{return COLOR;}
[0-9]+		{yylval=atoi(strdup(yytext));return INT;}
[0-9]+\.[0-9]+	{return FLOAT;}
[\t|' ']		; //Ignore tabs
(\n)		{lineNumber++;}
.		{return INVALID_CHAR;  } 


%%

/*
void printLexeme(){
	printf("\t(%s)\n", yytext); 
}


int main(int argc, char** argv){
	yylex();
	return 0;
}*/

