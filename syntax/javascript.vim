" Vim syntax file
" Language:     JavaScript
" Authon:       Rinz
" Create Time:  2020 Nec 24

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'javascript'
elseif exists('b:current_syntax') && b:current_syntax == 'javascript'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "
if main_syntax == "javascript"
syn match   jsSymbol        "\%(!\|@\|#\|$\|%\|^\|&\|\*\|(\|)\)"
syn match   jsSymbol        "\%(`\|\~\|+\|-\|=\|{\|}\|\[\|\]\|\\\||\)"
syn match   jsSymbol        +\%(;\|:\|'\|"\|.\|,\|<\|>\|\/\|?\)+
syn match   jsIdentifier    "\<\w\+\>"
endif

syn region  jsComment       start="/\*"  end="\*/" keepend
syn match   jsComment       "\/\/.*$"
syn match   jsNumber        "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn match   jsNumber        "-\=\<\d\+\.\d\+\%([eE][+-]\=\d\+\)"
syn match   jsNumber        "-\=\<\d\+\.\d\+"
syn match   jsEscape        +\\['"\\nrtbf]+ contained
syn region  jsInlineExpr    start=+${+ skip=+\\\\\|\\"+ end=+}+ contained
syn region  jsString        start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=jsEscape
syn region  jsString        start=+'+ skip=+\\\\\|\\"+ end=+'+ contains=jsEscape
syn region  jsString        start=+`+ skip=+\\\\\|\\"+ end=+`+ contains=jsEscape,jsInlineExpr
syn region  jsRegExpr       start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gimuys]\{0,2\}\s*$+ end=+/[gimuys]\{0,2\}\s*[;.,)\]}]+me=e-1 oneline
syn keyword jsBoolean       true false
syn keyword jsNull          null undefined NaN Infinity

syn keyword jsStatement     return with break continue case default
syn match   jsStatement     "\<yield\>\*\="
syn keyword jsConditional   if else switch
syn keyword jsRepeat        while for do in of
syn keyword jsOperator      new delete instanceof typeof
syn match   jsOperator      "\%(!\|&&\|||\|?\|:\|>=\|<=\|<\|>\)"
if main_syntax == "javascript"
syn match   jsError         "\%(=\)\@<!\%(==\|!=\)\%(=\)\@!"
else
syn match   jsOperator      "\%(==\|!=\)"
endif
syn match   jsOperator      "\%(===\|!==\)"
syn match   jsParens        "\%(\%(for\|while\|switch\)\s*\)\@<=("
syn match   jsParens        "\%(\%(for\|while\|switch\).*\)\@<=)\%(\%(\s*{\)\=\s*$\)\@="
syn match   jsSemicolon     "\%(\%(for\|while\|switch\).*\)\@<=;"
syn match   jsBraces        "^{$"
syn match   jsBraces        "\%(^\S.*\)\@<={$"
syn match   jsBraces        "^};\=$"
syn match   jsLabel         "\%(^\s*\)\@<=\w\+:\%(\s*$\)\@="
syn match   jsLabel         "\%(\%(break\|continue\)\s\+\)\@<=\w\+\%(\s*;\=\s*$\)\@="

syn keyword jsDeclare       var let const
syn match   jsType          "\%(:\s*\)\@<=\%(Array\|Boolean\|Date\|Function\|Null\|Number\|Object\|String\|Symbol\|RegExp\|Undefined\)\>"
syn match   jsType          "\<\%(Array\|Boolean\|Date\|Function\|Null\|Number\|Object\|String\|Symbol\|RegExp\|Undefined\)\%(\.\)\@="
syn match   jsTypeCasting   "\%(\%(Array\|Boolean\|Date\|Function\|Null\|Number\|Object\|String\|Symbol\|RegExp\|Undefined\)\s*\)\@<=(\%(\w\)\@="
syn match   jsTypeCasting   "\%(\%(Array\|Boolean\|Date\|Function\|Null\|Number\|Object\|String\|Symbol\|RegExp\|Undefined\)\s*([^()]\+\)\@<=)"
syn match   jsFuncDec       "\<function\>\*\="
syn match   jsFuncDec       "=>"
syn match   jsVaArg         "\.\.\.\w\+\>"
syn match   jsFuncArg       "\<arguments\>\|\.\.\.args\>"
syn keyword jsSelfRef       this that other me my
syn match   jsCtorArg       "\%(spec\|genl\)\%(\.\w\+\>\)\="
syn match   jsSuperMethod   "super\w\+\>"

syn match   jsAttribute     "\%({.*\|^\s*\)\@<=\w\+\s*:"
syn match   jsAttribute     "\%({.*\|^\s*\)\@<=\[.\+\]\s*:"
syn match   jsMethod        "\%(^\s*\%(\%(static\|async\|get\|set\)\=\s*\*\=\s*\)\=\)\@<=\w\+\%(([^()]*)\s*{\s*$\)\@="
syn keyword jsMessage       alert confirm prompt status
syn keyword jsGlobal        self window top parent
syn keyword jsMember        document event location console
syn keyword jsException     try catch finally throw
syn keyword jsMathObj       Math
syn keyword jsReserved      abstract boolean byte char debugger double enum export final float goto implements import int interface long native package short synchronized throws transient volatile 
syn keyword jsES6Class      class extends
syn keyword jsES6Modifier   private protected public static get set async await
syn keyword jsES6Super      super
syn match   jsInHTML        "\%(<!--\|-->\)"


syn match   jsObjAttr       "\.\%(length\)\>"
syn match   jsArgAttr       "\%(arguments\)\@<=\.\%(length\)\>"
syn match   jsGlblFunc      "\%(decodeURI\|decodeURIComponent\|encodeURI\|encodeURIComponent\|escape\|eval\|isFinite\|isNaN\|parseFloat\|parseInt\|unescape\)("me=e-1

syn match   jsPrototype     "\.prototype\>"
syn match   jsPrototype     "\.prototype\.\%(\w\)\@="
syn match   jsPrototype     "\.prototype\.constructor\>"
syn match   jsPrototype     "\<Object.prototype\%(\.\)\="
syn match   jsPrototype     "\<Function.prototype\%(\.\)\="
syn match   jsFuncApply     "\.\%(apply\|call\|bind\)("me=e-1
syn match   jsFuncApply     "\.\%(apply\|call\|bind\)("me=e-1

syn match   jsCreate        "\.constructor\>"
syn match   jsCreate        "\<Object\.create("me=e-1
syn match   jsObject        "\%(\<Object\.create(\s*\)\@<=\%(\w\+\)\%(\s*)\)\@="
syn match   jsConstructor   "\%(\<\%(new\|var\|let\)\s\+\)\@<=\<[A-Z]\w*\>"
syn match   jsConstructor   "\<[A-Z]\w*("me=e-1
syn match   jsClassName     "\%(\%(class\|extends\)\s\+\)\@<=\w\+\%(\s*{\)\@="
syn match   jsClassName     "\%(const\s\+\)\@<=\w\+\%(\s*=\s*\%(class\|function(\%(spec\|genl\)\)\)\@="
syn match   jsClassCtor     "\%(^\s*\)\@<=constructor\%(\s*(\)\@="
" ========================================================================= "
hi def link jsIdentifier    Identifier
hi def link jsSymbol        Symbol
hi def link jsComment       Comment
hi def link jsNumber        Number
hi def link jsEscape        SpecialChar
hi def link jsInlineExpr    SpecialChar
hi def link jsString        String
hi def link jsRegExpr       String
hi def link jsBoolean       Boolean
hi def link jsNull          Boolean
hi def link jsStatement     Statement
hi def link jsConditional   Conditional
hi def link jsRepeat        Repeat
hi def link jsOperator      Operator
hi def link jsParens        Operator
hi def link jsSemicolon     Operator
hi def link jsBraces        Function
hi def link jsLabel         Label
hi def link jsDeclare       Type
hi def link jsType          Type
hi def link jsTypeCasting   Type
hi def link jsFuncDec       Type
hi def link jsVaArg         Special
hi def link jsFuncArg       Parameter
hi def link jsArgAttr       Parameter
hi def link jsSelfRef       SelfRef
hi def link jsCtorArg       Structure
hi def link jsSuperMethod   Statement
hi def link jsAttribute     Label
hi def link jsMethod        Method
hi def link jsMessage       Function
hi def link jsMember        Function
hi def link jsGlobal        Statement
hi def link jsException     Process
hi def link jsDeprecated    Specifier
hi def link jsReserved      Tag
hi def link jsES6Class      Type
hi def link jsES6Modifier   Process
hi def link jsES6Super      Statement
hi def link jsException     Exception
hi def link jsInHTML        Error
hi def link jsError         Error
hi def link jsObjAttr       Function
hi def link jsGlblFunc      Function
hi def link jsPrototype     Function
hi def link jsFuncApply     Statement
hi def link jsCreate        Statement
hi def link jsObject        Class
hi def link jsMathObj       Class
hi def link jsConstructor   Class
hi def link jsClassName     Class
hi def link jsClassCtor     Attribute
" ========================================================================= "
let b:current_syntax = 'javascript'
if main_syntax == 'javascript'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
