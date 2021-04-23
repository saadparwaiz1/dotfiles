require('compe').setup {
    enabled = true,
    source = {
        path = true,
        spell = true,
        luasnip = true,
        buffer = true,
        nvim_lsp = true,
        nvim_lua = true
    }
}

local function complete_confirm_map()
    if vim.fn.pumvisible() ~= 0 then
        return vim.fn["compe#confirm"]("CR")
    else
        require("pears").handle_return(1)
        return ""
    end
end

_G.complete_confirm_map = complete_confirm_map

vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.complete_confirm_map()',
                        {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")',
                        {noremap = true, silent = true, expr = true})
