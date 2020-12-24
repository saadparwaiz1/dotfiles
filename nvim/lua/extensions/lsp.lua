-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- lua modules {{{
-- ============================================================================
vim.cmd('packadd! nvim-lspconfig')

local lspconfig = require('lspconfig')
local completion = require('completion')
-- }}}
-- ============================================================================
-- LSP Configuration {{{
-- ============================================================================
local options = {
	noremap = true,
	silent = true,
}

local hover = "<cmd>lua vim.lsp.buf.hover()<CR>"
local fmt = "<cmd>lua vim.lsp.buf.formatting()<CR>"
local defi = "<cmd>lua vim.lsp.buf.definition()<CR>"
local refe = "<cmd>lua vim.lsp.buf.references()<CR>"
local sign = "<cmd>lua vim.lsp.buf.signature_help()<CR>"
local impli = "<cmd>lua vim.lsp.buf.implementation()<CR>"
local ndiag = "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"
local pdiag = "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"
local wrkspc = "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"
local node_modules = "/Users/saadparwaiz/Library/Application Support/nvim/bin/node_modules/.bin/"

local function get_root_dir()
	local root_dirs = {}
	local info = false
	for _, client in pairs(vim.lsp.buf_get_clients()) do
		local root_dir = client.config.root_dir
		if client.resolved_capabilities.document_formatting then
			info = true
		end
		if root_dir then
			table.insert(root_dirs, root_dir)
		end
	end
	return 'lcd ' .. root_dirs[1], info
end

local on_attach=function(client, bufnr)
	completion.on_attach(client, bufnr)

	local cmd, info = get_root_dir()

	vim.cmd(cmd)

	if info then
		vim.api.nvim_set_keymap("n", "gq", fmt, options)
	end

	vim.api.nvim_set_keymap('n', 'S', sign, options)
	vim.api.nvim_set_keymap("n", "gd", defi, options)
	vim.api.nvim_set_keymap("n", "gr", refe, options)
	vim.api.nvim_set_keymap("n", "K", hover, options)
	vim.api.nvim_set_keymap('n', 'gD', impli, options)
	vim.api.nvim_set_keymap('n', 'gW', wrkspc, options)
	vim.api.nvim_set_keymap("n", "<Left>", pdiag, options)
	vim.api.nvim_set_keymap("n", "<Right>", ndiag, options)
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

lspconfig.sumneko_lua.setup{
	cmd = {"lua-language-server"},
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = {
					'?.lua',
					'?/init.lua',
					'/opt/intel/homebrew/share/luajit-2.1.0-beta3/jit/?.lua',
					'/opt/intel/homebrew/share/nvim/runtime/lua/?.lua',
					'/opt/intel/homebrew/share/nvim/runtime/lua/vim/?.lua',
					'/opt/intel/homebrew/share/nvim/runtime/lua/vim/lsp/?.lua',
					'/opt/intel/homebrew/share/nvim/runtime/lua/vim/treesitter/?.lua',
				}
			},
			workspace = {
				['/opt/intel/homebrew/share/luajit-2.1.0-beta3'] = true
			},
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
-- }}}
-- ============================================================================
-- Diagnostic Configuration {{{
-- ============================================================================
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = {
			spacing = 5,
			prefix = ' '
		},
		signs = true,
		update_in_insert = false,
	}
)

vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{text= "✘", texthl="Debug"}
)

vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{text="", texthl="Typedef"}
)

vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{text="", texthl="WildMenu"}
)


vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{text="", texthl="WildMenu"}
)

-- }}}
-- ============================================================================
