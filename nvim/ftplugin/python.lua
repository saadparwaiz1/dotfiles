local lsp = require("std.lsp")
local fs = require("std.fs")

vim.api.nvim_create_user_command("OrganiseImports", function()
  vim.lsp.buf.execute_command({
    command = 'pyright.organizeimports',
    arguments = { vim.uri_from_bufnr(0) }
  })
end, {})


vim.lsp.start({
  cmd = { "pyright-langserver", "--stdio" },
  name = "Pyright Language Server For Python",
  root_dir = fs.dirname(unpack(vim.fs.find({
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    ".git"
  }, {
    upward = true,
    path = fs.file_dir(),
  }))),
  single_file_support = true,
  capabilities = lsp.capabilities(),
  log_level = vim.lsp.protocol.MessageType.Warning,
  handlers = lsp.handlers(),
  settings = {
    python = {
      autoSearchPaths = true,
      useLibraryCodeForTypes = true,
      diagnosticMode = 'workspace',
    }
  },
})
