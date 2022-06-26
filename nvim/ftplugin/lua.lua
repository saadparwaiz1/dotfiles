local lsp = require("std.lsp")
local fs = require("std.fs")

vim.lsp.start({
  cmd = { "lua-language-server" },
  name = "Lua Language Server",
  root_dir = fs.dirname(unpack(vim.fs.find({ ".git" }, {
    upward = true,
    path = fs.file_dir(),
  }))),
  single_file_support = true,
  capabilities = lsp.capabilities(),
  log_level = vim.lsp.protocol.MessageType.Warning,
  handlers = lsp.handlers(),
  settings = {
    Lua = {
      telemetry = { enable = false },
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";", true),
      },
      completion = { callSnippet = "Replace" },
      hint = { enable = true },
      workspace = {
        library = {
          "/Users/saadparwaiz/Library/State/nvim/types"
        }
      },
    },
  },
})
