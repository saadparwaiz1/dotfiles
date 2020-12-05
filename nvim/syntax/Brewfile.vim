if exists("b:current_syntax") 
    finish 
endif

syntax keyword brewfileDirective brew cask tap mas cask_args
syntax keyword brewfileOptions args id
syntax region brewfileString start='"' end='"'
syntax match brewfileNumbers '\d\+'
syntax match brewfileNumbers '[-+]\d\+'
syntax match brewfileComment '\v#.*$'
syntax match brewfileOperator "\v\["
syntax match brewfileOperator "\v\]"
syntax match brewfileOperator "\v\:"
syntax match brewfileOperator "\v\,"


highlight def link brewfileDirective Keyword
highlight def link brewfileString String
highlight def link brewfileOptions Special
highlight def link brewfileNumbers Number
highlight def link brewfileComment Comment
highlight def link brewfileOperator Operator

let b:current_syntax = "brewfile"
