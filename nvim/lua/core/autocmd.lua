-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Lua Modules {{{
-- ============================================================================
local cmd = vim.cmd
-- }}}
-- ============================================================================
-- Utilities {{{
-- ============================================================================
local function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		cmd('augroup '..group_name)
		cmd('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			cmd(command)
		end
		cmd('augroup END')
	end
end

_G.nvim_create_augroups = nvim_create_augroups
-- }}}
-- ============================================================================
-- Autocmds {{{
-- ============================================================================

local autocmds_core = {
	init = {
		{"TextYankPost", "*", "silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200}"}
	},
}

nvim_create_augroups(autocmds_core)
-- }}}
-- ============================================================================
