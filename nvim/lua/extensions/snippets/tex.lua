local snippets = require('snippets')
local indent = snippets.u.match_indentation
return {
    fig = indent "\\begin{figure}[${2:ht}]\n\t\\centering\n\t\\includegraphic[width=${4:\\textwidth}]{$1}\n\t\\caption{$3}\n\t\\label{fig:$1}\n\\end{figure}"
 }
