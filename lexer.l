%{
#include "parser.tab.h"
%}

%%

"int"      return INT;
"float"    return FLOAT;

[0-9]+     return INTLIT;

[ \t\n]+   ;

.          return yytext[0];

%%
