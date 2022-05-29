local fs = require("plenary.path")

function fs.__dirname(file)
  return file:sub(0, file:match("^.*()/") - 1)
end

function fs.__basename(file)
  return file:sub(file:match("^.*()/") + 1)
end

function fs.__prefix(file)
  return file:sub(0, file:find("%.") - 1)
end

function fs.__suffix(file)
  return file:sub(file:find("%.") + 1)
end

function fs.__suffixes(file)
  return vim.gsplit(fs.__suffix(file), ".", true)
end

function fs.dirname(self)
  if type(self) == "string" then
    return fs.__dirname(self)
  end
  return fs:new(fs.__dirname(self.filename))
end

function fs.basename(self)
  if type(self) == "string" then
    return fs.__basename(self)
  end
  return fs:new(fs.__basename(self.filename))
end

function fs.prefix(self)
  if type(self) == "string" then
    return fs.__prefix(self)
  end
  return fs:new(fs.__prefix(self.filename))
end

function fs.suffix(self)
  if type(self) == "string" then
    return fs.__suffix(self)
  end
  return fs:new(fs.__suffix(self.filename))
end

function fs.suffixes(self)
  if type(self) == "string" then
    local suffixes = fs.__suffixes(self)
  else
    local suffixes = fs.__suffixes(self.filename)
  end
  return function()
    local suffix = suffixes()
    if suffix then
      return suffix
    end
  end
end

fs.config = fs:new(vim.loop.os_getenv("XDG_CONFIG_HOME") or "~/.config")
fs.state = fs:new(vim.loop.os_getenv("XDG_STATE_HOME") or "~/.local/state")
fs.cache = fs:new(vim.loop.os_getenv("XDG_CACHE_HOME") or "~/.cache")
fs.data = fs:new(vim.loop.os_getenv("XDG_DATA_HOME") or "~/.local/share")

return fs
