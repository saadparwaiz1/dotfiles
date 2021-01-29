vim.cmd('packadd! fzf.vim')
vim.api.nvim_set_keymap('n', '\\f', '<cmd>Files<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '\\l', '<cmd>Rg<CR>', {silent=true})
vim.api.nvim_set_keymap('i', '<c-x><c-f>', "fzf#vim#complete#path('fd')", {expr=true})
