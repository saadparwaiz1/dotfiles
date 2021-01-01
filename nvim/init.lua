-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Lua Modules {{{
-- ============================================================================
require('core/options')
require('core/globals')
require('core/autocmd')
require('core/statusline')
require('core/bufferline')
require('core/keybindings')

if os.getenv("PLUGINS") then
	require('extensions')
end
-- }}}
-- ============================================================================
