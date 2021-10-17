local null = require('null-ls')

local sources = {
  null.builtins.formatting.yapf,
  null.builtins.formatting.stylua,
}

null.config({ sources = sources })

require('lspconfig')['null-ls'].setup({
  on_attach = require('personal.util').lsp.on_attach,
  autostart = true,
})
