vim.cmd('packadd! popup.nvim')
vim.cmd('packadd! plenary.nvim')
vim.cmd('packadd! telescope.nvim')
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		mappings = {
			i = {
				['<Esc>'] = actions.close
			}
		},
		prompt_position = 'bottom',
		prompt_prefix = '🔍',
		initial_mode = 'insert',
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		file_sorter =  require'telescope.sorters'.get_fzy_sorter,
		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		shorten_path = true,
		file_ignore_patterns = {
			".git/.*",
			"node_modules/.*",
			"__pycache__/.*"
		},
		winblend = 0,
		width = 0.75,
		preview_cutoff = 120,
		results_height = 1,
		results_width = 0.8,
		border = {},
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
		color_devicons = true,
		use_less = true,
		set_env = { ['COLORTERM'] = 'truecolor' },
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
	}
}

vim.api.nvim_set_keymap('n', '\\cmdf', '<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '\\cmdl', '<cmd>Telescope live_grep<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '\\cmdo', '<cmd>lua require("telescope.builtin").oldfiles()<CR>', {silent=true})
