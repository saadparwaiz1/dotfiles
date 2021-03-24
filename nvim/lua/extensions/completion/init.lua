vim.cmd('packadd! nvim-compe')

require('compe').setup {
    enabled = true,
    source = {
        path = true,
        spell = true,
        vsnip = true,
        buffer = true,
        nvim_lsp = true,
        nvim_lua = true,
    }
}

vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm("<CR>")', {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', {noremap = true, silent = true, expr = true})
