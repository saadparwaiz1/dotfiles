vim.cmd('packadd! completion-nvim')

vim.g.completion_chain_complete_list = {
	default = {
		{complete_items={'lsp', 'snippet'}},
		{mode='<c-p>'},
		{mode='<c-n>'},
		{mode='file'}
	}
}

vim.g.completion_matching_strategy_list = {
	'exact',
	'substring',
}

vim.g.completion_auto_change_source = 1
vim.g.completion_enable_snippet = 'snippets.nvim'
