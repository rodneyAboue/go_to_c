import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

comments = "/"{2}.*
pack= "package"
func = "func"
import = "import"
for = "for"
go = "go"
const="const"
var = "var"
type = "type"
make = "make"
chan ="chan"
int = "int" 
bool= "bool"
true = "true"
false = "false"
number = [0-9]+
variable =[a-z][a-zA-Z0-9]+

%%
"="			{ return new Symbol(sym.EGAL); }
"["			{ return new Symbol(sym.CROOUV); }
"]"			{ return new Symbol(sym.CROFER); }
[\"]		{ return new Symbol(sym.GUIL); }
"-"			{ return new Symbol(sym.MOINS); }
"+"			{ return new Symbol(sym.PLUS); }
"/"			{ return new Symbol(sym.SLASH); }
"*"			{ return new Symbol(sym.MULT); }
":"			{ return new Symbol(sym.DEUXPOINT); }
"<"			{ return new Symbol(sym.INFE); }
">"			{ return new Symbol(sym.SUPE); }
"."			{ return new Symbol(sym.POINT); }
","			{ return new Symbol(sym.VIRG); }
"("			{ return new Symbol(sym.PAROUV); }
")"			{ return new Symbol(sym.PARFER); }
"{"			{ return new Symbol(sym.ACCOUV); }
"}"			{ return new Symbol(sym.ACCFER); }
";"			{ return new Symbol(sym.POINTVIRG); }
" "			{}
{var}		{ return new Symbol(sym.VAR); }
{number}	{ return new Symbol(sym.ENTIER, new Integer (yytext()));}
{comments}	{}
{pack}		{ return new Symbol(sym.PACK); }
{func}		{ return new Symbol(sym.FUNC); }
{import}	{ return new Symbol(sym.IMPORT); }
{for}		{ return new Symbol(sym.FOR); }
{go}		{ return new Symbol(sym.GO); }
{chan}		{ return new Symbol(sym.CHAN); }
{make}		{ return new Symbol(sym.MAKE); }
{type}		{ return new Symbol(sym.TYPE); }
{int}		{ return new Symbol(sym.INT); }
{bool}		{ return new Symbol(sym.BOOL); }
{const}		{ return new Symbol(sym.CONST); }
{true}		{ return new Symbol(sym.TRUE); }
{false}		{ return new Symbol(sym.FALSE); }
"\r\n" 		{}
"\n"		{}
"\t"		{}
{variable}	{ return new Symbol(sym.VARIABLE, new String (yytext()));}

.			{ System.out.println(" Erreur ligne "+(yyline+1)+" colonne "+(yycolumn+1)+" : "+yytext()+" => caractère inconnu ! "); }