-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
--  Import Modules {{{
-- ============================================================================
local options = vim.o
local api = vim.api
local uv = vim.loop
local fn = vim.fn
local sep = uv.os_uname().version:match("Windows") and '\\' or '/'
-- }}}
-- ============================================================================
--  Private Functions {{{
-- ============================================================================

local function float_term(args)
    local height = math.floor((options.lines - 2) * 0.6)
    local row = math.floor((options.lines - height) / 2)
    local width = math.floor(options.columns * 0.6)
    local col = math.floor((options.columns - width) / 2)

    local border_opts = {
        relative='editor',
        row=row - 1,
        col = col - 2,
        width = width + 4,
        height = height + 2,
        style = 'minimal'
    }

    local opts = {
        relative = 'editor',
        row = row,
        col = col,
        width = width,
        height = height,
        style = 'minimal'
   }

    local top = "╭" .. string.rep("─", width + 2) .. "╮"
    local mid = "│" .. string.rep(" ", width + 2) .. "│"
    local bot = "╰" .. string.rep("─", width + 2) .. "╯"

    local lines = {top}

    while(height ~= 0)
    do
      table.insert(lines, mid)
      height = height - 1
    end

    table.insert(lines, bot)

    local buff = api.nvim_create_buf(false, true)
    fn.nvim_buf_set_lines(buff, 0, -1, true, lines)
    local float_term_border_win = api.nvim_open_win(buff, true, border_opts)


    local buf = api.nvim_create_buf(false, true)
    local float_term_win = api.nvim_open_win(buf, true, opts)

    api.nvim_command("hi FloatWinBorder guifg=#87bb7c")

    fn.setwinvar(float_term_border_win, '&winhl', 'Normal:FloatWinBorder')
    fn.setwinvar(float_term_win, '&winhl', 'Normal:Normal')
    fn.termopen(args)

    api.nvim_command('startinsert')
    api.nvim_command(
      string.format('autocmd TermClose * ++once :bd! | lua vim.api.nvim_win_close(%d, true)',
      float_term_border_win)
    )
end

local function create_cmd(ld)
    local cmd = ''

    if ld['dir'] ~= nil then
        cmd = cmd .. 'cd "' .. ld['dir'] .. '"'
    end

    if ld['compile'] ~= nil then
        if cmd == '' then
            cmd = cmd .. ld['compile']
        else
            cmd = cmd .. ' && ' .. ld['compile']
        end
    end

    if ld['run'] ~= nil then
        if cmd == '' then
            cmd = cmd .. ld['run']
        else
            cmd = cmd .. ' && ' .. ld['run']
        end
    end

    if ld['continue'] == "1" then
        if ld['shell'] ~= nil then
            cmd = cmd .. ' && ' .. ld['shell']
        else
            cmd = cmd .. ' && ' .. os.getenv('SHELL')
        end
    end

    return cmd

end

local function workspace(tuple)
    local remove_elements = tuple[1] + 1
    local total_elements  = tuple[2] + 1
    local current_elements = 0
    local wrkspc = ''

    if sep == '/' then
        wrkspc = sep
    end

    for str in string.gmatch(fn.getcwd(), "([^"..sep.."]+)") do
        if total_elements - current_elements > remove_elements then
            wrkspc = wrkspc .. str .. sep
        end
        current_elements = current_elements + 1
    end

    return wrkspc
end


local function exists(filename)
    local stat = uv.fs_stat(filename)
    return stat and stat.type or false
end

local function search_path(filename)

    local count = 0


    for _ in string.gmatch(fn.getcwd(), "([^"..sep.."]+)") do
        count = count + 1
    end

    for i=0,count,1
    do
        if exists(filename) then
            return {workspace({i, count}), filename}
        end

        filename = ".." .. sep .. filename
    end

    return false
end

local function launch_dict()
    local data = search_path("launch.lua")

    if not data then
        return nil
    end

    local wrkspc = data[1]
    local filename = data[2]

    local config = {}

    if filename then
        for line in io.lines(filename) do
            local tbl = split(line, '=')
            config[tbl[1]] = tbl[2]:gsub("FILE", vim.fn.expand('%')):gsub("WORKSPACE", wrkspc)
        end
        return config
    end

    return nil
end

local function get_value(ld, key)
    local value = ''

    if ld ~= nil and ld[key] ~= nil then
        value = ld[key]
    end

    if key == 'shell' and value == '' then
        value = os.getenv('SHELL')
    end

    return value
end

-- }}}
-- ============================================================================
--  Public Functions {{{
-- ============================================================================

local function split(inputstr, seperator)
    local t={}

    for str in string.gmatch(inputstr, "([^"..seperator.."]+)") do
        table.insert(t, str)
    end

    return t
end

local function rename(new_name)
  local old_name = fn.expand('%:p')
  new_name = fn.expand('%:h').. sep .. new_name
  api.nvim_command('saveas ' .. new_name)
  os.remove(old_name)
end

local function launch()
    local ld = launch_dict()

    if ld == nil then
        float_term(get_value(ld, 'shell'))
    else
        local cmd = create_cmd(ld)
        float_term(cmd)
    end
end

local function term()
    local ld = launch_dict()
    float_term(get_value(ld, 'shell'))
end

local function clean()
    local ld = launch_dict()
    local clc = get_value(ld, 'clean')
    float_term(clc)
end

local functions = {
  Term = term,
  Clean = clean,
  Split = split,
  Launch = launch,
  Rename = rename,
  SearchPath = search_path,
}

return functions
-- }}}
-- ============================================================================
