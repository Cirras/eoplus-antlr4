lexer grammar EOPlusLexer;

//
// Keywords
//

MAIN : M A I N;
STATE : S T A T E;
QUESTNAME: Q U E S T N A M E;
VERSION: V E R S I O N;
HIDDEN_: H I D D E N;
HIDDEN_END: H I D D E N '_' E N D;
DISABLED: D I S A B L E D;
DESC: D E S C;
ACTION: A C T I O N;
IF: I F;
ELSEIF: E L S E I F;
ELIF: E L I F;
ELSE: E L S E;
RULE: R U L E;
GOAL: G O A L;
GOTO: G O T O;
CHARACTER: C H A R A C T E R;
NPC: N P C;
MAP: M A P;
WORLD: W O R L D;

// Keywords are case-insensitive, so we compose them of these fragments
fragment A : [aA];
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];

//
// Symbols
//

LPAREN : '(';
RPAREN : ')';
LBRACE : '{';
RBRACE : '}';
SEMI : ';';
COMMA : ',';
DOT : '.';

//
// Literals
//

IntegerLiteral
    : [0-9]+
    ;

StringLiteral
    :	'"' StringCharacter* '"'
    ;

fragment
StringCharacter
    :	~["\\\r\n]
    |	EscapeSequence
    ;

fragment
EscapeSequence
    :	'\\' ~[\r\n]
    ;

//
// Identifiers
//

Identifier
    :	[$_a-zA-Z][_a-zA-Z0-9]*
    ;

//
// Whitespace and comments
//

WS  :  [ \t\r\n\u000C]+ -> skip
    ;

LINE_COMMENT
    :   '//' ~[\r\n]* -> skip
    ;
