local A = vim.api

-- Pretty Print Tables
--- @vararg table
_G.dump = function(...)
  print(unpack(vim.tbl_map(vim.inspect, { ... })))
end

-- Schedule Packer Load On Event Loop
vim.schedule(function()
  require('personal.plugins')
end)

-- Create a popup window
--- @param o table
--- @param enter boolean
--- @return number
function _G.popup(o, enter)
  enter = enter or enter == nil
  local buf = A.nvim_create_buf(false, true)
  o = o or {}
  local opts = {
    row = 0,
    col = 0,
    height = 1,
    width = 30,
    style = 'minimal',
    border = 'rounded',
    relative = 'cursor',
  }
  opts = vim.tbl_extend('force', opts, o)
  return buf, A.nvim_open_win(buf, enter, opts)
end

-- Reverse key-value pairs in a table
---@param o table
---@return table
function vim.tbl_reverse(o)
  local tbl = {}
  for key, value in pairs(o) do
    tbl[value] = key
  end
  return tbl
end

local function get_highlights(ll, opts)
  local basehl = opts.contenthl or 'DiagnosticInfo'
  if ll == vim.log.levels.ERROR then
    basehl = 'DiagnosticError'
  elseif ll == vim.log.levels.WARN then
    basehl = 'DiagnosticWarn'
  elseif ll == vim.log.levels.INFO then
    basehl = 'DiagnosticInfo'
  elseif ll == vim.log.levels.DEBUG then
    basehl = 'DiagnosticInfo'
  elseif ll == vim.log.levels.TRACE then
    basehl = 'DiagnosticHint'
  end
  local winhl = string.format('Normal:%s,FloatBorder:%s', basehl, opts.borderhl or basehl)
  return winhl
end

-- Find the maximum value in table
--- @param tbl list
--- @param func function
function vim.tbl_max(tbl, func)
  local item = tbl[1]
  local max = func(tbl[1])
  for _, v in pairs(tbl) do
    local val = func(v)
    if val >= max then
      max = val
      item = v
    end
  end
  return item, max
end

-- Basic Popup Notification System
--- @param msg table|string
--- @param level number
--- @param opts table
vim.notify = function(msg, level, opts)
  if type(msg) == 'string' then
    msg = { msg }
  end
  opts = opts or {}
  local w, h = vim.lsp.util._make_floating_popup_size(msg)
  local popts = {
    width = w,
    anchor = 'SE',
    height = h,
    row = 0,
    col = vim.o.columns,
    relative = 'win',
  }
  popts = vim.tbl_extend('force', popts, opts.popts or {})
  local buf, win = popup(popts, false)
  A.nvim_buf_set_option(buf, 'modifiable', true)
  A.nvim_buf_set_lines(buf, 0, -1, false, msg)
  local timer
  timer = vim.defer_fn(function()
    if timer:is_active() then
      timer:stop()
    end
    A.nvim_win_close(win, false)
  end, opts.delay or 1000)
  local winhl = get_highlights(level, opts)
  A.nvim_win_set_option(win, 'winhl', winhl)
end

-- test if a table contains a value
--- @param tbl table
--- @param f any
vim.tbl_contains = function(tbl, f)
  for i, v in pairs(tbl) do
    if v == f then
      return i
    end
  end
  return false
end

-- Open Vim Help in a Floating Window
---@param query string
vim.help = function(query)
  local buf, _ = popup({
    height = 30,
    width = 80,
  }, true)
  A.nvim_buf_set_option(buf, 'filetype', 'help')
  A.nvim_buf_set_option(buf, 'buftype', 'help')
  A.nvim_buf_call(buf, function()
    vim.cmd('help ' .. query)
  end)
end
