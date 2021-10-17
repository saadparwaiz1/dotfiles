local util = require('personal.util')
local lspconfig = require('lspconfig')

lspconfig.texlab.setup({
  on_attach = util.lsp.on_attach,
  capabilities = util.lsp.capabilities,
  texlab = {
    latexFormatter = 'latexindent',
    latexindent = {
      ['local'] = nil,
      modifyLineBreaks = false,
    },
  },
  settings = {
    latex = {
      forwardSearch = {
        args = { '%l', '%p', '%f' },
        executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
        onSave = false,
      },
      build = {
        args = {
          '-pdf',
          '-interaction=nonstopmode',
          '-synctex=1',
          '-shell-escape',
          '-pvc',
          '%f',
        },
        executable = 'latexmk',
        onSave = false,
      },
    },
  },
})
lspconfig.texlab.manager.try_add_wrapper()
