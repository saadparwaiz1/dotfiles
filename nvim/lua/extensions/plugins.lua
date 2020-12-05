-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Optional Packages {{{
-- ============================================================================
vim.api.nvim_command('packadd! fzf.vim')
vim.api.nvim_command('packadd! vim-commentary')
vim.api.nvim_command('packadd! nvim-treesitter')
vim.api.nvim_command('packadd! auto-pairs')
-- }}}
-- ============================================================================
-- Import Moduless {{{
-- ============================================================================
local treesitter = require('nvim-treesitter.configs')
-- }}}
-- ============================================================================
-- Tree Sitter Configuration {{{
-- ============================================================================
treesitter.setup {
 ensure_installed = {
      'python',
      'lua',
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}

vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
-- }}}
-- ============================================================================
