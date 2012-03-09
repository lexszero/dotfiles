if !has('conceal')
    finish
endif

"set ambiwidth=double

syntax match cNiceSymbols "||" conceal cchar=∨
syntax match cNiceSymbols "&&" conceal cchar=∧
" include the space after “!” – if present – so that “! a” becomes “¬a”
syntax match cNiceSymbols "\!\%( \|\)" conceal cchar=¬
syntax match cNiceSymbols "<=" conceal cchar=≤
syntax match cNiceSymbols ">=" conceal cchar=≥
" only conceal “==” if alone, to avoid concealing SCM conflict markers
"syntax match cNiceSymbols "=\@<!===\@!" conceal cchar=≡
syntax match cNiceSymbols "!=" conceal cchar=≠
syntax match cNiceSymbols "->" conceal cchar=▶
"syntax match cNiceSymbols "*" conceal cchar=⁕

syntax match cNiceIdent "\<sqrt\>" conceal cchar=√

"hi link cNiceSymbols Normal
"hi link cNiceKeyword Keyword
"hi link cNiceConstant Constant
hi! link Conceal Normal

setlocal conceallevel=2
