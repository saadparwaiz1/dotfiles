O = vim.o
A = vim.api
F = vim.fn

local sep = (function()
  if jit then
    local os = string.lower(jit.os)
    if os == 'linux' or os == 'osx' or os == 'bsd' then
      return '/'
    else
      return '\\'
    end
  else
    return package.config:sub(1, 1)
  end
end)()

-- @param prefix string
-- @param suffix string
-- @return string
local function join(prefix, suffix)
  return prefix .. sep .. suffix
end


local function float_term()
    local height = math.floor((O.lines - 2) * 0.6)
    local row = math.floor((O.lines - height) / 2)
    local width = math.floor(O.columns * 0.6)
    local col = math.floor((O.columns - width) / 2)

    local opts = {
      relative = 'editor',
      row = row,
      col = col,
      width = width,
      height = height,
      style = 'minimal',
      border = 'single'
    }

    local buf = A.nvim_create_buf(false, true)
    local win = A.nvim_open_win(buf, true, opts)
    A.nvim_command('startinsert')
    F.termopen(os.getenv('SHELL'))
    A.nvim_buf_set_keymap(buf, 't', '<Esc>', '<C-\\><C-n>', {silent=true})
    local fmt = 'autocmd TermClose * ++once :lua vim.api.nvim_win_close(%d, true)'
    A.nvim_command(string.format(fmt, win))
end

-- @param passed_str string
local function complete_arg_list(passed_str)
  local counter = 0
  local tab_width = vim.bo.sw
  local rest_completion = passed_str .. '):\n' .. string.rep(' ', 2*tab_width)
  for str in string.gmatch(passed_str, "([^"..','.."]+)") do
    counter = counter + 1
    rest_completion = rest_completion .. "self." .. str:gsub(" ", "") .. ' = ' .. str:gsub(" ", "") .. '\n' .. string.rep(' ', 2*tab_width)
  end
  if counter == 0 then
    return passed_str .. '):\n' .. string.rep(' ', 2*tab_width) .. 'pass'
  end
  return rest_completion:sub(1, -(2*tab_width + 2))
end

-- @param s string
local function calc_buffer(s)
  if s == "" or s == nil then
    return "nil"
  end

  local f = loadstring("return " .. s)

  if f == nil then
    return "nil"
  end

  return tostring(f())
end

local function globals(gbl)
	for k,v in pairs(gbl) do
    vim.g[k] = v
  end
end

local function options(opts)
	for k,v in pairs(opts) do
    vim.opt[k] = v
  end
end

local function maps(mps)
	for _,v in ipairs(mps) do
    A.nvim_set_keymap(v['mode'],v['lhs'],  v['rhs'], v['opts'])
  end
end

_G.SUtils = {}
_G.SUtils.Term = float_term
_G.SUtils.calc_buffer = calc_buffer
_G.SUtils.complete_arg_list = complete_arg_list
_G.SUtils.sep = sep
_G.SUtils.join = join
_G.SUtils.globals = globals
_G.SUtils.options = options
_G.SUtils.maps = maps

A.nvim_set_keymap('n', '\\cmd;', '<cmd>lua SUtils.Term()<CR>', {silent=true})

