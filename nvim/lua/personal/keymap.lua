-- utilties for mapping keys
--- @class keymap
local keymap = {}

local map = vim.api.nvim_set_keymap
local buf_map = vim.api.nvim_buf_set_keymap


__MapStore = __MapStore or {}

-- Store anoynmous functions for use later
keymap.store = __MapStore

-- create string for mapping and set up autocmds
---@param rhs string
---@param opts table
---@return string
local function create_mapping(rhs, opts)
  local id = keymap.create(rhs)
  local fmt_str = [[<cmd>lua require('personal.keymap')[%s]()<CR>]]
  if opts.opts.expr then
    fmt_str = [[luaeval("require('personal.keymap')[%s]()")]]
  end
  local str_rhs = string.format(fmt_str,  tostring(id))
  if opts.bufnr then
    local str_autocmd = [[autocmd BufDelete %s ++once :lua require('personal.keymap').remove(%d)]]
    str_autocmd = string.format(str_autocmd, vim.api.nvim_buf_get_name(opts.bufnr or 0), id)
    vim.api.nvim_exec(str_autocmd, false)
  end
  return str_rhs
end

-- create an entry for anoynmous function
--- @param f function
--- @return number
function keymap.create(f)
  local c = vim.tbl_contains(keymap.store, f)
  if c then return c end
  table.insert(keymap.store, f)
  return #keymap.store
end

-- remove an entry for anoynmous function
--- @param d number
--- @return number
function keymap.remove(d) keymap.store[d] = nil end

-- Map Lua Functions and Strings
--- @param lhs string
--- @param rhs function
--- @param opts table
function keymap.map(lhs, rhs, opts)
  opts = opts or {}
  opts.opts = opts.opts or {}
  opts.mode = opts.mode or 'n'
  if not vim.is_callable(rhs) then
    map(opts.mode, lhs, rhs, opts.opts)
    return
  end
  local str_rhs = create_mapping(rhs, opts)
  if type(opts.mode) == "table" then
    for _, v in pairs(opts.mode) do
      map(v, lhs, str_rhs, opts.opts)
    end
  else
    map(opts.mode, lhs, str_rhs, opts.opts)
  end
end

-- Buffer Map Lua Functions and Strings
--- @param lhs string
--- @param rhs function
--- @param opts table
function keymap.map_local(lhs, rhs, opts)
  opts = opts or {}
  opts.mode = opts.mode or 'n'
  opts.opts = opts.opts or {}
  opts.bufnr = opts.bufnr or 0
  if not vim.is_callable(rhs) then
    buf_map(opts.bufnr, opts.mode, lhs, rhs, opts.opts)
    return
  end
  local str_rhs = create_mapping(rhs, opts)
  if type(opts.mode) == "table" then
    for _, v in pairs(opts.mode) do
      buf_map(opts.bufnr, v, lhs, str_rhs, opts.opts)
    end
  else
    buf_map(opts.bufnr, opts.mode, lhs, str_rhs, opts.opts)
  end
end

-- Wrapper over neovim keymap api to set keymaps using a table
--- @param mps table
--- @param defaults table
--- @return nil
function keymap.maps(mps, defaults)
  for _, v in pairs(mps) do
    v.opts = v.opts or {}
    v.opts.opts = v.opts.opts or defaults
    keymap.map(v[1], v[2], v.opts)
  end
end


setmetatable(keymap, {
  __index = keymap.store
})

return keymap
