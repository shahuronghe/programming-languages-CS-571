%{
	#include <string.h>
	#include <stdio.h>
	#include "calc.tab.h"
	int yylineno;
	char *str;
%}

digit	([0-9])

%%

"print"		{ return(TOK_PRINT); }

"println"       {       return(TOK_PRINTLN);}


{digit}+	{
		sscanf(yytext, "%f", &yylval);
		return TOK_NUM;
		}
{digit}"."{digit}+	{
		sscanf(yytext, "%f", &yylval);
		return TOK_NUM;
		}

";"	{	return(TOK_SEMICOLON);	}

"+"	{	return(TOK_ADD);	}
"-"	{	return(TOK_SUB);	}
[ \n] 	{}
[ \t]	{}
[ ]	{}

.	{printf("Lexical analysis error: '%c' at line no: %d\n", 
			yytext[0],yylineno);
	}

%%

