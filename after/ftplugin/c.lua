local util = require('personal.util')
local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  on_attach = util.lsp.on_attach,
  capabilities = util.lsp.capabilities,
})

lspconfig.clangd.manager.try_add_wrapper()
