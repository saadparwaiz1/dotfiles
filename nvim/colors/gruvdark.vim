highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'gruvdark'

hi! link CursorColumn CursorLine
hi! link QuickFixLine Search
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link VisualNOS Visual
hi! link Tag Special
hi! link lCursor Cursor
hi! link iCursor Cursor
hi! link vCursor Cursor

let g:terminal_color_0 = '#282828'
let g:terminal_color_1 = '#cc241d'
let g:terminal_color_2 = '#98971a'
let g:terminal_color_3 = '#d79921'
let g:terminal_color_4 = '#458588'
let g:terminal_color_5 = '#b16286'
let g:terminal_color_6 = '#689d6a'
let g:terminal_color_7 = '#a89984'
let g:terminal_color_8 = '#928374'
let g:terminal_color_9 = '#fb4934'
let g:terminal_color_10 = '#b8bb26'
let g:terminal_color_11 = '#fabd2f'
let g:terminal_color_12 = '#83a598'
let g:terminal_color_13 = '#d3869b'
let g:terminal_color_14 = '#8ec07c'
let g:terminal_color_15 = '#ebdbb2'

hi Normal guifg=#ebdbb2 guibg=#282828 guisp=NONE gui=NONE
hi CursorLineNr guifg=#fabd2f guibg=#3c3836 guisp=NONE gui=NONE
hi FoldColumn guifg=#928374 guibg=#3c3836 guisp=NONE gui=NONE
hi SignColumn guifg=#ebdbb2 guibg=#3c3836 guisp=NONE gui=NONE
hi VertSplit guifg=#665c54 guibg=#282828 guisp=NONE gui=NONE
hi ColorColumn guifg=NONE guibg=#3c3836 guisp=NONE gui=NONE
hi Comment guifg=#928374 guibg=NONE guisp=NONE gui=italic
hi CursorLine guifg=NONE guibg=#3c3836 guisp=NONE gui=NONE
hi Error guifg=#fb4934 guibg=#282828 guisp=NONE gui=bold,reverse
hi ErrorMsg guifg=#282828 guibg=#fb4934 guisp=NONE gui=bold
hi Folded guifg=#928374 guibg=#3c3836 guisp=NONE gui=italic
hi LineNr guifg=#7c6f64 guibg=NONE guisp=NONE gui=NONE
hi MatchParen guifg=NONE guibg=#665c54 guisp=NONE gui=bold,underline
hi NonText guifg=#504945 guibg=NONE guisp=NONE gui=NONE
hi Pmenu guifg=#ebdbb2 guibg=#504945 guisp=NONE gui=NONE
hi PmenuSbar guifg=NONE guibg=#504945 guisp=NONE gui=NONE
hi PmenuSel guifg=#504945 guibg=#83a598 guisp=NONE gui=bold
hi PmenuThumb guifg=NONE guibg=#7c6f64 guisp=NONE gui=NONE
hi SpecialKey guifg=#928374 guibg=NONE guisp=NONE gui=NONE
hi StatusLineNC guifg=#3c3836 guibg=#a89984 guisp=NONE gui=reverse
hi TabLine guifg=#7c6f64 guibg=#3c3836 guisp=NONE gui=NONE
hi TabLineFill guifg=#7c6f64 guibg=#3c3836 guisp=NONE gui=NONE
hi TabLineSel guifg=#b8bb26 guibg=#3c3836 guisp=NONE gui=NONE
hi ToolbarButton guifg=#fbf1c7 guibg=#665c54 guisp=NONE gui=bold
hi ToolbarLine guifg=NONE guibg=#665c54 guisp=NONE gui=NONE
hi Visual guifg=NONE guibg=#665c54 guisp=NONE gui=NONE
hi WildMenu guifg=#83a598 guibg=#504945 guisp=NONE gui=bold
hi Conceal guifg=#83a598 guibg=NONE guisp=NONE gui=NONE
hi Cursor guifg=NONE guibg=NONE guisp=NONE gui=reverse
hi DiffAdd guifg=#b8bb26 guibg=#282828 guisp=NONE gui=reverse
hi DiffChange guifg=#8ec07c guibg=#282828 guisp=NONE gui=reverse
hi DiffDelete guifg=#fb4934 guibg=#282828 guisp=NONE gui=reverse
hi DiffText guifg=#fabd2f guibg=#282828 guisp=NONE gui=reverse
hi Directory guifg=#b8bb26 guibg=NONE guisp=NONE gui=bold
hi EndOfBuffer guifg=#282828 guibg=NONE guisp=NONE gui=NONE
hi IncSearch guifg=#fe8019 guibg=#282828 guisp=NONE gui=reverse
hi ModeMsg guifg=#fabd2f guibg=NONE guisp=NONE gui=bold
hi MoreMsg guifg=#fabd2f guibg=NONE guisp=NONE gui=bold
hi Question guifg=#fe8019 guibg=NONE guisp=NONE gui=bold
hi Search guifg=#fabd2f guibg=#282828 guisp=NONE gui=reverse
hi SpellBad guifg=#fb4934 guibg=NONE guisp=#fb4934 gui=italic,undercurl
hi SpellCap guifg=#83a598 guibg=NONE guisp=#83a598 gui=italic,undercurl
hi SpellLocal guifg=#8ec07c guibg=NONE guisp=#8ec07c gui=italic,undercurl
hi SpellRare guifg=#d3869b guibg=NONE guisp=#d3869b gui=italic,undercurl
hi Title guifg=#b8bb26 guibg=NONE guisp=NONE gui=bold
hi WarningMsg guifg=#fb4934 guibg=NONE guisp=NONE gui=bold
hi Boolean guifg=#d3869b guibg=NONE guisp=NONE gui=NONE
hi Character guifg=#d3869b guibg=NONE guisp=NONE gui=NONE
hi Conditional guifg=#fb4934 guibg=NONE guisp=NONE gui=NONE
hi Constant guifg=#d3869b guibg=NONE guisp=NONE gui=NONE
hi Define guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE
hi Debug guifg=#fb4934 guibg=NONE guisp=NONE gui=NONE
hi Delimiter guifg=#fe8019 guibg=NONE guisp=NONE gui=NONE
hi Error guifg=#fb4934 guibg=#282828 guisp=NONE gui=bold,reverse
hi Exception guifg=#fb4934 guibg=NONE guisp=NONE gui=NONE
hi Float guifg=#d3869b guibg=NONE guisp=NONE gui=NONE
hi Function guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE
hi Identifier guifg=#83a598 guibg=NONE guisp=NONE gui=NONE
hi Ignore guifg=fg guibg=NONE guisp=NONE gui=NONE
hi Include guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE
hi Keyword guifg=#fb4934 guibg=NONE guisp=NONE gui=NONE
hi Label guifg=#fb4934 guibg=NONE guisp=NONE gui=NONE
hi Macro guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE
hi Number guifg=#d3869b guibg=NONE guisp=NONE gui=NONE
hi Operator guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE
hi PreCondit guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE
hi PreProc guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE
hi Repeat guifg=#fb4934 guibg=NONE guisp=NONE gui=NONE
hi SpecialChar guifg=#fb4934 guibg=NONE guisp=NONE gui=NONE
hi SpecialComment guifg=#fb4934 guibg=NONE guisp=NONE gui=NONE
hi Statement guifg=#fb4934 guibg=NONE guisp=NONE gui=NONE
hi StorageClass guifg=#fe8019 guibg=NONE guisp=NONE gui=NONE
hi Special guifg=#fe8019 guibg=NONE guisp=NONE gui=italic
hi String guifg=#b8bb26 guibg=NONE guisp=NONE gui=italic
hi Structure guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE
hi Todo guifg=fg guibg=#282828 guisp=NONE gui=bold,italic
hi Type guifg=#fabd2f guibg=NONE guisp=NONE gui=NONE
hi Typedef guifg=#fabd2f guibg=NONE guisp=NONE gui=NONE
hi Underlined guifg=#83a598 guibg=NONE guisp=NONE gui=underline
hi CursorIM guifg=NONE guibg=NONE guisp=NONE gui=reverse
hi Warnings guifg=#fe8019 guibg=#282828 guisp=NONE gui=reverse
hi! link TermCursor Cursor
hi TermCursorNC guifg=#3c3836 guibg=#ebdbb2 guisp=NONE gui=NONE

highlight! link TSVariableBuiltin Type

if !$PLUGINS
  " Links
  hi link SubStatusLine Visual


  " Color Groups
  hi StatusLine guifg=#504945 guibg=#ebdbb2 guisp=NONE gui=reverse
  hi SubSeperator guifg=#504945 guibg=#665c54 guisp=NONE gui=reverse


  " Functions
  function! s:HighLight(c)
    execute 'highlight Seperator guifg=#665c54' 'guibg='a:c 'guisp=NONE gui=reverse'
    execute 'highlight Mode guifg=#282828' 'guibg='a:c 'guisp=NONE gui=BOLD'
    execute 'highlight InfoMode guifg='a:c 'guibg=#282828' 'guisp=NONE gui=reverse'
  endfunction

  function! GetMode()
      let l:mode = mode()
      if l:mode ==# 'n'
          call s:HighLight('#a89984')
          return 'NORMAL'
      elseif l:mode ==# 'i'
          call s:HighLight('#83a598')
          return 'INSERT'
      elseif l:mode ==# 'R'
          call s:HighLight('#8ec07c')
          return 'REPLACE'
      elseif l:mode ==# 'c'
          call s:HighLight('#d3869b')
          return 'COMMAND'
      elseif l:mode ==# 't'
          call s:HighLight('#8ec07c')
          return 'TERMINAL'
      else
          call s:HighLight('#fe8019')
          return 'VISUAL'
      endif
  endfunction
end
