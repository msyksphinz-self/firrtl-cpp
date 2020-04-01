grammar FIRRTL_begin;

// Does there have to be at least one module?
// Does there have to be at least one module?
circuit
  : 'circuit' id ':' info? module* EOF
  ;

module
  : 'module' id ':' info? port* moduleBlock
  ;

moduleBlock
  : simple_stmt*
  ;

simple_stmt
  : stmt
  ;

port
  : dir id ':' type info?
  ;

dir
  : 'input'
  | 'output'
  ;

type
  : 'UInt' ('<' intLit '>')?
  | 'SInt' ('<' intLit '>')?
  | '{' field* '}'        // Bundle
  ;

field
  : 'flip'? fieldId ':' type
  ;

fieldId
  : Id
  | RelaxedId
  | UnsignedInt
  | keywordAsId
  ;

intLit
  : UnsignedInt
  | SignedInt
  | HexLit
  ;

UnsignedInt
  : '0'
  | PosInt
  ;

SignedInt
  : ( '+' | '-' ) PosInt
  ;

fragment
PosInt
  : [1-9] ( Digit )*
  ;

fragment
Digit
  : [0-9]
  ;

HexLit
  : '"' 'h' ( '+' | '-' )? ( HexDigit )+ '"'
  ;

fragment
HexDigit
  : [a-fA-F0-9]
  ;

id
  : Id
  | keywordAsId
  ;

Id
  : LegalStartChar (LegalIdChar)*
  ;


RelaxedId
  : (LegalIdChar)+
  ;

fragment
LegalIdChar
  : LegalStartChar
  | Digit
  | '$'
  ;

fragment
LegalStartChar
  : [a-zA-Z_]
  ;


// Keywords that are also legal ids
keywordAsId
  : 'circuit'
  | 'module'
  | 'extmodule'
  | 'parameter'
  | 'input'
  | 'output'
  | 'UInt'
  | 'SInt'
  | 'Clock'
  | 'Analog'
  | 'Fixed'
  | 'flip'
  | 'wire'
  | 'reg'
  | 'with'
  | 'reset'
  | 'mem'
  | 'depth'
  | 'reader'
  | 'writer'
  | 'readwriter'
  | 'inst'
  | 'of'
  | 'node'
  | 'is'
  | 'invalid'
  | 'when'
  | 'else'
  | 'stop'
  | 'printf'
  | 'skip'
  | 'old'
  | 'new'
  | 'undefined'
  | 'mux'
  | 'validif'
  | 'cmem'
  | 'smem'
  | 'mport'
  | 'infer'
  | 'read'
  | 'write'
  | 'rdwr'
  ;

stmt
  : exp '<=' exp info?
  ;


exp
  : 'UInt' ('<' intLit '>')? '(' intLit ')'
  | 'SInt' ('<' intLit '>')? '(' intLit ')'
  | id    // Ref
  | exp '.' fieldId
  | exp '[' intLit ']'
  | exp '[' exp ']'
  | 'mux(' exp exp exp ')'
  | 'validif(' exp exp ')'
  ;


info
  : FileInfo
  ;

FileInfo
  : '@[' ('\\]'|.)*? ']'
  ;

// NEWLINE
// 	:'\r'? '\n' ' '*
// 	;

WS : [\t\n, ]+ -> skip ; // skip spaces, tabs, newlines
