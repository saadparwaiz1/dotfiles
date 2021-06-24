local lspconfig = require('lspconfig')
local util = require('s.util')

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--header-insertion=iwyu",
    "--clang-tidy"
  },
  on_attach = util.lsp.on_attach,
  capabilities = util.lsp.capabilities,
  init_options = {
    fallbackFlags = {
      '-Wall',
      '-Wextra'
    }
  }
}
