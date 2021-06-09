syn region math start=/\$\$/ end=/\$\$/
syn match math '\$[^$].\{-}\$'
hi link math Statement
syn region mkdID matchgroup=mkdDelimiter        start="\["    end="\]" contained oneline conceal
syn region mkdURL matchgroup=mkdDelimiter       start="("     end=")"  contained oneline conceal
syn region mkdLink matchgroup=mkdDelimiter      start="\\\@<!!\?\[" end="\]\ze\s*[[(]" contains=@mkdNonListItem,@Spell nextgroup=mkdURL,mkdID skipwhite oneline concealends
