  
LEX = version1_2.lex
CUP = version1_2.cup

parser.class :	parser.java sym.java Yylex.java
	javac	$^

parser.java:	$(CUP)
	cup	$< #-dump -expect 16

Yylex.java :	$(LEX)
	jflex	$<

clear :
	rm *.class *.java *.java~ *.class~ *.lex~ *.*.cup~