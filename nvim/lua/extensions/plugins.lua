-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Optional Packages {{{
-- ============================================================================
vim.cmd('packadd! fzf.vim')
vim.cmd('packadd! vim-commentary')
vim.cmd('packadd! nvim-treesitter')
vim.cmd('packadd! auto-pairs')
vim.cmd('packadd! completion-nvim')
vim.cmd('packadd! snippets.nvim')
vim.cmd('packadd! vim-surround')
-- }}}
-- ============================================================================
-- Import Moduless {{{
-- ============================================================================
local snippets = require('snippets')
local treesitter = require('nvim-treesitter.configs')

-- }}}
-- ============================================================================
-- LSP Settings {{{
-- ============================================================================
require('extensions/lsp')
-- }}}
-- ============================================================================
-- Tree Sitter Configuration {{{
-- ============================================================================
treesitter.setup {
	ensure_installed = {
		'python',
		'lua',
	},
	highlight = {
		enable = true,
	}
}

vim.cmd('set foldmethod=expr')
vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
-- }}}
-- ============================================================================
-- Snippets {{{
-- ============================================================================
vim.g.snippets_nvim_win = false

snippets.set_ux(require('extensions.inserters.completion'))
snippets.snippets = {
	_global = require('extensions/snippets/global'),
	c = require('extensions/snippets/c'),
	cpp = require('extensions/snippets/cpp'),
	python = require('extensions/snippets/python'),
	lua = require('extensions/snippets/lua')
}
-- }}}
-- ============================================================================
-- Completion Configuration  {{{
-- ============================================================================

vim.g.completion_chain_complete_list = {
	{complete_items={'lsp', 'snippet'}},
	{mode='<c-p>'},
	{mode='<c-n>'},
	{mode='file'}
}

vim.g.completion_auto_change_source = 1
vim.g.completion_enable_snippet = 'snippets.nvim'
-- }}}
-- ============================================================================
