local ls = require('luasnip')
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node

ls.config.set_config({})
ls.snippets = {
  all = {
    s({ trig = 'hd', dscr = 'Add SheBang' }, {
      f(function()
        local cstring = vim.bo.commentstring
        cstring = vim.split(cstring, '%s', true)[1]
        if cstring == '/*' then
          cstring = '//'
        end
        cstring = vim.trim(cstring)
        return { cstring }
      end, {}),
      t({ '!/usr/bin/env ' }),
      i(1, { vim.bo.filetype }),
      i(0),
    }),
  },
  lua = {
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
  },
  tex = {
    s({trig='beg', dscr='Add Environment'}, {
      t('\\begin{'),
      f(function (args)
        return args[1][1]
      end, {1}),
      t({'}', '\t'}), i(0),
      t({'', '\\end{'}),
      i(1),
      t('}'),
    })
  }
}

vim.api.nvim_set_keymap(
  'i',
  '<Tab>',
  [[luaeval("require('s.util').config.tab_complete()")]],
  { expr = true }
)
vim.api.nvim_set_keymap(
  's',
  '<Tab>',
  [[luaeval("require('s.util').config.tab_complete()")]],
  { expr = true }
)
vim.api.nvim_set_keymap(
  'i',
  '<S-Tab>',
  [[luaeval("require('s.util').config.s_tab_complete()")]],
  { expr = true }
)
vim.api.nvim_set_keymap(
  's',
  '<S-Tab>',
  [[luaeval("require('s.util').config.s_tab_complete()")]],
  { expr = true }
)
