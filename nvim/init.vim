" vim: set foldmethod=marker foldlevel=1 nomodeline:
" ---------------------------------------------------
"  global options {{{
"  --------------------------------------------------
let g:mapleader = " "
let g:loaded_tar = 1
let g:loaded_zip = 1
let g:loaded_gzip = 1
let g:loaded_netrw = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_vimball = 1
let g:loaded_rrhelper = 1
let g:loaded_getscript = 1
let g:loaded_tarPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_matchparen = 1
let g:loaded_netrwPlugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_compe_omni = 1
let g:loaded_compe_calc = 1
let g:loaded_compe_tags = 1
let g:loaded_compe_emoji = 1
let g:loaded_compe_vim_lsc = 1
let g:loaded_compe_vim_lsp = 1
let g:loaded_compe_vsnip = 1
let g:loaded_compe_ultisnips = 1
let g:loaded_compe_treesitter = 1
let g:loaded_compe_luasnip = 1
let g:markdown_syntax_conceal = 1
"  }}}
"  --------------------------------------------------
"  vim options {{{
"  --------------------------------------------------
set hidden
set nobackup
set undofile
set noshowmode
set lazyredraw
set splitbelow
set splitright
set writebackup
set termguicolors
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cmdheight=2
set pumblend=30
set history=100
set showtabline=2
set updatetime=100
set expandtab
set mouse=a
set listchars=tab:\|\ ,trail:~
set clipboard=unnamedplus
set shortmess+=c
set completeopt=menuone,noselect
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/,DS_store,**/node_modules
set isfname+=, 
set list
set number
set relativenumber
set conceallevel=1
"  }}}
"  --------------------------------------------------
"  autocmds {{{
"  --------------------------------------------------
augroup autocmds_core
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=150}
  autocmd FileType tex,plaintex setlocal spell
augroup END
"  }}}
"  --------------------------------------------------
"  Mappings {{{
"  --------------------------------------------------
noremap <silent> \cmdn <cmd>bn<CR>
noremap <silent> \cmdp  <cmd>bp<CR>
noremap <silent> \cmdw  <cmd>bd<CR>
noremap <silent> \cmds  :%s/\\<<C-R><C-w>\\>/
noremap <silent> <Left>  <C-w>h
noremap <silent> <Down>  <C-w>j
noremap <silent> <Up>  <C-w>k
noremap <silent> <Right>  <C-w>l
noremap <silent> Q  <nop>
noremap <silent> vv  ^v$
inoremap <silent> jj <Esc><cmd>noh<CR>
nnoremap <silent> <Esc> <cmd>noh<CR><Esc>
inoremap <silent> <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> compe#confirm('<CR>')
vnoremap <silent> \cmds :s/
"  }}}
"  --------------------------------------------------
"  Lua Modules {{{
"  --------------------------------------------------
lua require('extensions/packer')
"  }}}
"  --------------------------------------------------
