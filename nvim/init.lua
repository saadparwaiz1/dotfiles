-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Lua Modules {{{
-- ============================================================================
require('core/options')
require('core/globals')
require('core/autocmd')
require('core/keybindings')

if os.getenv("PLUGINS") then
	require('extensions/plugins')
	require('extensions/statusline')
else
	require('core/statusline')
end
-- }}}
-- ============================================================================
