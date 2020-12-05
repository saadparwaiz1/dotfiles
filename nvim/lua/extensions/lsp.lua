-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- lua modules {{{
-- ============================================================================
vim.api.nvim_command('packadd! completion-nvim')
vim.api.nvim_command('packadd! snippets.nvim')
vim.api.nvim_command('packadd! nvim-lspconfig')

local lspconfig = require('lspconfig')
local snippets = require('snippets')
local completion = require('completion')
-- }}}
-- ============================================================================
-- LSP Configuration {{{
-- ============================================================================
local options = {noremap = true, silent = true}
local ndiag = "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"
local pdiag = "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"
local hover = "<cmd>lua vim.lsp.buf.hover()<CR>"
local fmt = "<cmd>lua vim.lsp.buf.formatting()<CR>"
local defi = "<cmd>lua vim.lsp.buf.definition()<CR>"
local refe =  "<cmd>lua vim.lsp.buf.references()<CR>"
local sign = "<cmd>lua vim.lsp.buf.signature_help()<CR>"
local impli = "<cmd>lua vim.lsp.buf.implementation()<CR>"
local wrkspc = "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"

local on_attach=function(client, bufnr)
  completion.on_attach(client, bufnr)

  vim.api.nvim_set_keymap('n', 'S', sign, options)
  vim.api.nvim_set_keymap("n", "gq", fmt, options)
  vim.api.nvim_set_keymap("n", "gd", defi, options)
  vim.api.nvim_set_keymap("n", "gr", refe, options)
  vim.api.nvim_set_keymap("n", "K", hover, options)
  vim.api.nvim_set_keymap('n', 'gD', impli, options)
  vim.api.nvim_set_keymap('n', 'gW', wrkspc, options)
  vim.api.nvim_set_keymap("n", "<Left>", pdiag, options)
  vim.api.nvim_set_keymap("n", "<Right>", ndiag, options)
end
-- }}}
-- ============================================================================
-- Diagnostic Configuration {{{
-- ============================================================================
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 5,
      prefix = ' '
    },
    signs = true,
    update_in_insert = false,
  }
)

vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {text= "✘", texthl="Debug"}
)

vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {text="", texthl="Typedef"}
)

vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {text="", texthl="WildMenu"}
)


vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {text="", texthl="WildMenu"}
)

-- }}}
-- ============================================================================
-- Snippets {{{
-- ============================================================================
 vim.g.snippets_nvim_win = false
 local indent = snippets.u.match_indentation

 snippets.set_ux(require('extensions.inserters.completion'))

 function complete_arg_list(string)
     local rest_completion = string .. '):\n    '

     for str in string.gmatch(string, "([^"..','.."]+)") do
       rest_completion = rest_completion .. "self." .. str:gsub(" ", "") .. ' = ' .. str:gsub(" ", "") .. '\n    '
     end

     return rest_completion
 end

 snippets.snippets = {
     _global = require('extensions/snippets/global'),

     c = require('extensions/snippets/c'),
     cpp = require('extensions/snippets/cpp'),
     python = require('extensions/snippets/python'),
}
-- }}}
-- ============================================================================
-- Completion Configuration  {{{
-- ============================================================================

vim.g.completion_chain_complete_list = {
    {complete_items={'lsp', 'snippet'}},
    {mode='<c-p>'},
    {mode='<c-n>'},
    {mode='file'},
}

vim.g.completion_auto_change_source = 1
vim.g.completion_enable_snippet = 'snippets.nvim'
-- }}}
-- ============================================================================
