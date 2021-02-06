vim.cmd('packadd! snippets.nvim')
local snippets = require('snippets')

vim.g.snippets_nvim_win = false

_G.act_snip = snippets.has_active_snippet
_G.exp_snip = snippets.expand_or_advance
_G.adv_snip = snippets.advance_snippet

snippets.snippets = {
	_global = require('extensions/snippets/snippets/global'),
	c = require('extensions/snippets/snippets/c'),
	python = require('extensions/snippets/snippets/python'),
	lua = require('extensions/snippets/snippets/lua')
}

vim.g.completion_enable_snippet = 'snippets.nvim'
vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? '<C-n>' : v:lua.act_snip() ? '<cmd>call v:lua.exp_snip(1)<CR>' : '<Tab>']], {expr=true, silent=true, noremap=true})
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? '<C-p>' : v:lua.act_snip() ? '<cmd>call v:lua.adv_snip(-1)<CR>' : '<S-Tab>']], {expr=true, silent=true, noremap=true})
