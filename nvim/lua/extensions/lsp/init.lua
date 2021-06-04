-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- lua modules and utils {{{
-- ============================================================================
local lspconfig = require('lspconfig')
-- }}}
-- ============================================================================
-- LSP Configuration {{{
-- ============================================================================
local options = {noremap = true, silent = true}

-- Normal LSP Mappings
local rnm = "<cmd>lua vim.lsp.buf.rename()<CR>"
local hover = "<cmd>lua vim.lsp.buf.hover()<CR>"
local declr = "<cmd>lua vim.lsp.buf.declaration()<CR>"
local impli = "<cmd>lua vim.lsp.buf.implementation()<CR>"
local fmt = "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>"
local ndiag = "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts={border='single'}})<CR>"
local pdiag = "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts={border='single'}})<CR>"

-- Telescope LSP
local refe = "<cmd>lua require('telescope.builtin').lsp_references()<CR>"
local acn = "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>"
local defi = "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>"
local wrkspc = "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>"
local diag = "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>"

-- path to node_modules
local node_modules = vim.fn.stdpath('data') .. "/bin/node_modules/.bin/"

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>f", fmt, options)
  elseif client.resolved_capabilities.document_range_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>f", fmt, options)
  end
  if client.config.root_dir ~= nil then
    vim.api.nvim_set_current_dir(client.config.root_dir)
  end
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', acn, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "gd", defi, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "gr", refe, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "K", hover, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', diag, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', impli, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "gD", declr, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gw', wrkspc, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "[e", pdiag, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "]e", ndiag, options)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Space>rn', rnm, options)

  require "lsp_signature".on_attach({
    bind = true,
    hint_prefix = " ",
    handler_opts = { border = "single" },
    floating_window = true,
  })

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

local opts = {
    tools = { -- rust-tools options
        -- automatically set inlay hints (type hints)
        -- There is an issue due to which the hints are not applied on the first
        -- opened file. For now, write to the file to trigger a reapplication of
        -- the hints or just run :RustSetInlayHints.
        -- default: true
        autoSetHints = true,

        -- whether to show hover actions inside the hover window
        -- this overrides the default hover handler
        -- default: true
        hover_with_actions = true,

        runnables = {
            -- whether to use telescope for selection menu or not
            -- default: true
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        inlay_hints = {
            -- wheter to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<-",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix  = "=>",

            -- whether to align to the lenght of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,
        },

        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
              {"╭", "FloatBorder"},
              {"─", "FloatBorder"},
              {"╮", "FloatBorder"},
              {"│", "FloatBorder"},
              {"╯", "FloatBorder"},
              {"─", "FloatBorder"},
              {"╰", "FloatBorder"},
              {"│", "FloatBorder"}
            },
        }
    },

    server = {
      capabilities = capabilities,
      on_attach = on_attach
    }
}

require('rust-tools').setup(opts)
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
vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
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
