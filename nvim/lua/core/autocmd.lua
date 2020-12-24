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
-- }}}
-- ============================================================================
-- Autocmds {{{
-- ============================================================================

local autocmds_core = {
	init = {
		{"TextYankPost", "*", "silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200}"}
	},
}


if os.getenv("PLUGINS") then
	local autocmds_plugins = {
		plugins = {
			{"BufEnter", "*", "lua require('completion').on_attach()"},
		}
	}
	nvim_create_augroups(autocmds_plugins)
end

nvim_create_augroups(autocmds_core)
-- }}}
-- ============================================================================
