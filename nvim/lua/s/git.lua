local snap = require('snap')
local general = snap.get('producer.git.general')
local syntax = snap.get('preview.syntax')

local function read_git_diff(type, path)
  if type == '??' then
    return { 'No Diff Available' }
  end
  local handle = io.popen(string.format('git --no-pager diff %s', path))
  local data = handle:read('*a')
  handle:close()
  return vim.split(data, '\n', true)
end

local function trim_selection(selection, type)
  selection = vim.trim(selection)
  if type == 'status' then
    selection = vim.split(selection, ' ', true)
    return selection
  end

  if type == 'log' then
    return { '', selection:match('^[a-zA-Z0-9]* ') }
  end
end

local function view_git_status(request)
  local preview = read_git_diff(
    unpack(trim_selection(request.selection, 'status'))
  )
  local function _3_()
    if not request.canceled() then
      vim.api.nvim_win_set_option(request.winnr, 'cursorline', false)
      vim.api.nvim_win_set_option(request.winnr, 'cursorcolumn', false)
      vim.api.nvim_buf_set_lines(request.bufnr, 0, -1, false, preview)
      return syntax('diff', request.bufnr)
    end
  end
  snap.sync(_3_)
  preview = nil
  return nil
end

local function view_git_log(request)
  local preview = read_git_diff(
    unpack(trim_selection(request.selection, 'log'))
  )
  local function _3_()
    if not request.canceled() then
      vim.api.nvim_win_set_option(request.winnr, 'cursorline', false)
      vim.api.nvim_win_set_option(request.winnr, 'cursorcolumn', false)
      vim.api.nvim_buf_set_lines(request.bufnr, 0, -1, false, preview)
      return syntax('diff', request.bufnr)
    end
  end
  snap.sync(_3_)
  preview = nil
  return nil
end

local function select_git_status(selection, winnr, type)
  selection = trim_selection(selection, 'status')
  local path = selection[2]
  local buffer = vim.fn.bufnr(path, true)
  vim.api.nvim_buf_set_option(buffer, 'buflisted', true)
  local _3_ = type
  if _3_ == nil then
    if winnr ~= false then
      return vim.api.nvim_win_set_buf(winnr, buffer)
    end
  elseif _3_ == 'vsplit' then
    vim.api.nvim_command('vsplit')
    return vim.api.nvim_win_set_buf(0, buffer)
  elseif _3_ == 'split' then
    vim.api.nvim_command('split')
    return vim.api.nvim_win_set_buf(0, buffer)
  elseif _3_ == 'tab' then
    vim.api.nvim_command('tabnew')
    return vim.api.nvim_win_set_buf(0, buffer)
  end
end

local function multiselect_git_status(selections, winnr)
  for index, selection in ipairs(selections) do
    local function _3_()
      if #selections == index then
        return winnr
      else
        return false
      end
    end
    select_git_status(selection, _3_())
  end
end

local function producer_git_status(request)
  return general(
    request,
    { args = { 'status', '-s', '--', '.' }, cwd = vim.loop.cwd() }
  )
end

local function producer_git_log(request)
  return general(
    request,
    { args = { 'log', '--oneline' }, cwd = vim.loop.cwd() }
  )
end

return {
  producer = {
    git_status = producer_git_status,
    git_log = producer_git_log,
  },
  views = {
    git_status = view_git_status,
    git_log = view_git_log,
  },
  select = {
    git_status = select_git_status,
  },
  multiselect = {
    git_status = multiselect_git_status,
  },
}
