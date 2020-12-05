-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Lua Modules {{{
-- ============================================================================
local api = vim.api
-- }}}
-- ============================================================================
-- Utilities {{{
-- ============================================================================
local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end
-- }}}
-- ============================================================================
-- Autocmds {{{
-- ============================================================================

local autocmds_lsp = {
  init = {
    {"BufEnter", "*", "lua require('completion').on_attach()"},
    {"TextYankPost", "*", "silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200}"}
  }
}

nvim_create_augroups(autocmds_lsp)
-- }}}
-- ============================================================================
