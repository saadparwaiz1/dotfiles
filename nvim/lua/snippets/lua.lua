local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local d = ls.dynamic_node
-- local c = ls.choice_node

return {
    s({ trig = 'req', dscr = 'Require Module' }, {
      t({ 'local ' }),
      f(function(args)
        local mod = args[1][1]
        return { mod:match('([^.()]+)[()]*$') }
      end, {
        1,
      }),
      t({ " = require('" }),
      i(1),
      t({ "')" }),
      i(0),
    }),
}
