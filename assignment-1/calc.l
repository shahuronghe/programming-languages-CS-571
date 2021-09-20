/**
* Header files, variables and functions declaration.
*/
%{
	#include <string.h>
	#include <stdio.h>
	#include "calc.tab.h"
	int yylineno;
%}

digit	([0-9])


/**
* Rules declaration 
*/
%%

"print"			{ return(TOK_PRINT); }

"println"      		{ return(TOK_PRINTLN); }

{digit}+		{ sscanf(yytext, "%f", &yylval); return TOK_NUM; }

{digit}+"."{digit}+	{ sscanf(yytext, "%f", &yylval); return TOK_NUM; }

";"			{ return(TOK_SEMICOLON); }

"+"			{ return(TOK_ADD); }

"-"			{ return(TOK_SUB); }

[ \n] 			{ }

[ \t]			{ }

.			{ printf("Lexical analysis error: '%c' at line no: %d\n", yytext[0], yylineno); }

%%

