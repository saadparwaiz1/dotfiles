if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

runtime syntax/markdown.vim

unlet b:current_syntax
let b:current_syntax = 'text'
