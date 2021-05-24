O = vim.o
A = vim.api
F = vim.fn


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
      border = 'single'
    }

    local buf = A.nvim_create_buf(false, true)
    local win = A.nvim_open_win(buf, true, opts)
    A.nvim_command('startinsert')
    F.termopen(os.getenv('SHELL'))
    A.nvim_buf_set_keymap(buf, 't', '<Esc>', '<C-\\><C-n>', {silent=true})
    local fmt = 'autocmd TermClose * ++once :lua vim.api.nvim_win_close(%d, true)'
    A.nvim_command(string.format(fmt, win))
end

_G.SUtils = {}
_G.SUtils.Term = float_term

A.nvim_set_keymap('n', '\\cmd;', '<cmd>lua SUtils.Term()<CR>', {silent=true})
