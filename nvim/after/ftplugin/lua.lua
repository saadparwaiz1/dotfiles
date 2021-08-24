local util = require('personal.util')
local luadev = require('lua-dev')
local lspconfig = require('lspconfig')

luadev = luadev.setup({
  library = {
    plugins = false,
  },
  lspconfig = {
    cmd = { 'lua-langserver' },
    on_attach = util.lsp.on_attach,
    capabilities = util.lsp.capabilities,
  },
})

lspconfig.sumneko_lua.setup(luadev)
lspconfig.sumneko_lua.manager.try_add_wrapper()
