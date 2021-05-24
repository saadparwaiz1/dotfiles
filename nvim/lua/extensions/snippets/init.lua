local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif require('snippets').has_active_snippet() then
    return t "<cmd>lua return require'snippets'.expand_or_advance(1)<CR>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif require('snippets').has_active_snippet() then
    return t "<cmd>lua return require'snippets'.advance_snippet(-1)<CR>"
  else
    return t "<S-Tab>"
  end
end

local expr = {expr = true}

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", expr)
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", expr)
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", expr)
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", expr)



local function complete_arg_list(string)
   local rest_completion = string .. '):\n    '

   for str in string.gmatch(string, "([^"..','.."]+)") do
     rest_completion = rest_completion .. "self." .. str:gsub(" ", "") .. ' = ' .. str:gsub(" ", "") .. '\n    '
   end

   return rest_completion
end

local function calc_buffer(string)
	if string == "" or string == nil then
		return "nil"
	end

	local f = loadstring("return " .. string)

	if f == nil then
		return "nil"
	end

	return tostring(f())
end

_G.calc_buffer = calc_buffer
_G.complete_arg_list = complete_arg_list
