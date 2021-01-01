vim.cmd('packadd! snippets.nvim')
local snippets = require('snippets')

vim.g.snippets_nvim_win = false
snippets.set_ux(require('extensions.snippets.inserters.completion'))

snippets.snippets = {
	_global = require('extensions/snippets/snippets/global'),
	c = require('extensions/snippets/snippets/c'),
	python = require('extensions/snippets/snippets/python'),
	lua = require('extensions/snippets/snippets/lua')
}
