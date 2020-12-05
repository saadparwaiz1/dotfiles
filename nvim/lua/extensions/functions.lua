-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
--  Import Modules {{{
-- ============================================================================
local options = vim.o
local api = vim.api
local fn = vim.fn
-- }}}
-- ============================================================================
--  Functions {{{
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

local function term()
    float_term(os.getenv('SHELL'))
end

local functions = {
  Term = term,
}

return functions
-- }}}
-- ============================================================================
