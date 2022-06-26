vim.api.nvim_create_user_command("Schemify", function(ctx)
  local module = string.format("colorschemes.%s", ctx.args)
  local colorscheme = require(module)
  require("colorschemes.schemify")(colorscheme)()
end, {
  desc = "Generate ColorSchemes",
  nargs = 1,
  complete = function()
    local Path = require("plenary.path")
    local f = require("std.functional")
    local fs = require("std.fs")
    local scan = Path:new(vim.loop.os_getenv("XDG_CONFIG_HOME"), "nvim", "lua", "colorschemes")

    local items = require("plenary.scandir").scan_dir(scan.filename, {
      hidden = false,
      depth = 1,
    })

    local composite = f.composite(fs.basename, fs.prefix)

    return f.filter(function(item)
      return item ~= "schemify"
    end, f.map(composite, items))
  end,
})

vim.api.nvim_create_user_command("NvimFormat", function(_)
  local uv = vim.loop
  local fs = require("std.fs")

  uv.spawn("stylua", {
    args = {
      "--verbose",
      "--indent-type",
      "Spaces",
      "--indent-width",
      2,
      "--column-width",
      120,
      "nvim",
    },
    stdout = function(...)
      print(vim.inspect({ ... }))
    end,
    stderr = function(...)
      print(vim.inspect({ ... }))
    end,
    cwd = fs.config.filename,
  }, function(_)
    vim.defer_fn(function()
      vim.notify("Formatted Config", vim.log.levels.INFO)
      vim.cmd("checktime")
    end, 0)
  end)
end, {
  desc = "Format All Neovim Lua Config Files",
})
