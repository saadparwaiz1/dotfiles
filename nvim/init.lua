-- Load Util Module
local util = require('s.util')
util.config.rocks()

-- Define Global Variables
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
  vim_markdown_strikethrough = 1,
  kommentary_create_default_mappings = false,
  gruvbox_groups = {
    'lua', 'lsp', 'rust', 'diff', 'java', 'python', 'barbar',
    'gitsigns', 'markdown', 'gitcommit', 'telescope', 'vimscript',
    'indent_blankline', 'lsp_signature'
  },
  markdown_fenced_languages = {
    'sh', 'lua', 'man', 'vim', 'java', 'rust', 'json', 'python', 'bash=sh',
    'shell=sh', 'javascript', 'console=sh', 'typescript', 'ts=typescript',
    'js=javascript'
  }
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
  conceallevel = 2,
  splitright = true,
  lazyredraw = true,
  splitbelow = true,
  writebackup = true,
  termguicolors = true,
  relativenumber = true,
  inccommand = 'nosplit',
  clipboard = 'unnamedplus',
  guifont = 'JetBrainsMono Nerd Font Mono'
}
-- Set options using vim.o
util.config.options(options)

-- Set some options using vim.opt
vim.opt.listchars = {tab = '| ', trail = '~'}
vim.opt.completeopt = {'menuone', 'noselect'}
vim.opt.wildignore = {
  '*.o', '*~', '*.pyc', '*/.git/*', '*/.hg/*', '*/.svn/*', '*/.DS_store',
  '**/node_modules'
}
vim.opt.shortmess:append('c')

-- Define Autocmds
vim.api.nvim_exec([[
  augroup autocmds_core
    autocmd!
    autocmd TextYankPost * silent! lua require('s.util').vim.hyank()
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
    lhs = '<C-l>',
    rhs = '<cmd>noh<CR>',
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
    rhs = '<cmd>Telescope find_files<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmdl',
    rhs = '<cmd>Telescope live_grep<CR>',
  },
  {
    mode = 'n',
    lhs = '\\cmdy',
    rhs = '<cmd>Telescope oldfiles<CR>',
  },
  {
    mode = 'n',
    lhs = ']q',
    rhs = '<cmd>cnext<CR>',
  },
  {
    mode = 'n',
    lhs = '[q',
    rhs = '<cmd>cprev<CR>',
  },
  {
    mode = 'n',
    lhs = '\\optcmdb',
    rhs = '<cmd>Telescope file_browser<CR>',
  },
  -- Insert Mode Mappings
  {
    mode = 'i',
    lhs = '<C-f>',
    rhs = 'compe#scroll({ "delta": +4 })',
    opts = { silent = true, noremap = true, expr = true },
  },
  {
    mode = 'i',
    lhs = '<CR>',
    rhs = 'compe#confirm("<CR>")',
    opts = { silent = true, noremap = true, expr = true },
  },
  {
    mode = 'i',
    lhs = '<C-Space>',
    rhs = 'compe#complete()',
    opts = { silent = true, noremap = true, expr = true },
  },
  {
    mode = 'i',
    lhs = '<C-d>',
    rhs = 'compe#scroll({ "delta": -4 })',
    opts = { silent = true, noremap = true, expr = true },
  },
  {
    mode = 'i',
    lhs = 'jj',
    rhs = '<Esc><cmd>noh<CR>',
  },
  {
    mode = 'i',
    lhs = '<Tab>',
    rhs = [[pumvisible() ? "\<C-n>" : "\<Tab>"]],
    opts = { silent = true, noremap = true, expr = true },
  },
  {
    mode = 'i',
    lhs = '<S-Tab>',
    rhs = [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
    opts = { silent = true, noremap = true, expr = true },
  },
  {
    mode = 'i',
    lhs = '<C-e>',
    rhs = 'compe#close("<C-e>")',
    opts = { noremap = true, silent = true, expr = true },
  },
}

util.config.maps(maps, {silent = true, noremap = true})
