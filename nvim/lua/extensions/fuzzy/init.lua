local telescope = require('telescope')
local actions = require('telescope.actions')

local chdir = function (br)
  local selected = require('telescope.actions.state').get_selected_entry(br)
  local cwd = selected.cwd
  local ordinal = selected.ordinal
  local selected_dir = SUtils.join(cwd, ordinal)
  vim.api.nvim_set_current_dir(selected_dir)
  require('telescope.actions').close(br)
end

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg', '--with-filename', '--line-number', '--column', '--smart-case'
    },
    mappings = {i = {
      ['<Esc>'] = actions.close,
      ['\\optcmdcr'] = chdir
    }},
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

local maps = {
  {
    mode = 'n',
    lhs = '\\cmdf',
    rhs = '<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>',
    opts = silent
  },
  {
    mode = 'n',
    lhs = '\\cmdl',
    rhs = '<cmd>Telescope live_grep<CR>',
    opts = silent
  },
  {
    mode = 'n',
    lhs = '\\cmdy',
    rhs = '<cmd>lua require("telescope.builtin").oldfiles()<CR>',
    opts = silent
  },
  {
    mode = 'n',
    lhs = '\\optcmdb',
    rhs ='<cmd>lua require("telescope.builtin").file_browser()<CR>',
    opts = silent
  },
  {
    mode = 'n',
    lhs ='<leader>gf',
    rhs ='<cmd>Telescope git_files<CR>',
    opts = silent
  },
  {
    mode = 'n',
    lhs = '<leader>gc',
    rhs = '<cmd>Telescope git_commits<CR>',
    opts = silent
  },
  {
    mode = 'n',
    lhs = '<leader>gb',
    rhs = '<cmd>Telescope git_branches<CR>',
    opts = silent
  },
  {
    mode = 'n',
    lhs = '<leader>gs',
    rhs = '<cmd>Telescope git_status<CR>',
    opts = silent
  },
}

SUtils.maps(maps)
