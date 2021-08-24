local A = vim.api

local function goto_next_error()
  vim.lsp.diagnostic.goto_next({
    popup_opts = { border = 'rounded' }
  })
end

local function goto_prev_error()
  vim.lsp.diagnostic.goto_prev({
    popup_opts = { border = 'rounded' }
  })
end

-- Utilies for neovim
--- @class util
local M = {}


-- Wrapper over vim.g to set global variables using a table
--- @param gbl table
--- @return nil
local function globals(gbl) for k, v in pairs(gbl) do vim.g[k] = v end end

-- Wrapper over vim.o to set options using a table
--- @param opts table
--- @return nil
local function options(opts)
  for k, v in pairs(opts) do
    if type(v) == 'table' then vim.opt[k] = v else vim.o[k] = v end
  end
end


-- Supported LSP Client Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- General LSP Attach Function
--- @param client table
--- @param bufnr number
--- @return nil
local function on_attach(client, bufnr)
  local keymap = vim.keymap
  local map = A.nvim_buf_set_keymap
  local opts = {
    bufnr = bufnr,
    opts = {
      noremap = true,
      silent = true
    }
  }
  if client.config.root_dir ~= nil and client.config.root_dir ~= vim.loop.cwd() then
    A.nvim_set_current_dir(client.config.root_dir)
    vim.notify({'Changed Current Directory'}, vim.lsp.log_levels.INFO, {})
  end
  keymap.map_local('K', vim.lsp.buf.hover, opts)
  keymap.map_local('gD', vim.lsp.buf.declaration, opts)
  keymap.map_local('<leader>rn', vim.lsp.buf.rename, opts)
  keymap.map_local('gi', vim.lsp.buf.implementation, opts)
  keymap.map_local('<leader>f', vim.lsp.buf.formatting, opts)
  keymap.map_local('[e', goto_prev_error, opts)
  keymap.map_local(']e', goto_next_error, opts)
  map(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references<CR>', opts.opts)
  map(bufnr, 'n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts.opts)
  map(bufnr, 'n', 'ga', '<cmd>Telescope lsp_code_actions<CR>', opts.opts)
  map(bufnr, 'n', 'gw', '<cmd>Telescope lsp_workspace_symbols', opts.opts)
  map(bufnr, 'n', '<leader>dd',  '<cmd>Telescope lsp_document_diagnostics', opts.opts)
  map(bufnr, 'n', '<leader>wd', '<cmd>Telescope lsp_workspace_diagnostics', opts.opts)
  require('lsp_signature').on_attach({
    bind = true,
    hint_prefix = ' ',
    handler_opts = {border = 'rounded'},
    floating_window = true,
    hi_parameter = 'LspSignatureHl'
  })
  if client.resolved_capabilities.document_highlight then
    A.nvim_exec([[
      augroup lsp_document_highlights
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
  A.nvim_exec([[
    augroup lsp_document_updates
      autocmd!
      autocmd CursorHold,CursorHoldI * lua require'personal.actions'.code_actions()
    augroup END
  ]], false)
end

-- Get Binary From Various Sources
--- @param binary string
--- @return string
local function get_binary(binary)
  -- TODO add other sources?
  -- change function signature to binary, source
  -- where source can be something like luarocks, npm, cargo
  return vim.fn.stdpath('data') .. '/bin/node_modules/.bin/' .. binary
end

-- Utilies for config
---@class config
M.config = {
  options = options,
  globals = globals,
}

-- Utilies for lsp
---@class lsp
M.lsp = {
  on_attach = on_attach,
  get_binary = get_binary,
  capabilities = capabilities
}

return M
