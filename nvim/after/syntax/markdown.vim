syn region math start=/\$\$/ end=/\$\$/
syn match math '\$[^$].\{-}\$'
hi link math Statement
