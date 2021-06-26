local O = vim.o
local A = vim.api
local F = vim.fn

-- Private API Variables

local __options = {noremap = true, silent = true}
local __hover = "<cmd>lua vim.lsp.buf.hover()<CR>"
local __fmt = "<cmd>lua vim.lsp.buf.formatting()<CR>"
local __rnm = "<cmd>lua require('s.util').lsp.rename()<CR>"
local __declr = "<cmd>lua vim.lsp.buf.declaration()<CR>"
local __impli = "<cmd>lua vim.lsp.buf.implementation()<CR>"
local __refe = "<cmd>lua vim.lsp.buf.references()<CR>"
local __defi = "<cmd>lua vim.lsp.buf.definition()<CR>"
local __acn = "<cmd>lua vim.lsp.buf.code_actions()<CR>"
local __wrkspc = "<cmd>lua vim.lsp.buf.workspace_symbols()<CR>"
local __pdiag = "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts={border=require('s.util').config.border}})<CR>"
local __ndiag = "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts={border=require('s.util').config.border}})<CR>"

-- Public API Variables

-- Path Separator For Current OS
local sep = vim.loop.os_uname().version:match("Windows") and '\\' or '/'

-- Default Border For Floating Windows
local border = {'╭', '─',  '╮', '│', '╯', '─', '╰', '│'}

-- Default `node_modules` Location
local node_modules = vim.fn.stdpath('data') .. "/bin/node_modules/.bin"

-- Supported LSP Client Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Private API Functions

local __dorename = function (text)
  vim.cmd(string.format('silent! bdelete! %s', A.nvim_get_current_buf()))
  vim.lsp.buf.rename(text)
end

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

-- Public API Functions

-- Set Up galaxyline
--- @return nil
local function galaxyline()
  local gl = require('galaxyline')
  local colors = require('galaxyline.theme').default
  colors.bg = '#282828'
  local condition = require('galaxyline.condition')
  local gls = gl.section
  gl.short_line_list = {'NvimTree','vista','dbui','packer'}

  gls.left[#(gls.left)+1] = {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        local mode_color = {
          ce=colors.red, r = colors.cyan,
          n = colors.red, i = colors.green,
          V=colors.blue, c = colors.magenta,
          no = colors.red,s = colors.orange,
          ['!']  = colors.red,t = colors.red,
          v=colors.blue, [''] = colors.blue,
          Rv = colors.violet, cv = colors.red,
          ic = colors.yellow,R = colors.violet,
          S=colors.orange,[''] = colors.orange,
          rm = colors.cyan, ['r?'] = colors.cyan,
        }
        vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
        return '   '
      end,
      highlight = {colors.red,colors.bg,'bold'},
    },
  }
  gls.left[#(gls.left)+1] = {
    FileSize = {
      provider = 'FileSize',
      condition = condition.buffer_not_empty,
      highlight = {colors.fg,colors.bg}
    }
  }
  gls.left[#(gls.left)+1] ={
    FileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
    },
  }

  gls.left[#(gls.left)+1] = {
    FileName = {
      provider = 'FileName',
      condition = condition.buffer_not_empty,
      highlight = {colors.magenta,colors.bg,'bold'}
    }
  }

  gls.left[#(gls.left)+1] = {
    LineInfo = {
      provider = 'LineColumn',
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.fg,colors.bg},
    },
  }

  gls.left[#(gls.left)+1] = {
    PerCent = {
      provider = 'LinePercent',
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.fg,colors.bg,'bold'},
    }
  }

  gls.left[#(gls.left)+1] = {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '  ',
      highlight = {colors.red,colors.bg}
    }
  }
  gls.left[#(gls.left)+1] = {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {colors.yellow,colors.bg},
    }
  }

  gls.left[#(gls.left)+1] = {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = '  ',
      highlight = {colors.cyan,colors.bg},
    }
  }

  gls.left[#(gls.left)+1] = {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = '  ',
      highlight = {colors.blue,colors.bg},
    }
  }

  -- gls.mid[#(gls.mid)+1] = {
  --   ShowLspClient = {
  --     provider = 'GetLspClient',
  --     condition = function ()
  --       local tbl = {['dashboard'] = true,['']=true}
  --       if tbl[vim.bo.filetype] then
  --         return false
  --       end
  --       return true
  --     end,
  --     icon = ' LSP:',
  --     highlight = {colors.cyan,colors.bg,'bold'}
  --   }
  -- }

  gls.right[#(gls.right)+1] = {
    FileEncode = {
      provider = 'FileEncode',
      condition = condition.hide_in_width,
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.green,colors.bg,'bold'}
    }
  }

  gls.right[#(gls.right)+1] = {
    FileFormat = {
      provider = 'FileFormat',
      condition = condition.hide_in_width,
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.green,colors.bg,'bold'}
    }
  }

  gls.right[#(gls.right)+1] = {
    GitIcon = {
      provider = function() return '  ' end,
      condition = condition.check_git_workspace,
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.violet,colors.bg,'bold'},
    }
  }

  gls.right[#(gls.right)+1] = {
    GitBranch = {
      provider = 'GitBranch',
      condition = condition.check_git_workspace,
      highlight = {colors.violet,colors.bg,'bold'},
    }
  }

  gls.right[#(gls.right)+1] = {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = condition.hide_in_width,
      icon = '   ',
      highlight = {colors.green,colors.bg},
    }
  }
  gls.right[#(gls.right)+1] = {
    DiffModified = {
      provider = 'DiffModified',
      condition = condition.hide_in_width,
      icon = '  柳',
      highlight = {colors.orange,colors.bg},
    }
  }
  gls.right[#(gls.right)+1] = {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = condition.hide_in_width,
      icon = '   ',
      highlight = {colors.red,colors.bg},
    }
  }

  gls.short_line_left[#(gls.short_line_left)+1] = {
    BufferType = {
      provider = 'FileTypeName',
      separator = ' ',
      separator_highlight = {'NONE',colors.bg},
      highlight = {colors.blue,colors.bg,'bold'}
    }
  }

  gls.short_line_left[#(gls.short_line_left)+1] = {
    SFileName = {
      provider =  'SFileName',
      condition = condition.buffer_not_empty,
      highlight = {colors.fg,colors.bg,'bold'}
    }
  }

  gls.short_line_right[#(gls.short_line_right)+1] = {
    BufferIcon = {
      provider= 'BufferIcon',
      highlight = {colors.fg,colors.bg}
    }
  }
end

-- Get Current Script Path Exclusive Of Script Name
--- @return string
local script_path = function()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*[/\\])")
end

-- Join Paths Togeather
--- @vararg string
--- @return string
local function join(...)
  return table.concat({...}, sep)
end

-- Check Existence of a Directory or File
--- @param filename string
--- @return boolean
local function exists(filename)
  local stat = vim.loop.fs_stat(filename)
  return stat and stat.type or false
end

-- Check if passed string is a file
--- @param filename string
--- @return boolean
local function is_file(filename)
  return exists(filename) == 'file'
end

-- Check if passed string is a directory
--- @param dirname string
--- @return boolean
local function is_dir(dirname)
  return exists(dirname) == 'directory'
end

-- Remove the last part of the path
--- @param dir string
--- @return string
local function dirname(dir)
  return vim.fn.fnamemodify(dir, ':h')
end


-- Check if string passed is file system root
--- @param root string
--- @return boolean
local function is_root(root)
  if sep == '/' then
    return sep == root
  end

  return root:match("^%a:$")
end

-- Search through ancestors of a path
--- @param path string
--- @param stop function
--- @return string
local function search_parents(path, stop)
  path = vim.loop.fs_realpath(path)
  local dir = path
  if is_file(dir) then dir = dirname(dir) end
  for _ = 1, 100 do
    if is_root(dir) then
      return nil
    end
    if stop(dir) then
      return dir
    end
    dir = dirname(dir)
  end
  return nil
end

-- Grep Through Files Using ripgrep
local function rg()
  local snap = require('snap')
  snap.run {
    prompt = "🔍 ",
    producer = snap.get'producer.ripgrep.vimgrep',
    select = snap.get'select.vimgrep'.select,
    multiselect = snap.get'select.vimgrep'.multiselect,
    views = {snap.get'preview.vimgrep'}
  }
end

-- Find Files Using fd
local function fd()
  local snap = require('snap')
  local general = snap.get('producer.fd.general')
  snap.run {
    prompt = "🔍 ",
    producer = snap.get'consumer.fzy'(
    function(request)
      local cwd = vim.loop.cwd()
      return general(request, {args = {'--type=file'}, cwd = cwd})
    end
    ),
    select = snap.get'select.file'.select,
    multiselect = snap.get'select.file'.multiselect,
    views = {snap.get'preview.file'}
  }
end

-- Search Through Old Files
local function oldfiles()
  local snap = require('snap')
  snap.run {
    prompt = '🔍 ',
    producer = snap.get'consumer.fzy'(snap.get'producer.vim.oldfile'),
    select = snap.get'select.file'.select,
    multiselect = snap.get'select.file'.multiselect,
    views = {snap.get'preview.file'}
  }
end

-- Search Through Git Status
local function git_status()
  local snap = require('snap')
  local git = require('s.git')
  snap.run {
    prompt = '🔍 ',
    producer = git.producer.git_status,
    select = git.select.git_status,
    multiselect = git.multiselect.git_status,
    views = {git.views.git_status}
  }
end

-- Search Through Git Status
local function git_log()
  local snap = require('snap')
  local git = require('s.git')
  snap.run {
    prompt = '🔍 ',
    producer = git.producer.git_log,
    views = {git.views.git_log},
    select = print
  }
end

-- Exec a Script Using Your Default Shell
--- @param script string
--- @param o table
--- @return nil
local function exec_script(script, o)
  local height = math.floor((O.lines - 2) * 0.6)
  local row = math.floor((O.lines - height) / 2)
  local width = math.floor(O.columns * 0.6)
  local col = math.floor((O.columns - width) / 2)
  o = o or {keep = false}

  local opts = {
    relative = 'editor',
    row = row,
    col = col,
    width = width,
    height = height,
    style = 'minimal',
    border = border
  }

  local buf = A.nvim_create_buf(false, true)
  A.nvim_buf_set_keymap(buf, 'n', 'q', 'ZQ', __options)
  local win = A.nvim_open_win(buf, true, opts)
  local cwd = o.cwd or F.fnamemodify(node_modules, ':h:h')
  F.termopen(script, {
    cwd = cwd,
    on_exit = function (_, err)
    	if err ~= 0 then error('could not update') end
      if not o.keep then
        A.nvim_win_close(win, true)
      end
    end
  })
end

-- General LSP Attach Function
--- @param client table
local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    A.nvim_buf_set_keymap(bufnr, "n", "<Space>f", __fmt, __options)
  elseif client.resolved_capabilities.document_range_formatting then
    A.nvim_buf_set_keymap(bufnr, "n", "<Space>f", __fmt, __options)
  end
  if client.config.root_dir ~= nil then
    A.nvim_set_current_dir(client.config.root_dir)
  end
  A.nvim_buf_set_keymap(bufnr, 'n', 'ga', __acn, __options)
  A.nvim_buf_set_keymap(bufnr, 'n', "gd", __defi, __options)
  A.nvim_buf_set_keymap(bufnr, 'n', "gr", __refe, __options)
  A.nvim_buf_set_keymap(bufnr, 'n', "K", __hover, __options)
  A.nvim_buf_set_keymap(bufnr, 'n', 'gi', __impli, __options)
  A.nvim_buf_set_keymap(bufnr, 'n', "gD", __declr, __options)
  A.nvim_buf_set_keymap(bufnr, 'n', 'gw', __wrkspc, __options)
  A.nvim_buf_set_keymap(bufnr, 'n', "[e", __pdiag, __options)
  A.nvim_buf_set_keymap(bufnr, 'n', "]e", __ndiag, __options)
  A.nvim_buf_set_keymap(bufnr, 'n', '<Space>rn', __rnm, __options)

  require "lsp_signature".on_attach({
    bind = true,
    hint_prefix = " ",
    handler_opts = { border = border },
    floating_window = true,
  })

  if client.resolved_capabilities.document_highlight then
    A.nvim_exec([[
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
      augroup END
    ]], false)
  end
end

-- Get Binary From `node_modules`
--- @param binary string
--- @return string
local function npm_get_binary(binary)
	return join(node_modules, binary)
end

-- Install a package using npm
--- @param package string
--- @return nil
local function npm_install(package)
  exec_script('npm install ' .. package)
end
--
-- Update all package using npm
--- @return nil
local function npm_update()
  exec_script('npm update')
end

-- List all package using npm
--- @return nil
local function npm_list()
  exec_script('npm list', {keep=true})
end

-- Create a floating terminal
--- @return nil
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
    border = border
  }

  local buf = A.nvim_create_buf(false, true)
  local win = A.nvim_open_win(buf, true, opts)
  A.nvim_command('startinsert')
  F.termopen(os.getenv('SHELL'))
  A.nvim_buf_set_keymap(buf, 't', '<Esc>', '<C-\\><C-n>', {silent=true})
  local fmt = 'autocmd TermClose * ++once :lua vim.api.nvim_win_close(%d, true)'
  A.nvim_command(string.format(fmt, win))
end

-- Setup Rename Request Using Floating Windows
--- @return nil
local function rename()
  local opts = {
    relative = 'cursor',
    row = 0,
    col = 0,
    width = 30,
    height = 1,
    style = 'minimal',
    border = border
  }
  local buf = A.nvim_create_buf(false, true)
  A.nvim_open_win(buf, true, opts)
  A.nvim_buf_set_option(buf, 'buftype', 'prompt')
  F.prompt_setcallback(buf, __dorename)
  F.prompt_setprompt(buf, ' ')
  vim.cmd('startinsert')
end

-- Wrapper over vim.g to set global variables using a table
--- @param gbl table
--- @return nil
local function globals(gbl)
	for k,v in pairs(gbl) do
    vim.g[k] = v
  end
end

-- Wrapper over vim.o to set options using a table
--- @param opts table
--- @return nil
local function options(opts)
	for k,v in pairs(opts) do
    vim.o[k] = v
  end
end

-- Wrapper over neovim keymap api to set keymaps using a table
--- @param mps table
--- @param defaults table
--- @return nil
local function maps(mps, defaults)
	for _,v in ipairs(mps) do
    A.nvim_set_keymap(v['mode'],v['lhs'],  v['rhs'], v['opts'] or defaults)
  end
end

-- Use tab to:
-- move to next item in completion menuone
-- jump to next snippet\'s placeholder
--- @return string
local function tab_complete()
  if vim.fn.pumvisible() == 1 then
    return __t "<C-n>"
  elseif require('luasnip').expand_or_jumpable() then
    return __t "<Plug>luasnip-expand-or-jump"
  elseif __check_back_space() then
    return __t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

local function get_visual_selection_range()
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  return csrow, cscol, cerow, cecol
end

local function sort_lines()
  local ls, _, le, _ = get_visual_selection_range()
  local lines = F.getline(ls, le)
  table.sort(lines, function (a, b)
  	return string.len(a) < string.len(b)
  end)
  A.nvim_buf_set_lines(A.nvim_get_current_buf(), ls-1, le, true, lines)
end

-- Use s-tab to:
-- move to prev item in completion menuone
-- jump to prev snippet\'s placeholder
--- @return string
local function s_tab_complete()
  if vim.fn.pumvisible() == 1 then
    return __t "<C-p>"
  elseif require('luasnip').jumpable(-1) then
    return __t "<Plug>luasnip-jump-prev"
  else
    return __t "<S-Tab>"
  end
end

local npm = {
  list = npm_list,
  update = npm_update,
  install = npm_install,
  get_binary = npm_get_binary,
}

local path = {
  sep = sep,
  join = join,
  is_dir = is_dir,
  exists = exists,
  is_file = is_file,
  is_root = is_root,
  dirname = dirname,
  script_path = script_path,
  search_parents = search_parents,
}

local config = {
  maps = maps,
  border = border,
  globals = globals,
  options = options,
  galaxyline = galaxyline,
  tab_complete = tab_complete,
  s_tab_complete = s_tab_complete,
}

local lsp = {
  rename = rename,
  term = float_term,
  on_attach = on_attach,
  capabilities = capabilities
}

local vim = {
  sort_lines = sort_lines,
  exec_script = exec_script,
  get_visual_selection_range = get_visual_selection_range,
}

local snaps = {
  fd = fd,
  rg = rg,
  oldfiles = oldfiles,
  git_status = git_status,
  git_log = git_log,
}

return {
  npm = npm,
  vim = vim,
  lsp = lsp,
  path = path,
  snaps = snaps,
  config = config,
}
