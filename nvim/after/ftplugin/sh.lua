local lspconfig = require('lspconfig')
local util = require('s.util')


lspconfig.bashls.setup({
  cmd = {util.npm.get_binary("bash-language-server"), "start"},
  on_attach = util.lsp.on_attach,
  capabilities = util.lsp.capabilities
})
