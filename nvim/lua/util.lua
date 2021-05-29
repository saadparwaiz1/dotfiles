O = vim.o
A = vim.api
F = vim.fn

-- Private API
local __t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local __check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Path Separator For Current OS
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

-- Join Paths Togeather
-- @returns string
local function join(...)
  return table.concat({...}, sep)
end

-- Create a floating terminal
-- @return nil
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

-- create snippet for python class
-- @param passed_str string
-- @return string
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

-- execute string and return it's output
-- @param s string
-- @return string
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

-- Intialise Global Variables
-- @param gbl table
-- @return nil
local function globals(gbl)
	for k,v in pairs(gbl) do
    vim.g[k] = v
  end
end

-- Intialise Options
-- @param opts table
-- @return nil
local function options(opts)
	for k,v in pairs(opts) do
    vim.opt[k] = v
  end
end

-- Create Keymaps
-- @param mps table
-- @return nil
local function maps(mps)
	for _,v in ipairs(mps) do
    A.nvim_set_keymap(v['mode'],v['lhs'],  v['rhs'], v['opts'])
  end
end

-- Use tab to:
-- move to next item in completion menuone
-- jump to next snippet\'s placeholder
-- @return nil
local function tab_complete()
  if vim.fn.pumvisible() == 1 then
    return __t "<C-n>"
  elseif require('snippets').has_active_snippet() then
    return __t "<cmd>lua return require'snippets'.expand_or_advance(1)<CR>"
  elseif __check_back_space() then
    return __t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

-- Use s-tab to:
-- move to prev item in completion menuone
-- jump to prev snippet\'s placeholder
-- @return nil
local function s_tab_complete()
  if vim.fn.pumvisible() == 1 then
    return __t "<C-p>"
  elseif require('snippets').has_active_snippet() then
    return __t "<cmd>lua return require'snippets'.advance_snippet(-1)<CR>"
  else
    return __t "<S-Tab>"
  end
end


_G.SUtils = {
  Term = float_term,
  calc_buffer = calc_buffer,
  complete_arg_list = complete_arg_list,
  sep = sep,
  join = join,
  globals = globals,
  options = options,
  maps = maps,
  tab_complete = tab_complete,
  s_tab_complete = s_tab_complete
}
