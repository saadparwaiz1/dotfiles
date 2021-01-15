vim.cmd('packadd! completion-nvim')

vim.g.completion_chain_complete_list = {
	default = {
		{complete_items={'lsp', 'snippet'}},
		{mode='<c-p>'},
		{mode='<c-n>'},
		{mode='file'}
	}
}

vim.g.completion_auto_change_source = 1

local autocmds_completion = {
		plugins = {
			{"BufEnter", "*", "lua require('completion').on_attach()"},
		}
}

nvim_create_augroups(autocmds_completion)
