-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- lua modules and utils {{{
-- ============================================================================
local lspconfig = require('lspconfig')

function SetRoot()
    if vim.b.lsp_client_name ~= 'texlab' and vim.b.lsp_root_dir ~= nil then
    	vim.cmd('lcd ' .. vim.b.lsp_root_dir)
      return
    end
    local util = require('lspconfig.util')
    local dir = util.find_git_ancestor(vim.fn.expand('%:p'))
    if dir ~= nil then
      vim.cmd('lcd ' .. dir)
    end
end
-- }}}
-- ============================================================================
-- LSP Configuration {{{
-- ============================================================================
local options = {noremap = true, silent = true}

local rnm = "<cmd>lua vim.lsp.buf.rename()<CR>"
local hover = "<cmd>lua vim.lsp.buf.hover()<CR>"
local fmt = "<cmd>lua vim.lsp.buf.formatting()<CR>"
local acn = "<cmd>Telescope lsp_code_actions<CR>"
local defi = "<cmd>Telescope lsp_definitions<CR>"
local declr = "<cmd>lua vim.lsp.buf.declaration()<CR>"
local refe = "<cmd>Telescope lsp_references<CR>"
local impli = "<cmd>lua vim.lsp.buf.implementation()<CR>"
local ndiag = "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"
local pdiag = "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"
local wrkspc = "<cmd>Telescope lsp_workspace_symbols<CR>"
local diag = "<cmd>Telescope lsp_workspace_diagnostics<CR>"
local node_modules = vim.fn.stdpath('data') .. "/bin/node_modules/.bin/"

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_set_keymap("n", "gq", fmt, options)
  elseif client.resolved_capabilities.document_range_formatting then
    vim.api.nvim_set_keymap("n", "gq", fmt, options)
  end
  vim.b.lsp_root_dir = client.config.root_dir
  vim.b.lsp_client_name = client.config.name
  vim.defer_fn(SetRoot, 1000)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', acn, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "gd", defi, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "gr", refe, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "K", hover, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', diag, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', impli, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "gD", declr, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gW', wrkspc, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "[e", pdiag, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "]e", ndiag, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Space>rn', rnm, options)

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
      augroup END
    ]], false)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.pyright.setup {
  cmd = {node_modules .. "pyright-langserver", '--stdio'},
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.bashls.setup {
  cmd = {node_modules .. "bash-language-server", "start"},
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--header-insertion=iwyu",
    "--clang-tidy"
  },
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    fallbackFlags = {
      '-Wall',
      '-Wextra'
    }
  }
}

lspconfig.sumneko_lua.setup {
  cmd = {"lua-langserver"},
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';')
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      },
      diagnostics = {globals = {'vim', 'use'}},
      telemetry = {enable = false}
    }
  }
}

lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    latex = {
      forwardSearch = {
        args = {"%l", "%p", "%f"},
        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
        onSave = false,
      },
      build = {
        args = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-shell-escape",
          "-pvc",
          "%f"
        },
        executable = "latexmk";
        onSave = false;
      },
    }
  }
}
-- }}}
-- ============================================================================
-- Diagnostic Configuration {{{
-- ============================================================================
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {spacing = 5, prefix = ' '},
    signs = true,
    update_in_insert = false
  })

vim.fn.sign_define("LspDiagnosticsSignError", {text = "✘"})

vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})

vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})

vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})
-- }}}
-- ============================================================================
-- Hover/Signature Configuration {{{
-- ============================================================================
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single"
  })

vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single"
  })
-- }}}
-- ============================================================================
