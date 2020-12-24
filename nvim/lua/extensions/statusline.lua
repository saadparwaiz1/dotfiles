-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Status Line {{{
-- ============================================================================
vim.cmd("packadd bubbly.nvim")
vim.g.bubbly_palette = {
	background = "#34343c",
	foreground = "#282828",
	black = "#3e4249",
	red = "#ec7279",
	green = "#a0c980",
	yellow = "#deb974",
	blue = "#6cb6eb",
	purple = "#d38aea",
	cyan = "#5dbbc1",
	white = "#c5cdd9",
	lightgrey = "#57595e",
	darkgrey = "#404247",
}
_G.bufferline = require('extensions/bufferline')
vim.cmd("set tabline=%!v:lua.bufferline()")
-- }}}
-- ============================================================================
