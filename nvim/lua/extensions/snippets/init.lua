vim.cmd('packadd! vim-vsnip')

vim.g.vsnip_snippet_dir = vim.fn.stdpath('data') .. '/snippets'


vim.api.nvim_set_keymap('i', '<tab>', [[pumvisible() ? '<C-n>' : vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']], {expr=true, silent=true})
vim.api.nvim_set_keymap('s', '<tab>', [[pumvisible() ? '<C-n>' : vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']], {expr=true, silent=true})

vim.api.nvim_set_keymap('i', '<S-tab>', [[pumvisible() ? '<C-p>' : vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-next)' : '<S-Tab>']], {expr=true, silent=true})
vim.api.nvim_set_keymap('s', '<S-tab>', [[pumvisible() ? '<C-p>' : vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-next)' : '<S-Tab>']], {expr=true, silent=true})

vim.api.nvim_set_keymap('n', 's', '<Plug>(vsnip-select-text)', {silent=true})
vim.api.nvim_set_keymap('s', 's', '<Plug>(vsnip-select-text)', {silent=true})

vim.api.nvim_set_keymap('n', 'S', '<Plug>(vsnip-cut-text)', {silent=true})
vim.api.nvim_set_keymap('s', 'S', '<Plug>(vsnip-cut-text)', {silent=true})
