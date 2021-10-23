local M = {}
local F = vim.fn
local A = vim.api

local sign_group = 'LightBulbSign'
local sign_name = 'LightBulbSign'

local ns = A.nvim_create_namespace('personal-lsp-actions')

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

local function update_highlight(_, oline, nline)
  if oline then
    A.nvim_buf_clear_namespace(0, ns, oline - 1, oline)
    current_line = nil
  end

  if nline and nline ~= current_line then
    A.nvim_buf_add_highlight(0, ns, 'LspDiagnosticsCodeAction', nline - 1, 0, -1)
    current_line = nline
  end
end

-- test if any client supports code actions
--- @return boolean
local function has_code_actions()
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    if client.resolved_capabilities.codeActionProvider then
      return true
    end
  end
  return false
end

function M.code_actions(highlight)
  local update = highlight and update_highlight or update_sign
  local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
  local params = vim.lsp.util.make_range_params()
  params.context = context

  if not has_code_actions() then
    return
  end

  vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, result)
    if err then
      return
    end
    if result == nil or vim.tbl_isempty(result) then
      update(10, current_line)
    else
      update(10, current_line, params.range.start.line + 1)
    end
  end)
end

return M
