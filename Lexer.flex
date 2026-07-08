import java_cup.runtime.*;

%%
%class Lexer
%unicode
%cup
%line
%column

%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}

Linha = \r|\n|\r\n
Espaco = {Linha} | [ \t\f]
Numero = [0-9]+ ( \. [0-9]+ )?
Identificador = [a-zA-Z_][a-zA-Z0-9_]*
String = \'[^\']*\'

%%
<YYINITIAL> {
  "avance"      { return symbol(sym.AVANCE); }
  "vire"        { return symbol(sym.VIRE); }
  "leiaSensor"  { return symbol(sym.LEIASENSOR); }
  "se"          { return symbol(sym.SE); }
  "entao"       { return symbol(sym.ENTAO); }
  "enquanto"    { return symbol(sym.ENQUANTO); }
  "funcao"      { return symbol(sym.FUNCAO); }
  "retorne"     { return symbol(sym.RETORNE); }
  "inicio"      { return symbol(sym.INICIO); }
  "fim"         { return symbol(sym.FIM); }
  "inteiro"     { return symbol(sym.INTEIRO); }
  "logico"      { return symbol(sym.LOGICO); }
  "ponto"       { return symbol(sym.PONTO); }

  "+"           { return symbol(sym.MAIS); }
  "-"           { return symbol(sym.MENOS); }
  "*"           { return symbol(sym.MULT); }
  "/"           { return symbol(sym.DIV); }
  "=="          { return symbol(sym.IGUAL); }
  "!="          { return symbol(sym.DIFERENTE); }
  "<"           { return symbol(sym.MENOR); }
  ">"           { return symbol(sym.MAIOR); }
  "="           { return symbol(sym.ATRIBUICAO); }

  ";"           { return symbol(sym.PONTOVIRGULA); }
  "("           { return symbol(sym.APARENTESES); }
  ")"           { return symbol(sym.FPARENTESES); }
  "{"           { return symbol(sym.ACHAVES); }
  "}"           { return symbol(sym.FCHAVES); }

  {Numero}        { return symbol(sym.NUMERO, yytext()); }
  {String}        { return symbol(sym.TEXTO, yytext()); }
  {Identificador} { return symbol(sym.ID, yytext()); }
  {Espaco}        { /* ignora espaços */ }
  .               { throw new Error("Erro Lexico: " + yytext() + " na linha " + (yyline+1)); }
}