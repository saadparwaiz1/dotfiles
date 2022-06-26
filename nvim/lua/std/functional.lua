local f = require("plenary.functional")

function f.foreach(func, t)
  for k, v in pairs(t) do
    func(k, v)
  end
end

function f.map(fun, t)
  if vim.tbl_islist(t) then
    return vim.tbl_map(fun, t)
  end
  local nt = {}
  for k, v in pairs(t) do
    local nk, nv = unpack(fun(k, v))
    nt[nk] = nv
  end
  return nt
end

function f.composite(...)
  local fnchain = { ... }
  local function recurse(i, ...)
    if i == #fnchain then
      return fnchain[i](...)
    end
    return recurse(i + 1, fnchain[i](...))
  end
  return function(...)
    return recurse(1, ...)
  end
end

function f.flat_map(fun, tbl)
  f.flatten(f.map(fun, tbl))
end

f.filter = vim.tbl_filter
f.flatten = vim.tbl_flatten

return f
