" Maintainer: Christian Chiarulli <chrisatmachine@gmail.com>

set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='nvcode'

highlight Normal guifg=#abb2bf guibg=#1e1e1e gui=NONE 
highlight Comment guifg=#608b4e guibg=NONE gui=italic 
highlight Constant guifg=#dcdcaa guibg=NONE gui=NONE 
highlight String guifg=#ce9178 guibg=NONE gui=italic 
highlight Character guifg=#ce9178 guibg=NONE gui=NONE 
highlight Number guifg=#b5cea8 guibg=NONE gui=NONE 
highlight Boolean guifg=#569cd6 guibg=NONE gui=NONE 
highlight Float guifg=#b5cea8 guibg=NONE gui=NONE 
highlight Identifier guifg=#569cd6 guibg=NONE gui=NONE 
highlight Function guifg=#dcdcaa guibg=NONE gui=NONE 
highlight Statement guifg=#c586c0 guibg=NONE gui=NONE 
highlight Conditional guifg=#c586c0 guibg=NONE gui=NONE 
highlight Repeat guifg=#c586c0 guibg=NONE gui=NONE 
highlight Label guifg=#9cdcfe guibg=NONE gui=NONE 
highlight Operator guifg=#c586c0 guibg=NONE gui=NONE 
highlight Keyword guifg=#569cd6 guibg=NONE gui=NONE 
highlight Exception guifg=#c586c0 guibg=NONE gui=NONE 
highlight PreProc guifg=#dcdcaa guibg=NONE gui=NONE 
highlight Include guifg=#c586c0 guibg=NONE gui=NONE 
highlight Define guifg=#c586c0 guibg=NONE gui=NONE 
highlight Title guifg=#4ec9b0 guibg=NONE gui=NONE 
highlight Macro guifg=#c586c0 guibg=NONE gui=NONE 
highlight PreCondit guifg=#9cdcfe guibg=NONE gui=NONE 
highlight Type guifg=#9cdcfe guibg=NONE gui=NONE 
highlight StorageClass guifg=#9cdcfe guibg=NONE gui=NONE 
highlight Structure guifg=#dcdcaa guibg=NONE gui=NONE 
highlight Typedef guifg=#dcdcaa guibg=NONE gui=NONE 
highlight Special guifg=#569cd6 guibg=NONE gui=italic 
highlight SpecialComment guifg=#5c6370 guibg=NONE gui=NONE 
highlight Error guifg=#f44747 guibg=NONE gui=bold,reverse 
highlight Todo guifg=#c586c0 guibg=NONE gui=bold,italic 
highlight Underlined guifg=#4ec9b0 gui=underline 
highlight Cursor guifg=#51504f guibg=#AEAFAD gui=NONE
highlight ColorColumn guifg=NONE guibg=#2c323c gui=NONE 
highlight CursorLineNr guifg=#abb2bf guibg=NONE gui=bold 
highlight SignColumn guifg=NONE guibg=#1e1e1e gui=NONE 
highlight Conceal guifg=NONE guibg=NONE gui=NONE 
highlight CursorColumn guifg=NONE guibg=#2c323c gui=NONE 
highlight CursorLine guifg=NONE guibg=#2c323c gui=NONE 
highlight Directory guifg=#569cd6 guibg=NONE gui=NONE 
highlight DiffAdd guifg=#1e1e1e guibg=#608b4e gui=NONE 
highlight DiffChange guifg=#dcdcaa guibg=NONE gui=underline 
highlight DiffDelete guifg=#1e1e1e guibg=#d16969 gui=NONE 
highlight DiffText guifg=#1e1e1e guibg=#dcdcaa gui=NONE 
highlight ErrorMsg guifg=#f44747 guibg=NONE gui=NONE 
highlight VertSplit guifg=#181a1f guibg=NONE gui=NONE 
highlight Folded guifg=#5c6370 guibg=NONE gui=NONE 
highlight FoldColumn guifg=NONE guibg=NONE gui=NONE 
highlight IncSearch guifg=#dcdcaa guibg=#5c6370 gui=NONE 
highlight LineNr guifg=#4b5263 guibg=NONE gui=NONE 
highlight MatchParen guifg=#569cd6 guibg=NONE gui=underline 
highlight NonText guifg=#3b4048 guibg=NONE gui=NONE 
highlight Pmenu guifg=#abb2bf guibg=#282c34 gui=NONE 
highlight PmenuSel guifg=#1e1e1e guibg=#569cd6 gui=NONE 
highlight PmenuSbar guifg=NONE guibg=#3b4048 gui=NONE 
highlight PmenuThumb guifg=NONE guibg=#abb2bf gui=NONE 
highlight Question guifg=#c586c0 guibg=NONE gui=NONE 
highlight QuickFixLine guifg=#1e1e1e guibg=#dcdcaa gui=NONE 
highlight Search guifg=#1e1e1e guibg=#dcdcaa gui=NONE 
highlight SpecialKey guifg=#3b4048 guibg=NONE gui=NONE 
highlight SpellBad guifg=#f44747 guibg=NONE gui=underline 
highlight SpellCap guifg=#d7ba7d guibg=NONE gui=NONE 
highlight SpellLocal guifg=#d7ba7d guibg=NONE gui=NONE 
highlight SpellRare guifg=#d7ba7d guibg=NONE gui=NONE 
highlight StatusLineNC guifg=#5c6370 guibg=NONE gui=NONE 
highlight StatusLineTerm guifg=#abb2bf guibg=#2c323c gui=NONE 
highlight StatusLineTermNC guifg=#2c323c guibg=NONE gui=NONE 
highlight TabLine guifg=#5c6370 guibg=NONE gui=NONE 
highlight TabLineSel guifg=#abb2bf guibg=NONE gui=NONE 
highlight TabLineFill guifg=NONE guibg=#1e1e1e gui=NONE 
highlight Terminal guifg=#abb2bf guibg=#1e1e1e gui=NONE 
highlight Visual guifg=NONE guibg=#3e4452 gui=NONE 
highlight VisualNOS guifg=#3e4452 guibg=NONE gui=NONE 
highlight WarningMsg guifg=#dcdcaa guibg=NONE gui=NONE 
highlight WildMenu guifg=#1e1e1e guibg=#569cd6 gui=NONE 
highlight EndOfBuffer guifg=#1e1e1e guibg=NONE gui=NONE 


" Status Line Configuration

" Links
highlight link SubStatusLine Visual

" Colors
highlight StatusLine guifg=#abb2bf guibg=#2c323c gui=NONE 
highlight SubSeperator guifg=#2c323c  guibg=#3e4452 guisp=NONE gui=reverse

" Functions
function! s:HighLight(c)
  execute 'highlight Seperator guifg=#3e4452' 'guibg='a:c 'guisp=NONE gui=reverse'
  execute 'highlight Mode guifg=#282828' 'guibg='a:c 'guisp=NONE gui=BOLD'
  execute 'highlight InfoMode guifg='a:c 'guibg=#282828' 'guisp=NONE gui=reverse'
endfunction

function! GetMode()
    let l:mode = mode()
    if l:mode ==# 'n'
        call s:HighLight('#569CD6')
        return 'NORMAL'
    elseif l:mode ==# 'i'
        call s:HighLight('#D7BA7D')
        return 'INSERT'
    elseif l:mode ==# 'R'
        call s:HighLight('#4EC9B0')
        return 'REPLACE'
    elseif l:mode ==# 'c'
        call s:HighLight('#C586C0')
        return 'COMMAND'
    elseif l:mode ==# 't'
        call s:HighLight('#B5CEA8')
        return 'TERMINAL'
    else
        call s:HighLight('#D16969')
        return 'VISUAL'
    endif
endfunction
