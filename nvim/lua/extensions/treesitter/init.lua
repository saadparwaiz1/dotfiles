local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = {
        'python',
        'lua',
    },
    highlight = {
        enable = true,
    },
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
