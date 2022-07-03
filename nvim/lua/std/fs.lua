local fs = require("plenary.path")

local sub = string.sub
local function at(s, i)
  return sub(s, i, i)
end

fs.config = fs:new(vim.fn.stdpath('config'))
fs.state = fs:new(vim.fn.stdpath('state'))
fs.cache = fs:new(vim.fn.stdpath('cache'))
fs.data = fs:new(vim.fn.stdpath('data'))

-- split path into directory and base
---@param P string
---@return string, string
function fs.splitpath(P)
  local i = #P
  local ch = at(P, i)
  while i > 0 and ch ~= fs.path.sep do
    i = i - 1
    ch = at(P, i)
  end
  if i == 0 then
    return "", P
  else
    return sub(P, 1, i - 1), sub(P, i + 1)
  end
end

-- extract directory name from the path
---@param P any
---@return string|nil
function fs.dirname(P)
  if P == nil then
    return nil
  end
  local p1 = fs.splitpath(P.selfname or P)
  return type(P) ~= "string" and fs:new(p1) or p1
end

-- extract file name from the path
---@param P any
---@return string
function fs.basename(P)
  local _, p2 = fs.splitpath(P.selfname or P)
  return type(P) ~= "string" and fs:new(p2) or p2
end

-- extract prefix from the file
---@param P string
---@return string
function fs.prefix(P)
  return P:sub(0, P:find("%.") - 1)
end

-- get directory of current file
---@return string|nil
function fs.file_dir()
  return fs.dirname(vim.api.nvim_buf_get_name(0))
end

return fs
