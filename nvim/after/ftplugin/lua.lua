local lspconfig = require('lspconfig')
local util = require('s.util')
local luadev = require('lua-dev')

luadev = luadev.setup({
  lspconfig = {
    cmd = {"lua-langserver"},
    on_attach = util.lsp.on_attach,
    capabilities = util.lsp.capabilities
  }
})

lspconfig.sumneko_lua.setup(luadev)

vim.opt_local.formatprg = "lua-format --indent-width=2"
