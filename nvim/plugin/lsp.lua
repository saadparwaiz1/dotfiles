-- Define Signs For LSP
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
vim.fn.sign_define('DiagnosticSignError', { text = '✘', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })

-- Change Builtin Handlers
local with = vim.lsp.with
local handlers = vim.lsp.handlers

handlers['textDocument/publishDiagnostics'] = with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 5,
    prefix = ' ',
  },
  signs = true,
  update_in_insert = false,
})

handlers['textDocument/hover'] = with(handlers.hover, {
  border = 'rounded',
})

handlers['textDocument/signatureHelp'] = with(handlers.signature_help, {
  border = 'rounded',
})

--  Use Floating Windows for getting user input
vim.ui.input = function(opts, on_confirm)
  local F = vim.fn
  local A = vim.api
  local __dorename = function(text)
    vim.cmd(string.format('silent! bdelete! %s', A.nvim_get_current_buf()))
    on_confirm(text)
  end
  local buf, _ = popup()
  A.nvim_buf_set_option(buf, 'buftype', 'prompt')
  F.prompt_setcallback(buf, __dorename)
  F.prompt_setprompt(buf, ' ')
  A.nvim_buf_set_keymap(buf, 'i', '<Esc>', '<cmd>q!<CR>', { noremap = true })
  A.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<cmd>q!<CR>', { noremap = true })
  vim.cmd('startinsert')
end
