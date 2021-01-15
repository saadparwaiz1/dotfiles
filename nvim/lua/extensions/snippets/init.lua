vim.cmd('packadd! snippets.nvim')
local snippets = require('snippets')

snippets.snippets = {
	_global = require('extensions/snippets/snippets/global'),

	c = require('extensions/snippets/snippets/c'),
	lua = require('extensions/snippets/snippets/lua'),
	python = require('extensions/snippets/snippets/python'),
}


local all = {noremap = true, silent = true, expr = true}
local tab = [[pumvisible() ? "\<C-n>" : luaeval('require"snippets".has_active_snippet()') ? "<cmd>lua return require'snippets'.expand_or_advance(1)<CR>" : "\<Tab>"]]
local stab = [[pumvisible() ? "\<C-p>" : luaeval('require"snippets".has_active_snippet()') ? "<cmd>lua return require'snippets'.advance_snippet(-1)<CR>" : "\<S-Tab>"]]

vim.api.nvim_set_keymap('i', '<tab>', tab, all)
vim.api.nvim_set_keymap('i', '<s-tab>', stab, all)

vim.g.completion_enable_snippet = 'snippets.nvim'
