local F = vim.fn
local uv = vim.loop

local function _schemify(scheme)
  local colorscheme = {}
  local function group_to_string(group, description)
    if description['link'] then
      local fmt = 'highlight! link %s %s'
      table.insert(colorscheme, string.format(fmt, group, description['link']))
      return
    end
    description['gui'] = description['gui'] or 'NONE'
    description['guibg'] = description['guibg'] or 'NONE'
    description['guifg'] = description['guifg'] or 'NONE'
    description['guisp'] = description['guisp'] or 'NONE'
    description['blend'] = description['blend'] or 'NONE'
    local line = 'highlight ' .. group

    for key, value in pairs(description) do
      local fmt = '%s=%s'
      if type(value) == 'table' then
        value = table.concat(value, ',')
      end
      fmt = string.format(fmt, key, value)
      line = line .. ' ' .. fmt
    end
    table.insert(colorscheme, line)
  end
  for k, v in pairs(scheme) do
    for kk, vv in pairs(v) do
      if k == 'extras' then
        table.insert(colorscheme, vv)
      else
        group_to_string(kk, vv)
      end
    end
  end
  return colorscheme
end

local function create_colors(name, scheme)
  local pth = F.stdpath('config')
  pth = pth .. '/colors/'
  uv.fs_mkdir(pth, 511, function(err, _)
    if err and not uv.fs_stat(pth) then
      vim.defer_fn(function ()
        vim.notify('Directory Cannot Be created', vim.log.levels.ERROR)
      end, 0)
      return
    end
    pth = pth .. name .. '.vim'
    uv.fs_open(pth, 'w', 438, function(err2, fd)
      if err2 and not uv.fs_stat(pth) then
        vim.defer_fn(function ()
          vim.notify('File Cannot Be Opened', vim.log.levels.ERROR)
        end, 0)
        return
      end
      local contents = _schemify(scheme)
      contents = table.concat(contents, '\n')
      uv.fs_write(fd, contents, 0, function()
        vim.defer_fn(function ()
          vim.notify('File Written', vim.log.levels.INFO)
        end, 0)
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
