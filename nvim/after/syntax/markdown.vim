unlet b:current_syntax

syn include @tex syntax/tex.vim
syn region mkdMath start="\\\@<!\$" end="\$" skip="\\\$" contains=@tex keepend
syn region mkdMath start="\\\@<!\$\$" end="\$\$" skip="\\\$" contains=@tex keepend
syn region mkdStrike matchgroup=htmlStrike start="\%(\~\~\)" end="\%(\~\~\)" concealends

syn region mkdID matchgroup=mkdDelimiter    start="\["    end="\]" contained oneline conceal
syn region mkdURL matchgroup=mkdDelimiter   start="("     end=")"  contained oneline conceal
syn region mkdLink matchgroup=mkdDelimiter  start="\\\@<!!\?\[\ze[^]\n]*\n\?[^]\n]*\][[(]" end="\]" contains=@mkdNonListItem,@Spell nextgroup=mkdURL,mkdID skipwhite concealends

syn match   mkdInlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?[^] \t]*/

syn region  mkdInlineURL matchgroup=mkdDelimiter start="(\(https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?[^] \t]*)\)\@=" end=")"

syn region mkdInlineURL matchgroup=mkdDelimiter start="\\\@<!<\ze[a-z][a-z0-9,.-]\{1,22}:\/\/[^> ]*>" end=">"

syn region mkdLinkDef matchgroup=mkdDelimiter   start="^ \{,3}\zs\[\^\@!" end="]:" oneline nextgroup=mkdLinkDefTarget skipwhite
syn region mkdLinkDefTarget start="<\?\zs\S" excludenl end="\ze[>[:space:]\n]"   contained nextgroup=mkdLinkTitle,mkdLinkDef skipwhite skipnl oneline
syn region mkdLinkTitle matchgroup=mkdDelimiter start=+"+     end=+"+  contained
syn region mkdLinkTitle matchgroup=mkdDelimiter start=+'+     end=+'+  contained
syn region mkdLinkTitle matchgroup=mkdDelimiter start=+(+     end=+)+  contained

syn cluster mkdNonListItem contains=mkdInlineURL,mkdLink,mkdLinkDef,mkdLineBreak,mkdBlockquote,mkdMath,mkdStrike


hi  mkdLink          guifg=#83A598 guibg=NONE guisp=#83A598 gui=underline blend=NONE
hi def link mkdURL           markdownUrl
hi def link mkdInlineURL     mkdLink
hi def link mkdID            Identifier
hi def link mkdLinkDef       mkdID
hi def link mkdLinkDefTarget mkdURL
hi def link mkdLinkTitle     GruvboxGreen
hi mkdStrike term=strikethrough cterm=strikethrough gui=strikethrough

let b:current_syntax = 'mkd'
