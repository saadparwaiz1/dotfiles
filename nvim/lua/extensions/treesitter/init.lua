vim.cmd('packadd! nvim-treesitter')
local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
	ensure_installed = {
		'python',
		'lua',
		'c',
		'cpp'
	},
	highlight = {
		enable = true,
	},
}

vim.cmd('set foldmethod=expr')
vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
