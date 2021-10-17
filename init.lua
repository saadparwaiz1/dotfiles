-- Improve Performance
require('impatient')

local util = require('personal.util')
local keymap = require('personal.keymap')

vim.loop.os_setenv('MACOSX_DEPLOYMENT_TARGET', '10.15')

-- Global Variables
local globals = {
  mapleader = ' ',
  loaded_zip = 1,
  loaded_tar = 1,
  loaded_gzip = 1,
  loaded_netrw = 1,
  loaded_logiPat = 1,
  loaded_vimball = 1,
  loaded_matchit = 1,
  loaded_rrhelper = 1,
  loaded_zipPlugin = 1,
  loaded_tarPlugin = 1,
  loaded_getscript = 1,
  loaded_matchparen = 1,
  loaded_netrwPlugin = 1,
  loaded_2html_plugin = 1,
  loaded_node_provider = 0,
  loaded_perl_provider = 0,
  loaded_vimballPlugin = 1,
  loaded_netrwSettings = 1,
  loaded_ruby_provider = 0,
  loaded_python_provider = 0,
  loaded_getscriptPlugin = 1,
  loaded_python3_provider = 0,
  loaded_netrwFileHandlers = 1,
  tex_flavor = 'latex',
  markdown_fenced_languages = {
    'sh',
    'lua',
    'man',
    'vim',
    'java',
    'rust',
    'json',
    'scala',
    'python',
    'bash=sh',
    'shell=sh',
    'javascript',
    'console=sh',
    'typescript',
    'ts=typescript',
    'js=javascript',
  },
}
util.config.globals(globals)

-- Globals Options
local options = {
  list = true,
  mouse = 'a',
  tabstop = 2,
  number = true,
  pumblend = 30,
  cmdheight = 1,
  history = 100,
  backup = false,
  shiftwidth = 2,
  softtabstop = 2,
  undofile = true,
  showtabline = 2,
  updatetime = 100,
  showmode = false,
  expandtab = true,
  conceallevel = 2,
  splitright = true,
  lazyredraw = true,
  splitbelow = true,
  writebackup = true,
  inccommand = 'split',
  termguicolors = true,
  relativenumber = true,
  clipboard = 'unnamedplus',
  listchars = { tab = '| ', trail = '~' },
  wildignore = { '*.o', '*~', '*.pyc', '*/.git/*', '*/.hg/*', '*/.svn/*', '*/.DS_store', '**/node_modules' },
  completeopt = { 'menuone', 'noselect' },
}

vim.opt.complete:remove('i'):remove('t')
vim.opt.shortmess:append('c')

util.config.options(options)

-- Global Mappings
local maps = {
  {
    '<A-n>',
    '<cmd>bn<CR>',
  },
  {
    '<A-p>',
    '<cmd>bp<CR>',
  },
  {
    '<A-w>',
    '<cmd>bd<CR>',
  },
  {
    '<A-s>',
    ':%s/\\<<C-R><C-w>\\>/',
  },
  {
    '<Left>',
    '<C-w>h',
  },
  {
    '<Down>',
    '<C-w>j',
  },
  {
    '<Up>',
    '<C-w>k',
  },
  {
    '<Right>',
    '<C-w>l',
  },
  {
    'Q',
    '<nop>',
  },
  {
    '<A-]>',
    '<cmd>Neogit<CR>',
  },
  {
    '<A-f>',
    '<cmd>Telescope find_files<CR>',
  },
  {
    '<A-l>',
    '<cmd>Telescope live_grep<CR>',
  },
  {
    '<A-y>',
    '<cmd>Telescope oldfiles<CR>',
  },
  {
    ']q',
    '<cmd>cnext<CR>',
  },
  {
    '[q',
    '<cmd>cprev<CR>',
  },
  {
    'J',
    'mzJ`z',
  },
  {
    '<Space>',
    '<nop>',
  },
  {
    'gc',
    '<Plug>kommentary_line_default',
  },
  {
    '<',
    '<gv',
    mode = 'x'
  },
  {
    '>',
    '>gv',
    mode = 'x'
  },
  {
    'gc',
    '<Plug>kommentary_visual_default<C-c>',
    mode = 'v',
  },
  {
    'jj',
    '<Esc>',
    mode = 'i',
  },
}

keymap.maps(maps)
