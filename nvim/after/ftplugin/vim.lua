vim.cmd('command! -complete=help -nargs=? Help call v:lua.vim.help(<q-args>)')
vim.opt_local.keywordprg = ':Help'
