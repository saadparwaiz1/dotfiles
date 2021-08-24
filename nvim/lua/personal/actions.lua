local M = {}
local F = vim.fn
local sign_group = 'LightBulbSign'
local sign_name = 'LightBulbSign'
local current_line = nil

F.sign_define(sign_name, { text = '💡', texthl = 'LspDiagnosticsDefaultInformation' })

local function update_sign(priority, oline, nline)
  if oline then
    F.sign_unplace(sign_group, { id = oline, buffer = '%' })
    current_line = nil
  end

  if nline and nline ~= current_line then
    F.sign_place(nline, sign_group, sign_name, '%', { lnum = nline, priority = priority })
    current_line = nline
  end
end

function M.code_actions()
  local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
  local params = vim.lsp.util.make_range_params()
  params.context = context
  vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, _, result)
    if err then
      return
    end
    if result == nil or vim.tbl_isempty(result) then
      update_sign(10, current_line, nil)
    else
      update_sign(10, current_line, params.range.start.line + 1)
    end
  end)
end

return M
