-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Mappings {{{
-- ============================================================================
local function map(mappings)
	for k,v in pairs(mappings) do
		vim.api.nvim_set_keymap(v[3], k, v[1], v[2])
	end
end

local all = {noremap = true, silent = true, expr = true}
local wiki = '<cmd>lcd ~/Library/Projects/notes | edit ~/Library/Projects/notes/index.md<CR>'
local partial = {noremap = true, silent = true}

local mappings = {
	-- terminal interface mappings
	['\\n'] = { '<cmd>bn<CR>', partial, 'n'},
	['\\p'] = { '<cmd>bp<CR>', partial, 'n'},
	['\\q'] = { '<cmd>bd<CR>', partial, 'n'},
	['\\w'] = {wiki, partial, 'n'},
	['\\s'] = {'<cmd>w<CR>', partial, 'n'},

	-- tab mappings
	['<tab>'] = { [[pumvisible() ? "\<C-n>" : "\<Tab>"]], all, 'i'},
	['<S-tab>'] = { [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], all, 'i'},

	-- Ctrl Key Mappings
	['<C-h>'] = { '<C-w>h', partial, 'n'},
	['<C-j>'] = { '<C-w>j', partial, 'n'},
	['<C-k>'] = { '<C-w>k', partial, 'n'},
	['<C-l>'] = { '<C-w>l', partial, 'n'},

	-- Arrow Key Mappings
	['<Up>'] = { 'gk', partial, 'n'},
	['<Down>'] = { 'gj', partial, 'n'},

	-- Leader Key Mappings
	['<leader>gf'] = {'0f(<cmd>e <cfile><cr>', partial, 'n'},

	-- Random Key Mappings
	['Q'] = { '<nop>', partial, 'n'},
	['vv'] = {'^v$', partial, 'n'},
	['jj'] = { '<Esc>', partial, 'i'},
	['jk'] = {'<cmd>wq<CR>', partial, 'i'},
}

map(mappings)
-- }}}
-- ============================================================================
