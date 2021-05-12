package Jlex;
import java_cup.runtime.Symbol; 
%%

%class Yylex
%cup
%public
%line
%char
%state COMMENT

%{
    private int comment_count = 0;
%}

digito = [0-9]
letra = [a-zA-Z]


blanco=[\n\ \t\b]
cadenaTexto=(\\\"|[^\n\"]|\\{blanco}+\\)*
identificador = ({letra})({letra}|{digito}|"_")*
espacio = [ \t]+
saltoLinea = [\n]+
decimal = [0-9]+("."[  |0-9]+)?

%%
<YYINITIAL> "{"  { return new Symbol (sym.LLA	,yyline,yychar, yytext());}
<YYINITIAL> "}"  { return (new Symbol(sym.LLC	,yyline,yychar, yytext()));}
<YYINITIAL> "["  { return new Symbol (sym.CA	,yyline,yychar, yytext());}
<YYINITIAL> "]"  { return (new Symbol(sym.CC	,yyline,yychar, yytext()));}
<YYINITIAL> "+"  { return (new Symbol(sym.MAS	,yyline,yychar, yytext()));}
<YYINITIAL> "-"  { return (new Symbol(sym.MENOS	,yyline,yychar, yytext()));}
<YYINITIAL> "*"  { return (new Symbol(sym.MULTIPLICACION	,yyline,yychar, yytext()));}
<YYINITIAL> "/"  { return (new Symbol(sym.DIVISION	,yyline,yychar, yytext()));}
<YYINITIAL> "%"  { return (new Symbol(sym.MOD		,yyline,yychar, yytext()));}
<YYINITIAL> "<"  { return (new Symbol(sym.MENOR		,yyline,yychar, yytext()));}
<YYINITIAL> ">"  { return (new Symbol(sym.MAYOR		,yyline,yychar, yytext()));}
<YYINITIAL> "<=" { return (new Symbol(sym.MENORIGUAL	,yyline,yychar, yytext()));}
<YYINITIAL> ">=" { return (new Symbol(sym.MAYORIGUAL	,yyline,yychar, yytext()));}
<YYINITIAL> "==" { return (new Symbol(sym.IGUAL	,yyline,yychar, yytext()));}
<YYINITIAL> "&&" { return (new Symbol(sym.AND	,yyline,yychar, yytext()));}
<YYINITIAL> "||" { return (new Symbol(sym.OR	,yyline,yychar, yytext()));}
<YYINITIAL> "!"  { return (new Symbol(sym.NOT	,yyline,yychar, yytext()));}
<YYINITIAL> "eq" { return (new Symbol(sym.EQ	,yyline,yychar, yytext()));}
<YYINITIAL> "ne" { return (new Symbol(sym.NE	,yyline,yychar, yytext()));}
<YYINITIAL> "in" { return (new Symbol(sym.IN	,yyline,yychar, yytext()));}
<YYINITIAL> "ni" { return (new Symbol(sym.NI	,yyline,yychar, yytext()));}

	

<YYINITIAL> "set"      { return (new Symbol(sym.SET		,yyline,yychar, yytext()));}	
<YYINITIAL> "puts"     { return (new Symbol(sym.PUTS	,yyline,yychar, yytext()));}
<YYINITIAL> "expr"     { return (new Symbol(sym.EXPR	,yyline,yychar, yytext()));}
<YYINITIAL> "if"       { return (new Symbol(sym.IF		,yyline,yychar, yytext()));}
<YYINITIAL> "then"     { return (new Symbol(sym.THEN	,yyline,yychar, yytext()));}
<YYINITIAL> "else"     { return (new Symbol(sym.ELSE	,yyline,yychar, yytext()));}
<YYINITIAL> "elseif"   { return (new Symbol(sym.ELSEIF	,yyline,yychar, yytext()));}
<YYINITIAL> "switch"   { return (new Symbol(sym.SWITCH	,yyline,yychar, yytext()));}
<YYINITIAL> "default"  { return (new Symbol(sym.DEFAULT	,yyline,yychar, yytext()));}
<YYINITIAL> "while"    { return (new Symbol(sym.WHILE	,yyline,yychar, yytext()));}
<YYINITIAL> "continue" { return (new Symbol(sym.CONTINUE,yyline,yychar, yytext()));}
<YYINITIAL> "break"    { return (new Symbol(sym.BREAK	,yyline,yychar, yytext()));}
<YYINITIAL> "for"      { return (new Symbol(sym.FOR		,yyline,yychar, yytext()));}
<YYINITIAL> "incr"     { return (new Symbol(sym.INCR	,yyline,yychar, yytext()));}
<YYINITIAL> "proc"     { return (new Symbol(sym.PROC	,yyline,yychar, yytext()));}
<YYINITIAL> "return"   { return (new Symbol(sym.RETURN	,yyline,yychar, yytext()));}	
<YYINITIAL> "$"        { return (new Symbol(sym.ASIG	,yyline,yychar, yytext()));}

	
<YYINITIAL> {blanco} { }
<YYINITIAL> {espacio} { }
<YYINITIAL> {saltoLinea} { }
 
<YYINITIAL>  \"{cadenaTexto}\" {
	String str =  yytext().substring(1,yytext().length() - 1);
	
	return (new Symbol(sym.AGRUPACION,yyline,yychar, yytext()));
}
<YYINITIAL> \#{cadenaTexto} {
	String str =  yytext().substring(1,yytext().length());

	return (new Symbol(sym.COMENTARIO,yyline,yychar, yytext()));
} 
<YYINITIAL> {digito}+ { 
	return (new Symbol(sym.DIGITO,yyline,yychar, yytext()));
}	

<YYINITIAL> {decimal} { 
	return (new Symbol(sym.DIGITODECIMAL,new Integer(yytext())));
}

<YYINITIAL> {identificador} {
	return (new Symbol(sym.IDENTIFICADOR,yyline,yychar, yytext()));
}	
<YYINITIAL,COMMENT> . {
    return    (new Symbol(sym.ERROR,yyline,yychar, yytext()));
}

