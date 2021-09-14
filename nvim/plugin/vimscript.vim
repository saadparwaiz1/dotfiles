augroup vim_autocmds
  autocmd!
  autocmd TextYankPost *
    \ :lua vim.highlight.on_yank({higroup="HighlightYank", timeout=200})
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
  autocmd BufWritePost */lua/personal/plugins.lua PackerCompile
augroup end

runtime macros/sandwich/keymap/surround.vim
colorscheme gruvbox
