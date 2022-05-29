local f = require("std.functional")
local fs = require("std.fs")

local option = {
  list = true,
  backup = true,
  number = true,
  swapfile = true,
  undofile = true,
  showmode = false,
  expandtab = true,
  splitright = true,
  splitbelow = true,
  lazyredraw = true,
  writebackup = true,
  termguicolors = true,
  relativenumber = true,
  tabstop = 2,
  cmdheight = 1,
  history = 100,
  pumblend = 30,
  laststatus = 3,
  shiftwidth = 2,
  softtabstop = 2,
  showtabline = 2,
  updatetime = 100,
  mouse = "a",
  colorcolumn = "80",
  clipboard = "unnamedplus",
  listchars = { tab = "| ", trail = "~" },
  wildignore = {
    "*.o",
    "*~",
    "*.pyc",
    "*/.git/*",
    "*/.hg/*",
    "*/.svn/*",
    "*/.DS_store",
    "**/node_modules",
  },
  completeopt = { "menuone", "noselect" },
  backupdir = {
    fs:new(vim.loop.os_getenv("XDG_STATE_HOME"), "nvim", "backup").filename,
  },
}

f.foreach(function(k, v)
  vim.opt[k] = v
end, option)
