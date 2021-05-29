-- vim: set foldmethod=marker foldlevel=1 nomodeline:
--  --------------------------------------------------
--  Load Utils {{{
--  --------------------------------------------------
require('util')
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
  markdown_fenced_languages = {"lua", "vim", "json", "typescript", "javascript", "js=javascript", "ts=typescript", "shell=sh", "python", "sh", "bash=sh", "console=sh"},
  gruvbox_groups = {"lua", "python", "gitcommit", "diff", "markdown", "vimscript", "lsp", "gitsigns", "telescope", "indent_blankline"},
  snippets_nvim_dir = vim.fn.stdpath('config') .. '/lua/extensions/snippets/snippets'
}

SUtils.globals(globals)
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
  showmode = true,
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
  listchars= { tab = '| ', trail = '~'},
  clipboard = 'unnamedplus',
  completeopt = {'menuone', 'noselect'},
  wildignore = {'*.o','*~','*.pyc','*/.git/*','*/.hg/*','*/.svn/*','*/.DS_store','**/node_modules'},
  conceallevel = 1,
  inccommand = 'nosplit',
}
vim.opt.shortmess:append('c')
-- vim.opt.isfname:append(' ')
SUtils.options(options)
--  }}}
--  --------------------------------------------------
--  autocmds {{{
--  --------------------------------------------------
vim.api.nvim_exec([[
  augroup autocmds_core
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=150}
    autocmd FileType tex,markdown,plaintex,gitcommit setlocal spell
  augroup END
]], false)
--  }}}
--  --------------------------------------------------
--  Mappings {{{
--  --------------------------------------------------
local maps = {
  {
    mode = 'n',
    lhs = '\\cmdn',
    rhs = '<cmd>bn<CR>',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = '\\cmdp',
    rhs = '<cmd>bp<CR>',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = '\\cmdw',
    rhs = '<cmd>bd<CR>',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = '\\cmds',
    rhs = ':%s/\\<<C-R><C-w>\\>/',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = '<Left>',
    rhs = '<C-w>h',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = '<Down>',
    rhs = '<C-w>j',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = '<Up>',
    rhs = '<C-w>k',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = '<Right>',
    rhs = '<C-w>l',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = 'Q',
    rhs = '<nop>',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = 'vv',
    rhs = '^v$',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = 'vv',
    rhs = '^v$',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'n',
    lhs = '<Esc>',
    rhs = '<cmd>noh<CR><Esc>',
    opts = {silent = true, noremap = true}
  },
  {
    mode = 'i',
    lhs = 'jj',
    rhs = '<Esc><cmd>noh<CR>',
    opts = {silent = true, noremap = true}
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
    lhs = '<CR>',
    rhs = [[compe#confirm('<CR>')]],
    opts = {silent = true, noremap = true, expr = true}
  },
}
SUtils.maps(maps)
--  }}}
--  --------------------------------------------------
--  Packer/Plugins {{{
--  --------------------------------------------------
require('extensions/packer')
--  }}}
--  --------------------------------------------------
