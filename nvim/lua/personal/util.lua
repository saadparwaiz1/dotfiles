local A = vim.api

local function goto_next_error()
  vim.lsp.diagnostic.goto_next({
    popup_opts = { border = 'rounded' },
  })
end

local function goto_prev_error()
  vim.lsp.diagnostic.goto_prev({
    popup_opts = { border = 'rounded' },
  })
end

-- Utilies for neovim
--- @class util
local M = {}

-- Wrapper over vim.g to set global variables using a table
--- @param gbl table
--- @return nil
local function globals(gbl)
  for k, v in pairs(gbl) do
    vim.g[k] = v
  end
end

-- Wrapper over vim.o to set options using a table
--- @param opts table
--- @return nil
local function options(opts)
  for k, v in pairs(opts) do
    if type(v) == 'table' then
      vim.opt[k] = v
    else
      vim.o[k] = v
    end
  end
end

-- Supported LSP Client Capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- General LSP Attach Function
--- @param client table
--- @param bufnr number
--- @return nil
local function on_attach(client, bufnr)
  local keymap = require('personal.keymap')
  local opts = {
    bufnr = bufnr,
  }
  if client.config.root_dir ~= nil and client.config.root_dir ~= vim.loop.cwd() then
    A.nvim_set_current_dir(client.config.root_dir)
    vim.notify({ 'Changed Current Directory' }, vim.lsp.log_levels.INFO, {})
  end
  keymap.map_local('K', vim.lsp.buf.hover, opts)
  keymap.map_local('gD', vim.lsp.buf.declaration, opts)
  keymap.map_local('<leader>rn', vim.lsp.buf.rename, opts)
  keymap.map_local('gi', vim.lsp.buf.implementation, opts)
  keymap.map_local('<leader>f', vim.lsp.buf.formatting, opts)
  keymap.map_local('[e', goto_prev_error, opts)
  keymap.map_local(']e', goto_next_error, opts)
  keymap.map_local('gr', '<cmd>Telescope lsp_references<CR>', opts)
  keymap.map_local('gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  keymap.map_local('ga', '<cmd>Telescope lsp_code_actions<CR>', opts)
  keymap.map_local('gw', '<cmd>Telescope lsp_workspace_symbols', opts)
  keymap.map_local('<leader>dd', '<cmd>Telescope lsp_document_diagnostics', opts)
  keymap.map_local('<leader>wd', '<cmd>Telescope lsp_workspace_diagnostics', opts)
  require('lsp_signature').on_attach({
    bind = true,
    hint_prefix = ' ',
    handler_opts = { border = 'rounded' },
    floating_window = true,
    hi_parameter = 'LspSignatureHl',
  })
  if client.resolved_capabilities.document_highlight then
    A.nvim_exec(
      [[
      augroup lsp_document_highlights
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
  A.nvim_exec(
    [[
    augroup lsp_document_updates
      autocmd!
      autocmd CursorHold,CursorHoldI * lua require'personal.actions'.code_actions()
    augroup END
  ]],
    false
  )
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
  capabilities = capabilities,
}

return M
