%{
#include <stdio.h>
extern int yylineno;
int yylex();
int yyerror(char *s);
%}

%token TOK_SEMICOLON TOK_ADD TOK_SUB TOK_NUM TOK_PRINTLN TOK_PRINT

%union{
        float int_val;
}

/*%type <int_val> expr TOK_NUM*/
%type <int_val> expr TOK_NUM

%left TOK_ADD TOK_SUB
%left TOK_MUL TOK_DIV

%%

stmt: 
	| stmt expr_stmt
;

expr_stmt:
	 expr TOK_SEMICOLON
	| TOK_PRINTLN expr TOK_SEMICOLON 
	| TOK_PRINT expr TOK_SEMICOLON
		{
			fprintf(stdout, "Result: %.2f\n", $2);
		} 
;

expr: 	 
	expr expr TOK_ADD
	  {
		$$ = $1 + $2;
	  }
	| expr expr TOK_SUB
	  {
		$$ = $1 - $2;
	  }
	| TOK_NUM
	  { 	
		$$ = $1;
	  }
;


%%

int yyerror(char *s)
{
	printf("Parsing error: line %d\n",yylineno);
	return 0;
}

int main()
{
   yyparse();
   return 0;
}
