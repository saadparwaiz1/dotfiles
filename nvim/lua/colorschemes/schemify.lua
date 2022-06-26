local fs = require("std.fs")
local uv = vim.loop

local function _schemify(scheme)
  vim.pretty_print(scheme)
  local colorscheme = {
    "vim.cmd('syntax clear')",
  }
  local link = "vim.api.nvim_set_hl(0, '%s', {link='%s'})"
  local highlight = "vim.api.nvim_set_hl(0, '%s', %s)"

  local function stringify(value)
    return vim.inspect(value):gsub("[\n\r\t ]", "")
  end

  if scheme.extras then
    table.insert(colorscheme, scheme.extras)
    scheme.extras = nil
  end

  for _, highlights in pairs(scheme) do
    for name, value in pairs(highlights) do
      local hl
      if value.link then
        hl = string.format(link, name, value.link)
      else
        hl = string.format(highlight, name, stringify(value))
      end
      table.insert(colorscheme, hl)
    end
  end

  return colorscheme
end

local function create_colors(name, scheme)
  local pth = fs.config
  pth = fs.config / "nvim" / "colors"
  uv.fs_mkdir(pth.filename, 511, function(err, _)
    if err and not pth:exists() then
      vim.defer_fn(function()
        vim.notify("Directory Cannot Be created", vim.log.levels.ERROR)
      end, 0)
      return
    end
    pth = pth / (name .. ".lua")
    uv.fs_open(pth.filename, "w", 438, function(err2, fd)
      if err2 and not pth:exists() then
        vim.defer_fn(function()
          vim.notify("File Cannot Be Opened", vim.log.levels.ERROR)
        end, 0)
        return
      end
      local contents = _schemify(scheme)
      contents = table.concat(contents, "\n")
      uv.fs_write(fd, contents, 0, function()
        vim.loop.spawn("stylua", {
          args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            2,
            "--column-width",
            80,
            pth.filename,
          },
          stdout = function(...)
            vim.notify(vim.inspect({ ... }), vim.log.levels.INFO)
          end,
          stderr = function(...)
            vim.notify(vim.inspect({ ... }), vim.log.levels.ERROR)
          end,
        }, function(_)
          vim.defer_fn(function()
            vim.notify("New Colorscheme Created", vim.log.levels.INFO)
          end, 0)
        end)
        uv.fs_close(fd)
      end)
    end)
  end)
end

-- Generates Function To Generate Theme
---@param scheme table
---@return function
local function schemify(scheme)
  local name = scheme.__name
  scheme.__name = nil
  return function()
    create_colors(name, scheme)
  end
end

return schemify
