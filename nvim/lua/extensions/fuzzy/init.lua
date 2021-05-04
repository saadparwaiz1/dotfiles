local telescope = require('telescope')
local actions = require('telescope.actions')
local map = vim.api.nvim_set_keymap

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

local silent = {silent = true}

map('n', '\\cmdf', '<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>', silent)
map('n', '\\cmdl', '<cmd>Telescope live_grep<CR>', silent)
map('n', '\\cmdy', '<cmd>lua require("telescope.builtin").oldfiles()<CR>', silent)
map('n', '\\optcmdb', '<cmd>lua require("telescope.builtin").file_browser()<CR>', silent)
map('n', '<leader>gf', '<cmd>Telescope git_files<CR>', silent)
map('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', silent)
map('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', silent)
map('n', '<leader>gs', '<cmd>Telescope git_status<CR>', silent)
