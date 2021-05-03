local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg', '--with-filename', '--line-number', '--column', '--smart-case'
        },
        mappings = {i = {['<Esc>'] = actions.close}},
        prompt_position = 'bottom',
        prompt_prefix = '🔍',
        initial_mode = 'insert',
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        file_sorter = require'telescope.sorters'.get_fzy_sorter,
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        file_ignore_patterns = {
            "%.pdf", ".git/.*", "node_modules/.*", "__pycache__/.*", "%.swp",
						"%.db", "Caches/.*", '%.png', '%.jpg'
        },
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'},
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker
    },
		extensions = {
			fzf = {
				override_generic_sorter = false,
				override_file_sorter = true,
				case_mode = "smart_case",
			}
		}
}

require('telescope').load_extension('fzf')

local find_files = '\\cmdf'
local vim_grep = '\\cmdl'
local old_files = '\\cmdy'
local file_browser = '\\optcmdb'

if vim.fn.has('gui_vimr') == 1 then
  find_files = '<D-f>'
  vim_grep = '<D-l>'
  old_files = '<D-y>'
  file_browser = 'D-A-b'
end

vim.api.nvim_set_keymap('n', find_files,
                        '<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>',
                        {silent = true})
vim.api.nvim_set_keymap('n', vim_grep, '<cmd>Telescope live_grep<CR>',
                        {silent = true})
vim.api.nvim_set_keymap('n', old_files,
                        '<cmd>lua require("telescope.builtin").oldfiles()<CR>',
                        {silent = true})
vim.api.nvim_set_keymap('n', file_browser,
                        '<cmd>lua require("telescope.builtin").file_browser()<CR>',
                        {silent = true})

vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<CR>',
                        {silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>Telescope git_commits<CR>',
                        {silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Telescope git_branches<CR>',
                        {silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>Telescope git_status<CR>',
                        {silent = true})
