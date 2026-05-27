%option noyywrap
%option c++
%option yylineno 

%{
#include "Lexer.hpp"
%}

%%

"|"         { return TOKEN_DISJUNCTION; }
"."         { return TOKEN_CONCAT; }
"*"         { return TOKEN_KLEENE; }
"+"         { return TOKEN_PLUS; }
"?"         { return TOKEN_QUESTION; }
"~"         { return TOKEN_NEG; }
"("         { return TOKEN_LPAREN; }
")"         { return TOKEN_RPAREN; }

"a"         { return TOKEN_A; }
"b"         { return TOKEN_B; }

[ \t\n\r]+  { /* ignorar espacios */ }

<<EOF>>    { return TOKEN_END; }

.           { std::cerr << "Caracter inesperado: " << yytext << std::endl; }

%%

int Lexer::yylex() {
    return yyFlexLexer::yylex(); // delega en la base
}

Lexer::Lexer(std::istream* in, std::ostream* out)
    : yyFlexLexer(in, out) {}

std::string Lexer::getText() const {
    return YYText();
}
