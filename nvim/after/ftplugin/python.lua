local util = require('personal.util')
local lspconfig = require('lspconfig')

lspconfig.pyright.setup {
  cmd = {util.lsp.get_binary("pyright-langserver"), '--stdio'},
  on_attach = util.lsp.on_attach,
  capabilities = util.lsp.capabilities
}

lspconfig.pyright.manager.try_add_wrapper()
