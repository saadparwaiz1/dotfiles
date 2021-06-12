vim.o.formatprg='black\\ --quiet\\ -'
local util = require('util')
local lspconfig = require('lspconfig')

lspconfig.pyright.setup {
  cmd = {util.npm_get_binary("pyright-langserver"), '--stdio'},
  on_attach = util.on_attach,
  capabilities = util.capabilities
}

