local trail = require("mini.trailspace")
trail.setup({})

vim.api.nvim_create_user_command("MiniTrim", function(_)
  trail.trim()
end, {
  desc = "Removes Trailing Whitespace",
})
