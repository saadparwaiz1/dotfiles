local lspconfig = require('lspconfig')
local util = require('util')

lspconfig.sumneko_lua.setup {
  cmd = {"lua-langserver"},
  on_attach = util.on_attach,
  capabilities = util.capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';')
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      },
      diagnostics = {globals = {'vim', 'use'}},
      telemetry = {enable = false}
    }
  }
}
