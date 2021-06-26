-- Load Util Module
local util = require('s.util')

-- Define Global Variables
local globals = {
  loaded_zip = 1,
  loaded_tar = 1,
  loaded_gzip = 1,
  mapleader = " ",
  loaded_netrw = 1,
  loaded_logiPat = 1,
  loaded_vimball = 1,
  loaded_matchit = 1,
  loaded_rrhelper = 1,
  loaded_zipPlugin = 1,
  loaded_tarPlugin = 1,
  loaded_getscript = 1,
  loaded_matchparen = 1,
  tex_flavour = 'latex',
  loaded_netrwPlugin = 1,
  loaded_2html_plugin = 1,
  loaded_vimballPlugin = 1,
  loaded_node_provider = 0,
  loaded_ruby_provider = 0,
  loaded_perl_provider = 0,
  loaded_netrwSettings = 1,
  loaded_python_provider = 0,
  loaded_getscriptPlugin = 1,
  markdown_syntax_conceal = 1,
  loaded_python3_provider = 0,
  loaded_netrwFileHandlers = 1,
  gruvbox_groups = {
    "lua",
    "lsp",
    "rust",
    "diff",
    "java",
    "snap",
    "python",
    "barbar",
    "gitsigns",
    "markdown",
    "gitcommit",
    "vimscript",
    "indent_blankline",
  },
  markdown_fenced_languages = {
    "sh",
    "lua",
    "vim",
    "java",
    "rust",
    "json",
    "python",
    "bash=sh",
    "shell=sh",
    "javascript",
    "console=sh",
    "typescript",
    "ts=typescript",
    "js=javascript",
  },
}
util.config.globals(globals)

-- Define Options
local options = {
  list = true,
  mouse = 'a',
  tabstop = 2,
  number = true,
  pumblend = 30,
  cmdheight = 1,
  history = 100,
  hidden = true,
  backup = false,
  shiftwidth = 2,
  softtabstop = 2,
  undofile = true,
  showtabline = 2,
  updatetime = 100,
  showmode = false,
  expandtab = true,
  conceallevel = 1,
  splitright = true,
  lazyredraw = true,
  splitbelow = true,
  writebackup = true,
  termguicolors = true,
  relativenumber = true,
  inccommand = 'nosplit',
  clipboard = 'unnamedplus',
}
-- Set options using vim.o
util.config.options(options)

-- Set some options using vim.opt
vim.opt.listchars = { tab = '| ', trail = '~'}
vim.opt.completeopt = {'menuone', 'noselect'}
vim.opt.wildignore = { '*.o','*~','*.pyc', '*/.git/*','*/.hg/*', '*/.svn/*','*/.DS_store', '**/node_modules' }
vim.opt.shortmess:append('c')

-- Define Autocmds
vim.api.nvim_exec([[
  augroup autocmds_core
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='GruvboxOrangeBold', timeout=150}
  augroup END
]], false)

-- Define Maps
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
    rhs = '<cmd>lua require("s.util").lsp.term()<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmd]',
    rhs = '<cmd>Neogit<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmdf',
    rhs = '<cmd>lua require("s.util").snaps.fd()<CR>'
  },
  {
    mode = 'n',
    lhs = '\\cmdl',
    rhs = '<cmd>lua require("s.util").snaps.rg()<CR>'
  },
  {
    mode = 'n',
    lhs = '\\cmdy',
    rhs = '<cmd>lua require("s.util").snaps.oldfiles()<CR>'
  },
  {
    mode = 'n',
    lhs = '<leader>gs',
    rhs = '<cmd>lua require("s.util").snaps.git_status()<CR>'
  },
  {
    mode = 'n',
    lhs = '<leader>gc',
    rhs = '<cmd>lua require("s.util").snaps.git_log()<CR>'
  },
  {
    mode = 'n',
    lhs = '<C-l>',
    rhs = '<cmd>cnext<CR>'
  },
  {
    mode = 'n',
    lhs = '<C-h>',
    rhs = '<cmd>cprev<CR>'
  },
  {
    mode = 'n',
    lhs = '\\optcmdb',
    rhs = '<cmd>NvimTreeToggle<CR>'
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

util.config.maps(maps, {silent = true, noremap = true})

vim.cmd('command! PackerSet :lua require("s.packer")')
