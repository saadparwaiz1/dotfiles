-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Global Options {{{
-- ============================================================================
vim.o.hidden = true
vim.o.backup = false
vim.o.undofile = true
vim.o.showmode = false
vim.o.lazyredraw = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.writebackup = true
vim.o.termguicolors = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.cmdheight = 2
vim.o.pumblend = 20
vim.o.history = 100
vim.o.showtabline = 2
vim.o.updatetime = 100
vim.bo.expandtab = true

vim.o.mouse = 'a'
vim.o.listchars = "tab:| ,trail:~"
vim.o.clipboard = 'unnamedplus'
vim.o.path = vim.o.path .. '**'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.completeopt = 'menuone,noselect'
vim.o.wildignore = '*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,**/node_modules'
vim.o.isfname  = vim.o.isfname .. ',32'
-- }}}
-- ============================================================================
-- buffer options {{{
-- ============================================================================

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

-- }}}
-- ============================================================================
-- window options {{{
-- ============================================================================
vim.wo.list = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.conceallevel = 1
-- }}}
-- ============================================================================
