-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Utilities {{{
-- ============================================================================
local all = {noremap = true, silent = true, expr = true}
local partial = {noremap = true, silent = true}

local tab = [[pumvisible() ? "\<C-n>" : g:snippets_nvim_win ? "<cmd>lua return require'snippets'.expand_or_advance(1)<CR>" : "\<Tab>"]]
local stab = [[pumvisible() ? "\<C-p>" : g:snippets_nvim_win ? "<cmd>lua return require'snippets'.advance_snippet(-1)<CR>" : "\<S-Tab>"]]

local function map(mappings)
	for k,v in pairs(mappings) do
		vim.api.nvim_set_keymap(v[3], k, v[1], v[2])
	end
end
-- }}}
-- ============================================================================
-- Mappings {{{
-- ============================================================================
local mappings = {
	-- terminal interface mappings
	['\\n'] = { '<cmd>bn<CR>', partial, 'n'},
	['\\p'] = { '<cmd>bp<CR>', partial, 'n'},
	['\\q'] = { '<cmd>bd<CR>', partial, 'n'},

	-- tab mappings
	['<tab>'] = { [[pumvisible() ? "\<C-n>" : "\<Tab>"]], all, 'i'},
	['<S-tab>'] = { [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], all, 'i'},

	-- Ctrl Key Mappings
	['<C-h>'] = { '<C-w>h', partial, 'n'},
	['<C-j>'] = { '<C-w>j', partial, 'n'},
	['<C-k>'] = { '<C-w>k', partial, 'n'},
	['<C-l>'] = { '<C-w>l', partial, 'n'},

	-- Arrow Key Mappings
	['<Down>'] = { 'gj', partial, 'n'},
	['<Up>'] = { 'gk', partial, 'n'},

	-- Random Key Mappings
	['jj'] = { '<Esc>', partial, 'i'},
	['Q'] = { '<nop>', partial, 'n'},
	['<CR>'] = { '<cmd>nohlsearch<CR><CR>', partial, 'n'},
	['jk'] = {'<cmd>wq<CR>', partial, 'i'},
	['vv'] = {'^v$', partial, 'n'}
}

map(mappings)

if os.getenv("PLUGINS") then
	local plugins = {
		['\\f'] = { '<cmd>Files<CR>', partial, 'n'},
		['\\l'] = { '<cmd>Rg<CR>', partial, 'n'},
		['\\t'] = { '<cmd>lua Term()<CR>', partial, 'n' },
		['<c-x><c-f>'] = {"fzf#vim#complete#path('fd')", {expr=true}, 'i'},
		['<c-x><c-d>'] = {"fzf#vim#complete('cat /usr/share/dict/words')", {expr=true}, 'i'},
		['<tab>'] = { tab, all, 'i'},
		['<s-tab>'] = { stab, all, 'i'},
	}
	map(plugins)
end
-- }}}
-- ============================================================================
