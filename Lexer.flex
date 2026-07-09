import java_cup.runtime.*;

%%
%class Lexer
%unicode
%cup
%line
%column

%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline + 1, yycolumn + 1);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline + 1, yycolumn + 1, value);
  }
%}

Linha = \r|\n|\r\n
Espaco = {Linha} | [ \t\f]
Numero = [0-9]+ ( \. [0-9]+ )?
Identificador = [a-zA-Z_][a-zA-Z0-9_]*
String = \'[^\']*\'|\"[^\"]*\"

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

  {Numero}        { System.out.println("  [Léxico] Numero capturado: " + yytext()); return symbol(sym.NUMERO, yytext()); }
  {String}        { System.out.println("  [Léxico] Texto capturado: " + yytext()); return symbol(sym.TEXTO, yytext()); }
  {Identificador} { System.out.println("  [Léxico] Variavel capturada: " + yytext()); return symbol(sym.ID, yytext()); }
  {Espaco}        { /* ignora espaços */ }
  
  .               { System.err.println("Erro Lexico: Caractere invalido '" + yytext() + "' na linha " + (yyline+1) + ", coluna " + (yycolumn+1)); }
}