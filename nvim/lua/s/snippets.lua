local ls = require('luasnip')
ls.config.set_config({})

ls.snippets = {}

setmetatable(ls.snippets, {
  __index = function (t,k)
    local ok, mod = pcall(require, 'snippets.'..k)
    if ok then
      t[k] = mod
      return mod
    end
    t[k] = {}
    return {}
  end
})

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
vim.api.nvim_set_keymap(
  'i',
  '<C-k>',
  '<cmd>lua require"luasnip".change_choice(1)<Cr>',
  {noremap = true}
)
vim.api.nvim_set_keymap(
  's',
  '<C-k>',
  '<cmd>lua require"luasnip".change_choice(1)<Cr>',
  {noremap = true}
)
