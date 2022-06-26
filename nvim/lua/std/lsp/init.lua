-- Lsp Utils
local lsp = {}

-- Generate Updated Lsp Capabilities
---@param ctx table
---@return table
lsp.capabilities = function(ctx)
  ctx = ctx or vim.lsp.protocol.make_client_capabilities()
  require("cmp_nvim_lsp").update_capabilities(ctx)
end

-- Generates Custom Lsp handlers
---@param ctx table
---@return table
lsp.handlers = function(ctx)
  ctx = ctx or {}
  local with = vim.lsp.with
  local handlers = vim.lsp.handlers
  local border = ctx.border or "rounded"
  local handles = {
    ["textDocument/hover"] = with(handlers.hover, {
      border = border
    }),
    ["textDocument/signatureHelp"] = with(handlers.signature_help, {
      border = border
    }),
  }
  return vim.tbl_extend("force", handles, ctx.handlers or {})
end

return lsp
