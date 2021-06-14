import java_cup.runtime.Symbol;
%%
%unicode
%cup
%line
%column

comments = "/"{2}.* | "/*"{1}.*"*/"{1}
pack= "package"
func = "func"
import = "import"
for = "for"
go = "go"
const="const"
var = "var"
make = "make"
chan ="chan"
range ="range"
if ="if"
else="else"
entier = [0-9]+
typeVariable=  "int" |"int8" | "int16" | "int32" |"float64"| "float32" | "bool"  
valeurBooleen = "true" | "false"
main="main"
println="fmt.Println"
select="select"

variable =[a-z]+[a-zA-Z0-9]*
chaine = \"[^\"\n]*\"

%%	
"="				{ return new Symbol(sym.EGAL); }
"["				{ return new Symbol(sym.CROOUV); }
"]"				{ return new Symbol(sym.CROFER); }
"-"				{ return new Symbol(sym.MOINS); }
"+"				{ return new Symbol(sym.PLUS); }
"/"				{ return new Symbol(sym.SLASH); }
"*"				{ return new Symbol(sym.MULT); }
":"				{ return new Symbol(sym.DEUXPOINT); }
"<"				{ return new Symbol(sym.INFE); }
">"				{ return new Symbol(sym.SUPE); }
"."				{ return new Symbol(sym.POINT); }
","				{ return new Symbol(sym.VIRG); }
"("				{ return new Symbol(sym.PAROUV); }
")"				{ return new Symbol(sym.PARFER); }
"{"				{ return new Symbol(sym.ACCOUV); }
"}"				{ return new Symbol(sym.ACCFER); }
";"				{ return new Symbol(sym.POINTVIRG); }
"|"				{ return new Symbol(sym.BARREVER); }
"!"				{ return new Symbol(sym.POINTINTER); }
"++"			{ return new Symbol(sym.INCRE); }
"--"			{ return new Symbol(sym.DECRE); }
"%"				{ return new Symbol(sym.MOD); }
" "				{}
{var}			{ return new Symbol(sym.VAR); }
{entier}		{ return new Symbol (sym.ENTIER, new String(yytext()));}
{comments}		{}
{main}			{ return new Symbol(sym.MAIN); }
{pack}			{ return new Symbol(sym.PACK); }
{println}		{ return new Symbol(sym.PRINTLN); }
{func}			{ return new Symbol(sym.FUNC); }
{import}		{ return new Symbol(sym.IMPORT); }
{for}			{ return new Symbol(sym.FOR); }
{go}			{ return new Symbol(sym.GO); }
{chan}			{ return new Symbol(sym.CHAN); }
{make}			{ return new Symbol(sym.MAKE); }
{select}		{ return new Symbol(sym.SELECT); }
{const}			{ return new Symbol(sym.CONST); }
{range}			{ return new Symbol(sym.RANGE); }
{if}			{ return new Symbol(sym.IF); }
{else}			{ return new Symbol(sym.ELSE); }
"\r\n" 			{}
"\n"			{}
"\t"			{}
{valeurBooleen}	{ return new Symbol(sym.VALEURBOOLEEN, new String (yytext()));}
{typeVariable}	{ return new Symbol(sym.TYPEVARIABLE, new String (yytext()));}
{variable}		{ return new Symbol(sym.VARIABLE, new String (yytext()));}
{chaine}		{ return new Symbol(sym.CHAINE, new String (yytext()));}
.				{ System.out.println(" Erreur ligne "+(yyline+1)+" colonne "+(yycolumn+1)+" : "+yytext()+" => caractère inconnu ! "); }