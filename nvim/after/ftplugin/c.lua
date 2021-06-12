local lspconfig = require('lspconfig')
local util = require('util')

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--header-insertion=iwyu",
    "--clang-tidy"
  },
  on_attach = util.on_attach,
  capabilities = util.capabilities,
  init_options = {
    fallbackFlags = {
      '-Wall',
      '-Wextra'
    }
  }
}
