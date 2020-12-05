-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Lua Modules {{{
-- ============================================================================
require('core/options')
require('core/globals')
require('core/statusline')
require('core/keybindings')

require('extensions/plugins')
-- }}}
-- ============================================================================
-- Auto Groups {{{
-- ============================================================================
vim.api.nvim_command("augroup init")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd FileType make set ts=8 sw=8 sts=0 noet")
vim.api.nvim_command("autocmd BufEnter * lua require('completion').on_attach()")
vim.api.nvim_command("autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200}")
vim.api.nvim_command("augroup end")
-- }}}
-- ============================================================================
