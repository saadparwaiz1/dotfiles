local indent = require('snippets').u.match_indentation

local lua = {
    req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require('$1')]],
}

return lua
