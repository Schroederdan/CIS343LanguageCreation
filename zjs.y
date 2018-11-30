%{ 
  #define YYSTYPE int
  #include <stdio.h>
  #include <stdlib.h>
  #include "zjs.h"

  extern YYSTYPE yylval;
  int yylex();
  int yyerror(const char* err);
  char *p;
%}




// Now, we provide the type information
// for our tokens (tokens are defined in)
// our Flex file.  We want the value to be
// stored from Flex in the proper data
// structure.
%token INT
%token FLOAT
%token VAR
%token END_STATEMENT
%token END
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token COLOR
%token INVALID_CHAR

// We may have other tokens in our Flex file.
// They may not need type information, but we
// still need to let Bison know about them.
%token START
%%

statement_list: statement END_STATEMENT
              | statement END_STATEMENT statement_list
	      | END {finish();}
              ;
statement:      LINE INT INT INT INT {line($2,$3,$4,$5);}
	|	POINT INT INT {point($2,$3);}
	|	CIRCLE INT INT INT {circle($2,$3,$4);}
	|	RECTANGLE INT INT INT INT {rectangle($2,$3,$4,$5);}
	|	COLOR INT INT INT {set_color($2,$3,$4);}
	;
%%

int yyerror(const char* err){
	printf("%s",err);
}

int main(int argc, char** argv){
  setup();
  yyparse();
  return 0;
}
