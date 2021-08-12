-- Load Util Module
local util = require('personal.util')
vim.keymap = vim.keymap or require('personal.keymap')

-- Global Variables
local globals = {
  loaded_zip = 1,
  loaded_tar = 1,
  loaded_gzip = 1,
  mapleader = ' ',
  loaded_netrw = 1,
  loaded_logiPat = 1,
  loaded_vimball = 1,
  loaded_matchit = 1,
  loaded_rrhelper = 1,
  loaded_zipPlugin = 1,
  loaded_tarPlugin = 1,
  loaded_getscript = 1,
  vim_markdown_math = 1,
  loaded_matchparen = 1,
  tex_flavor = 'latex',
  colors_name = 'gruvbox',
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
  markdown_syntax_conceal = 1,
  loaded_netrwFileHandlers = 1,
  gruvbox_groups = {
    'lsp','diff','barbar', 'gitsigns',
    'markdown', 'gitcommit', 'telescope',
    'vimscript', 'indent_blankline', 'lsp_signature'
  },
  markdown_fenced_languages = {
    'sh', 'lua', 'man', 'vim', 'java', 'rust', 'json',
    'python', 'bash=sh', 'shell=sh', 'javascript',
    'console=sh', 'typescript', 'ts=typescript', 'js=javascript'
  }
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
  hidden = true,
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
  termguicolors = true,
  relativenumber = true,
  inccommand = 'nosplit',
  clipboard = 'unnamedplus',
  listchars = {tab = '| ', trail = '~'},
  wildignore = { '*.o', '*~', '*.pyc', '*/.git/*', '*/.hg/*', '*/.svn/*', '*/.DS_store', '**/node_modules' },
  completeopt = { 'menuone', 'noselect' }
}
vim.opt.shortmess:append('c')
util.config.options(options)

-- Global Mappings
local maps = {
  {
    '\\cmdn',
    '<cmd>bn<CR>',
  },
  {
    '\\cmdp',
    '<cmd>bp<CR>',
  },
  {
    '\\cmdw',
    '<cmd>bd<CR>',
  },
  {
    '\\cmds',
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
    'vv',
    '^v$',
  },
  {
    'vv',
    '^v$',
  },
  {
    '<C-l>',
    '<cmd>noh<CR>',
  },
  {
    '\\cmd]',
    '<cmd>Neogit<CR>',
  },
  {
    '\\cmdf',
    '<cmd>Telescope find_files<CR>',
  },
  {
    '\\cmdl',
    '<cmd>Telescope live_grep<CR>',
  },
  {
    '\\cmdy',
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
    '\\optcmdb',
    '<cmd>Telescope file_browser<CR>',
  },
  {
    'J',
    'mzJ`z'
  },
  {
    '<Space>',
    '<nop>'
  },
  {
    'gc',
    '<Plug>kommentary_line_default',
    opts = {
      opts = {
        silent = true
      }
    }
  },
  {
    'gc',
    '<Plug>kommentary_visual_default<C-c>',
    opts = {
      mode = 'v',
      opts = {
        silent = true
      }
    }
  },
  {
    'jj',
    '<Esc>',
    opts = {
      mode = 'i'
    }
  },
}
vim.keymap.maps(maps, {silent=true, noremap=true})
