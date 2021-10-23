local null = require('null-ls')

local sources = {
  null.builtins.formatting.yapf,
  null.builtins.formatting.stylua,
  null.builtins.formatting.prettier,
}

require('null-ls').setup({
  on_attach = require('personal.util').lsp.on_attach,
  sources = sources,
})
