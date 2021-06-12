vim.o.formatprg = 'shfmt'
local lspconfig = require('lspconfig')
local util = require('util')


lspconfig.bashls.setup {
  cmd = {util.npm_get_binary("bash-language-server"), "start"},
  on_attach = util.on_attach,
  capabilities = util.capabilities
}
