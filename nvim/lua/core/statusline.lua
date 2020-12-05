-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
--  Utilities {{{
-- ============================================================================
local function line(fmt)
  vim.o.statusline = vim.o.statusline .. fmt
end
-- }}}
-- ============================================================================
--  Status Line {{{
-- ============================================================================
vim.o.statusline = ''

line("%#Mode# %{GetMode()}")
line(" %#seperator#")
line("%#SubStatusLine#  %t  ﬘")
line("%#SubSeperator#")
line("%#StatusLine#%=")
line("%y    %#SubSeperator#")
line("%#SubStatusLine#  %{strftime('%T')}")
line("  %#Seperator#")
line("%#InfoMode#  %p%%")
line("  ☰  %l/%L    ")
-- }}}
-- ============================================================================
