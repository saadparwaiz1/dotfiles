vim.cmd('packadd! popup.nvim')
vim.cmd('packadd! plenary.nvim')
vim.cmd('packadd! telescope.nvim')
local telescope = require('telescope')

telescope.setup {
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
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

vim.api.nvim_set_keymap('n', '\\f', '<cmd>lua require("telescope.builtin").find_files(require("extensions/fuzzy"))<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '\\l', '<cmd>Telescope live_grep<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '\\o', '<cmd>lua require("telescope.builtin").oldfiles()<CR>', {silent=true})

return {
	find_command = {'fd','--type','f','--follow','-E','node_modules','-E','Pictures','-E','*[Cc]ache*','-E','*.png','-E','*.dat','-E','com.*','-E','*.jpeg','-E','*.jpg','-E','Firefox','-E','*.sqlite*','-E','zoom.us','-E','*.plist','-E','db','-E','*.db*','-E','Spotify','-E','*.JPG','-E','Safari','-E','*.archive','-E','org.*','-E','Metadata','-E','Font*','-E','*.qdat','-E','*.bf2-*','-E','*.pb','-E','*.ttf','-E','*.otf','-E','*-wal','-E','*-shm','-E','*.keychain*','-E','Containers','-E','*.data','-E','*.woff','-E','*.svg','-E','*.eot','-E','*.strings','-E','Keychains','-E','*.cdt','-E','*.pluginPayloadAttachment','-E','*.crash','-E','*.ics*','-E','*.tmp','-E','*.app','-E','Google','-E','user-data','-E','Alfred','-E','AddressBook','-E','CallHistory*','-E','IsolatedStorage','-E','Group\\ Containers','-E','*.pdf','-E','configstore','-E','iCloud','-E','*com.apple.*','-E','*com~apple*','-E','us.zoom*', '-E', '*[Cc]ookies*'}
}
