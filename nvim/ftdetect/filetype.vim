augroup FileDetect
  autocmd!
  autocmd BufNewFile,BufRead LOG set filetype=log
  autocmd BufNewFile,BufRead log set filetype=log
  autocmd BufNewFile,BufRead *.log set filetype=log
  autocmd BufNewFile,BufRead *_log set filetype=log
  autocmd BufNewFile,BufRead *.LOG set filetype=log
  autocmd BufNewFile,BufRead *_LOG set filetype=log
  autocmd BufNewFile,BufRead Brewfile,brewfile set filetype=brewfile
augroup end
