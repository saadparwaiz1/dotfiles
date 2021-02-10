vim.cmd('packadd! nvim-web-devicons')
vim.cmd('packadd! nvim-tree.lua')

vim.api.nvim_set_keymap('n', '\\nft', '<cmd>NvimTreeToggle<CR>', {silent=true})
