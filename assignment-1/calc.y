/**
* Declaration of variables and functions
*/
%{
	#include <stdio.h>
	extern int yylineno;
	int yylex();
	int yyerror(char *s);
%}

/**
* Token declaration
*/
%token TOK_SEMICOLON TOK_ADD TOK_SUB TOK_NUM TOK_PRINTLN TOK_PRINT

/**
* For storing values omitted by yylval
*/
%union{
        float val;
}

/**
* Values associated with grammar declared in %union
*/
%type <val> expr TOK_NUM

/**
* Precedence as left
*/
%left TOK_ADD TOK_SUB

%%

/**
* Context Free Grammar below with postfix expressions.
*/
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

/**
* Method to print the parsing error with line no occured when there is mistake in input parameters.
*/
int yyerror(char *s)
{
	printf("Parsing error: line %d\n", yylineno);
	return 0;
}

/**
* Main function to start parsing.
*/
int main()
{
   yyparse();
   return 0;
}
