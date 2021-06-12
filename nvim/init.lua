-- vim: set foldmethod=marker foldlevel=1 nomodeline:
--  --------------------------------------------------
--  Load Util {{{
--  --------------------------------------------------
local util = require('util')
--  }}}
-- ---------------------------------------------------
--  global options {{{
--  --------------------------------------------------
local globals = {
  mapleader = " ",
  loaded_tar = 1,
  loaded_zip = 1,
  loaded_gzip = 1,
  loaded_netrw = 1,
  loaded_logiPat = 1,
  loaded_matchit = 1,
  loaded_vimball = 1,
  loaded_rrhelper = 1,
  loaded_getscript = 1,
  loaded_tarPlugin = 1,
  loaded_zipPlugin = 1,
  loaded_netrwPlugin = 1,
  loaded_2html_plugin = 1,
  loaded_netrwSettings = 1,
  loaded_vimballPlugin = 1,
  loaded_getscriptPlugin = 1,
  loaded_netrwFileHandlers = 1,
  loaded_ruby_provider = 0,
  loaded_perl_provider = 0,
  loaded_node_provider = 0,
  loaded_python_provider = 0,
  loaded_python3_provider = 0,
  markdown_syntax_conceal = 1,
  markdown_fenced_languages = {"lua", "vim", "json", "rust", "typescript", "javascript", "js=javascript", "ts=typescript", "shell=sh", "python", "sh", "bash=sh", "console=sh"},
  gruvbox_groups = {"lua", "python", "rust", "gitcommit", "diff", "markdown", "vimscript", "lsp", "gitsigns", "telescope", "indent_blankline"},
  snippets_nvim_dir = util.join(vim.fn.stdpath('config'), 'lua', 'extensions', 'snippets')
}
util.globals(globals)
--  }}}
--  --------------------------------------------------
--  vim options {{{
--  --------------------------------------------------
local options = {
  list = true,
  hidden = true,
  number = true,
  backup = false,
  undofile = true,
  showmode = false,
  lazyredraw = true,
  splitbelow = true,
  splitright = true,
  writebackup = true,
  termguicolors = true,
  relativenumber = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  cmdheight = 1,
  pumblend = 30,
  history = 100,
  showtabline = 2,
  updatetime = 100,
  expandtab = true,
  mouse = 'a',
  clipboard = 'unnamedplus',
  conceallevel = 1,
  inccommand = 'nosplit',
}
-- Set options using vim.o
util.options(options)

-- Set some options using vim.opt
vim.opt.listchars= { tab = '| ', trail = '~'}
vim.opt.completeopt = {'menuone', 'noselect'}
vim.opt.wildignore = {'*.o','*~','*.pyc','*/.git/*','*/.hg/*','*/.svn/*','*/.DS_store','**/node_modules'}
vim.opt.shortmess:append('c')
--  }}}
--  --------------------------------------------------
--  autocmds {{{
--  --------------------------------------------------
vim.api.nvim_exec([[
  augroup autocmds_core
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='GruvboxOrangeBold', timeout=150}
    autocmd FileType tex,markdown,plaintex,gitcommit setlocal spell
  augroup END
]], false)
--  }}}
--  --------------------------------------------------
--  Mappings {{{
--  --------------------------------------------------
local maps = {
  -- Normal Mode Mappings
  {
    mode = 'n',
    lhs = '\\cmdn',
    rhs = '<cmd>bn<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmdp',
    rhs = '<cmd>bp<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmdw',
    rhs = '<cmd>bd<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmds',
    rhs = ':%s/\\<<C-R><C-w>\\>/',
  },
  {
    mode = 'n',
    lhs = '<Left>',
    rhs = '<C-w>h',
  },
  {
    mode = 'n',
    lhs = '<Down>',
    rhs = '<C-w>j',
  },
  {
    mode = 'n',
    lhs = '<Up>',
    rhs = '<C-w>k',
  },
  {
    mode = 'n',
    lhs = '<Right>',
    rhs = '<C-w>l',
  },
  {
    mode = 'n',
    lhs = 'Q',
    rhs = '<nop>',
  },
  {
    mode = 'n',
    lhs = 'vv',
    rhs = '^v$',
  },
  {
    mode = 'n',
    lhs = 'vv',
    rhs = '^v$',
  },
  {
    mode = 'n',
    lhs = '<Esc>',
    rhs = '<cmd>noh<CR><Esc>',
  },
  {
    mode = 'n',
    lhs = '\\cmd;',
    rhs = '<cmd>lua require("util").Term()<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmd]',
    rhs = '<cmd>Neogit<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmdf',
    rhs = '<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmdl',
    rhs = '<cmd>lua require("telescope.builtin").live_grep()<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmdy',
    rhs = '<cmd>lua require("telescope.builtin").oldfiles()<CR>',
  },
  {
    mode = 'n',
    lhs = '\\optcmdb',
    rhs ='<cmd>lua require("telescope.builtin").file_browser()<CR>',
  },
  {
    mode = 'n',
    lhs ='<leader>gf',
    rhs ='<cmd>lua require("telescope.builtin").git_status()<CR>',
  },
  {
    mode = 'n',
    lhs = '<leader>gc',
    rhs = '<cmd>lua require("telescope.builtin").git_commits()<CR>',
  },
  {
    mode = 'n',
    lhs = '<leader>gb',
    rhs = '<cmd>lua require("telescope.builtin").git_branches()<CR>',
  },
  {
    mode = 'n',
    lhs = '<leader>gs',
    rhs = '<cmd>lua require("telescope.builtin").git_status()<CR>',
  },
  -- Insert Mode Mappings
  {
    mode = 'i',
    lhs = 'jj',
    rhs = '<Esc><cmd>noh<CR>',
  },
  {
    mode = 'i',
    lhs = '<Tab>',
    rhs = [[pumvisible() ? "\<C-n>" : "\<Tab>"]],
    opts = {silent = true, noremap = true, expr = true}
  },
  {
    mode = 'i',
    lhs = '<S-Tab>',
    rhs = [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
    opts = {silent = true, noremap = true, expr = true}
  },
  {
    mode = 'i',
    lhs = '<C-e>',
    rhs = 'compe#close("<C-e>")',
    opts = {noremap = true, silent = true, expr = true}
  },
}
util.maps(maps, {silent = true, noremap = true})
--  }}}
--  --------------------------------------------------
