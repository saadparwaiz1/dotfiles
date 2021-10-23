local ls = require('luasnip')
local s = ls.snippet
local f = ls.function_node

return {
  s({ trig = '#(%d)', dscr = 'Add Heading', regTrig = true, hidden = true }, {
    f(function(_, snip)
      return string.rep('#', tonumber(snip.captures[1])) .. ' '
    end, {}),
  }),
}
