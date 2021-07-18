local util = require('s.util')
local lspconfig = require('lspconfig')

lspconfig.pyright.setup {
  cmd = {util.npm.get_binary("pyright-langserver"), '--stdio'},
  on_attach = util.lsp.on_attach,
  capabilities = util.lsp.capabilities
}

