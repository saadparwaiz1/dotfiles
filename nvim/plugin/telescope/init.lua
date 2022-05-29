local builtin = require("telescope.builtin")
local f = require("std.functional")
local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = "close",
      },
    },
  },
})

local keymaps = {
  ["\\cmdf"] = builtin.find_files,
  ["\\cmdl"] = builtin.live_grep,
}

f.foreach(function(k, v)
  vim.keymap.set("n", k, v, { silent = true })
end, keymaps)
