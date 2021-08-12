-- Define Signs For LSP
vim.fn.sign_define('LspDiagnosticsSignHint', { text = '' })
vim.fn.sign_define('LspDiagnosticsSignError', { text = '✘' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = '' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = '' })

-- Change Builtin Handlers
local with = vim.lsp.with
local handlers = vim.lsp.handlers

handlers['textDocument/publishDiagnostics'] = with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 5,
    prefix = ' '
  },
  signs = true,
  update_in_insert = false
})

handlers['textDocument/hover'] = with(handlers.hover, {
  border = 'rounded'
})

handlers['textDocument/signatureHelp'] = with(handlers.signature_help, {
  border = 'rounded'
})

-- Setup Rename Request Using Floating Windows
--- @return nil
local function rename()
  local F = vim.fn
  local A = vim.api
  local word = F.expand('<cword>')
  local params = vim.lsp.util.make_position_params()
  local __dorename = function(text)
    vim.cmd(string.format('silent! bdelete! %s', A.nvim_get_current_buf()))
    if not text or #text == 0 or word == text then
      vim.notify('No Changes')
      return
    end
    params.newName = text
    vim.lsp.buf_request(0, 'textDocument/rename', params, function (err, _, results)
      if err ~= nil then
        vim.notify(err)
        return
      end

      if not results then
        vim.notify('No Changes')
        return
      end

      vim.lsp.util.apply_workspace_edit(results)
      local total_files = vim.tbl_count(results.changes)
      local msg = string.format(
        "Changed %s file%s. To save them run ':wa'",
        total_files,
        total_files > 1 and "s" or ""
      )
      vim.notify(msg)
    end)
  end
  local buf, _ = popup()
  A.nvim_buf_set_option(buf, 'buftype', 'prompt')
  F.prompt_setcallback(buf, __dorename)
  F.prompt_setprompt(buf, ' ')
  A.nvim_buf_set_keymap(buf, 'i', '<Esc>', '<cmd>q!<CR>', {noremap=true})
  A.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<cmd>q!<CR>', {noremap=true})
  vim.cmd('startinsert')
  A.nvim_feedkeys(word, 'n', false)
end

vim.lsp.buf.rename = rename
