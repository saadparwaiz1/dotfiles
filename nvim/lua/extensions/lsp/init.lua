-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- lua modules {{{
-- ============================================================================
local lspconfig = require('lspconfig')
-- }}}
-- ============================================================================
-- LSP Configuration {{{
-- ============================================================================
local options = {noremap = true, silent = true}

local rnm = "<cmd>lua vim.lsp.buf.rename()<CR>"
local hover = "<cmd>lua vim.lsp.buf.hover()<CR>"
local fmt = "<cmd>lua vim.lsp.buf.formatting()<CR>"
local acn = "<cmd>lua vim.lsp.buf.code_action()<CR>"
local defi = "<cmd>lua vim.lsp.buf.definition()<CR>"
local declr = "<cmd>lua vim.lsp.buf.declaration()<CR>"
local refe = "<cmd>lua vim.lsp.buf.references()<CR>"
local impli = "<cmd>lua vim.lsp.buf.implementation()<CR>"
local ndiag = "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"
local pdiag = "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"
local wrkspc = "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"
local diag = "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"
local lspsaga_find = "<cmd>Lspsaga lsp_finder<CR>"
local node_modules = vim.fn.stdpath('data') .. "/bin/node_modules/.bin/"

local on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_set_keymap("n", "gq", fmt, options)
    elseif client.resolved_capabilities.document_range_formatting then
        vim.api.nvim_set_keymap("n", "gq", fmt, options)
    end

    local dir = client.config.root_dir

    if dir then vim.cmd('lcd ' .. dir) end

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', acn, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', "gd", defi, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', "gr", refe, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', "K", hover, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', diag, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', impli, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', "gD", declr, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gW', wrkspc, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', "<Left>", pdiag, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', "<Right>", ndiag, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Space>rn', rnm, options)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', lspsaga_find, options)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            :hi link LspReferenceRead  MatchParen
            :hi link LspReferenceText  MatchParen
            :hi link LspReferenceWrite MatchParen
            augroup lsp_document_highlight
                autocmd!
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
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
        "clangd", "--background-index", "--suggest-missing-includes",
        "--header-insertion=iwyu", "--clang-tidy"
    },
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {fallbackFlags = {'-Wall', '-Wextra'}}
}

lspconfig.sumneko_lua.setup {
    cmd = {"lua-langserver"},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
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

vim.fn.sign_define("LspDiagnosticsSignError", {text = "✘", texthl = "Debug"})

vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {text = "", texthl = "Typedef"})

vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {text = "", texthl = "WildMenu"})

vim.fn
  .sign_define("LspDiagnosticsSignHint", {text = "", texthl = "WildMenu"})
-- }}}
-- ============================================================================
