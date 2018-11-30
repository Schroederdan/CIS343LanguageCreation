%{
	#include <stdio.h>
	void printLexeme();

	int lineNumber = 0; 
%}

%%


end 		{printf("END"); printLexeme();}
;		{printf("END STATEMENT"); printLexeme();}
point		{printf("POINT"); printLexeme(); }
line		{printf("LINE"); printLexeme();}
circle		{printf("CIRCLE"); printLexeme();}
rectangle	{printf("RECTANGLE"); printLexeme();}
set_color	{printf("COLOR"); printLexeme();}
[0-9]+		{printf("INTEGER"); printLexeme();} 
[0-9]+\.[0-9]+	{printf("FLOAT"); printLexeme();}
[\t|' ']		; //Ignore tabs
(\n)		{lineNumber++;}
.		{printf("INVALID CHAR %d", lineNumber); printLexeme();  }


%%

void printLexeme(){
	printf("\t(%s)\n", yytext); 
}

int main(int argc, char** argv){
	yylex();
	return 0;
}
