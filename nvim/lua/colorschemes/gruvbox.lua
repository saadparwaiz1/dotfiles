local M = {}

M.__name = 'gruvbox'

M.foreground = {
  GruvboxFg0 = {
    guifg = '#FBF0C6',
  },
  GruvboxFg1 = {
    guifg = '#EBDBB2',
  },
  GruvboxFg2 = {
    guifg = '#D4C3A0',
  },
  GruvboxFg3 = {
    guifg = '#BDAF93',
  },
  GruvboxFg4 = {
    guifg = '#A89985',
  },
}

M.background = {
  GruvboxBg0 = {
    guifg = '#292929',
  },
  GruvboxBg1 = {
    guifg = '#3B3735',
  },
  GruvboxBg2 = {
    guifg = '#4F4945',
  },
  GruvboxBg3 = {
    guifg = '#655B53',
  },
  GruvboxBg4 = {
    guifg = '#7D6F64',
  },
}

M.colors = {
  GruvboxGray = {
    guifg = '#918273',
  },
  GruvboxBlue = {
    guifg = '#83A598',
  },
  GruvboxRed = {
    guifg = '#FB4632',
  },
  GruvboxYellow = {
    guifg = '#FABD2E',
  },
  GruvboxPurple = {
    guifg = '#D4879C',
  },
  GruvboxGreen = {
    guifg = '#B8BA26',
  },
  GruvboxAqua = {
    guifg = '#8EC07C',
  },
  GruvboxOrange = {
    guifg = '#FE811B',
  },
}

M.underline = {
  GruvboxGreenUnderline = {
    guisp = M.colors.GruvboxGreen.guifg,
    gui = 'undercurl',
  },
  GruvboxYellowUnderline = {
    guisp = M.colors.GruvboxYellow.guifg,
    gui = 'undercurl',
  },
  GruvboxBlueUnderline = {
    guisp = M.colors.GruvboxBlue.guifg,
    gui = 'undercurl',
  },
  GruvboxPurpleUnderline = {
    guisp = M.colors.GruvboxPurple.guifg,
    gui = 'undercurl',
  },
  GruvboxAquaUnderline = {
    guisp = M.colors.GruvboxAqua.guifg,
    gui = 'undercurl',
  },
  GruvboxOrangeUnderline = {
    guisp = M.colors.GruvboxOrange.guifg,
    gui = 'undercurl',
  },
  GruvboxRedUnderline = {
    guisp = M.colors.GruvboxRed.guifg,
    gui = 'undercurl',
  },
}

M.bolds = {
  GruvboxRedBold = {
    guifg = M.colors.GruvboxRed.guifg,
    gui = 'bold',
  },
  GruvboxGreenBold = {
    guifg = M.colors.GruvboxGreen.guifg,
    gui = 'bold',
  },
  GruvboxYellowBold = {
    guifg = M.colors.GruvboxYellow.guifg,
    gui = 'bold',
  },
  GruvboxBlueBold = {
    guifg = M.colors.GruvboxBlue.guifg,
    gui = 'bold',
  },
  GruvboxPurpleBold = {
    guifg = M.colors.GruvboxPurple.guifg,
    gui = 'bold',
  },
  GruvboxAquaBold = {
    guifg = M.colors.GruvboxAqua.guifg,
    gui = 'bold',
  },
  GruvboxOrangeBold = {
    guifg = M.colors.GruvboxOrange.guifg,
    gui = 'bold',
  },
}

M.signs = {
  GruvboxRedSign = {
    guifg = M.colors.GruvboxRed.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  GruvboxGreenSign = {
    guifg = M.colors.GruvboxGreen.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  GruvboxYellowSign = {
    guifg = M.colors.GruvboxYellow.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  GruvboxBlueSign = {
    guifg = M.colors.GruvboxBlue.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  GruvboxPurpleSign = {
    guifg = M.colors.GruvboxPurple.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  GruvboxAquaSign = {
    guifg = M.colors.GruvboxAqua.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  GruvboxOrangeSign = {
    guifg = M.colors.GruvboxOrange.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
}

M.neovim = {
  Comment = {
    guifg = M.colors.GruvboxGray.guifg,
    gui = 'italic',
  },
  ColorColumn = {
    guibg = M.background.GruvboxBg0.guifg,
  },
  Conceal = {
    link = 'GruvboxOrange',
  },
  Cursor = {
    gui = 'inverse',
  },
  lCursor = {
    link = 'Cursor',
  },
  CursorIM = {
    link = 'Cursor',
  },
  CursorColumn = {
    link = 'CursorLine',
  },
  CursorLine = {
    guibg = M.background.GruvboxBg0.guifg,
  },
  Directory = {
    link = 'GruvboxGreenBold',
  },
  DiffAdd = {
    guifg = M.colors.GruvboxGreen.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  DiffChange = {
    guifg = M.colors.GruvboxAqua.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  DiffDelete = {
    guifg = M.colors.GruvboxRed.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  DiffText = {
    guifg = M.colors.GruvboxYellow.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  EndOfBuffer = {
    link = 'NonText',
  },
  ErrorMsg = {
    guifg = M.background.GruvboxBg0.guifg,
    guibg = M.colors.GruvboxRed.guifg,
    gui = 'bold',
  },
  VertSplit = {
    guifg = M.background.GruvboxBg3.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  Folded = {
    guifg = M.colors.GruvboxGray.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  FoldColumn = {
    guifg = M.colors.GruvboxGray.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  SignColumn = {
    guibg = M.background.GruvboxBg0.guifg,
  },
  IncSearch = {
    guifg = M.colors.GruvboxOrange.guifg,
    guibg = M.background.GruvboxBg0.guifg,
    gui = 'inverse',
  },
  LineNr = {
    link = 'GruvboxBg4',
  },
  CursorLineNr = {
    guifg = M.colors.GruvboxYellow.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  MatchParen = {
    link = 'GruvboxYellowBold',
  },
  ModeMsg = {
    link = 'GruvboxYellowBold',
  },
  NonText = {
    link = 'GruvboxBg2',
  },
  Normal = {
    guifg = M.foreground.GruvboxFg1.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  NormalFloat = {
    link = 'Normal',
  },
  NormalNC = {
    link = 'Normal',
  },
  Pmenu = {
    guifg = M.foreground.GruvboxFg1.guifg,
    guibg = M.background.GruvboxBg1.guifg,
  },
  PmenuSel = {
    guifg = M.background.GruvboxBg1.guifg,
    guibg = M.colors.GruvboxBlue.guifg,
    gui = 'bold',
  },
  PmenuSbar = {
    guibg = M.background.GruvboxBg1.guifg,
  },
  PmenuThumb = {
    guibg = M.background.GruvboxBg4.guifg,
  },
  Question = {
    link = 'GruvboxOrangeBold',
  },
  QuickFixLine = {
    guifg = M.background.GruvboxBg0.guifg,
    guibg = M.colors.GruvboxYellow.guifg,
    gui = 'bold',
  },
  Search = {
    guifg = M.colors.GruvboxYellow.guifg,
    guibg = M.background.GruvboxBg0.guifg,
    gui = 'inverse',
  },
  SpecialKey = {
    link = 'GruvboxFg4',
  },
  SpellRare = {
    link = 'GruvboxPurpleUnderline',
  },
  SpellBad = {
    link = 'GruvboxRedUnderline',
  },
  StatusLine = {
    guifg = M.background.GruvboxBg1.guifg,
    guibg = M.foreground.GruvboxFg1.guifg,
    gui = 'inverse',
  },
  StatusLineNC = {
    guifg = M.background.GruvboxBg0.guifg,
    guibg = M.foreground.GruvboxFg4.guifg,
    gui = 'inverse',
  },
  TabLine = {
    guifg = M.background.GruvboxBg4.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  TabLineFill = {
    guifg = M.background.GruvboxBg4.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  TabLineSel = {
    guifg = M.colors.GruvboxGreen.guifg,
    guibg = M.background.GruvboxBg0.guifg,
  },
  Title = {
    link = 'GruvboxGreenBold',
  },
  Visual = {
    guibg = M.background.GruvboxBg3.guifg,
    gui = 'inverse',
  },
  VisualNOS = {
    link = 'Visual',
  },
  WarningMsg = {
    link = 'GruvboxRedBold',
  },
  WildMenu = {
    guifg = M.colors.GruvboxBlue.guifg,
    guibg = M.background.GruvboxBg1.guifg,
    gui = 'bold',
  },
  HighlightYank = {
    link = 'GruvboxRedBold',
  },
}

M.languages = {
  Constant = {
    link = 'GruvboxPurple',
  },
  String = {
    guifg = M.colors.GruvboxGreen.guifg,
    gui = 'italic',
  },
  Character = {
    link = 'GruvboxPurple',
  },
  Number = {
    link = 'GruvboxPurple',
  },
  Boolean = {
    link = 'GruvboxPurple',
  },
  Float = {
    link = 'GruvboxPurple',
  },
  Identifier = {
    link = 'GruvboxBlue',
  },
  Function = {
    link = 'GruvboxAqua',
  },
  Statement = {
    link = 'GruvboxRed',
  },
  Conditional = {
    link = 'GruvboxRed',
  },
  Repeat = {
    link = 'GruvboxRed',
  },
  Label = {
    link = 'GruvboxRed',
  },
  Operator = {
    link = 'GruvboxFg1',
  },
  Keyword = {
    link = 'GruvboxRed',
  },
  Exception = {
    link = 'GruvboxRed',
  },
  PreProc = {
    link = 'GruvboxAqua',
  },
  Type = {
    link = 'GruvboxYellow',
  },
  StorageClass = {
    link = 'GruvboxOrange',
  },
  Structure = {
    link = 'GruvboxAqua',
  },
  Typedef = {
    link = 'GruvboxYellow',
  },
  Special = {
    link = 'GruvboxOrange',
  },
  SpecialChar = {
    link = 'GruvboxRed',
  },
  Tag = {
    link = 'GruvboxAquaBold',
  },
  Delimiter = {
    link = 'Special',
  },
  Debug = {
    link = 'GruvboxRed',
  },
  Underlined = {
    guifg = M.colors.GruvboxBlue.guifg,
    gui = 'underline',
  },
  Bold = {
    gui = 'bold',
  },
  Italic = {
    gui = 'italic',
  },
  Ignore = {},
  Error = {
    guifg = M.colors.GruvboxRed.guifg,
    gui = { 'bold', 'underline' },
  },
  Todo = {
    guifg = M.foreground.GruvboxFg0.guifg,
    gui = { 'bold', 'italic' },
  },
}

M.lsp_groups = {
  LspReferenceRead = {
    link = 'GruvboxYellowBold',
  },
  LspReferenceText = {
    link = 'GruvboxYellowBold',
  },
  LspReferenceWrite = {
    link = 'GruvboxYellowBold',
  },


  LspFloatWinBorder = {
    link = 'NormalNC',
  },

  LspCodeLens = {
    link = 'Comment',
  },
  LspSignatureActiveParameter = {
    link = 'GruvboxYellowBold',
  },
}

M.diagnostics = {
  DiagnosticError = {
    link = 'GruvboxRed',
  },
  DiagnosticWarn = {
    link = 'GruvboxYellow',
  },
  DiagnosticInfo = {
    link = 'GruvboxBlue',
  },
  DiagnosticHint = {
    link = 'GruvboxAqua',
  },

  DiagnosticUnderlineHint = {
    link = 'GruvboxAquaUnderline',
  },
  DiagnosticUnderlineError = {
    link = 'GruvboxRedUnderline',
  },
  DiagnosticUnderlineWarn = {
    link = 'GruvboxYellowUnderline',
  },
  DiagnosticUnderlineInfo = {
    link = 'GruvboxBlueUnderline',
  },

  DiagnosticSignError = {
    link = 'GruvboxRedSign',
  },
  DiagnosticSignWarn = {
    link = 'GruvboxYellowSign',
  },
  DiagnosticSignInfo = {
    link = 'GruvboxBlueSign',
  },
  DiagnosticSignHint = {
    link = 'GruvboxAquaSign',
  },
}

M.treesitter = {
  TSNone = {},
  TSEmphasis = {},
  TSUnderline = {
    link = 'Underlined',
  },
  TSStrong = {
    link = 'Bold',
  },
  TSVariableBuiltin = {
    link = 'Special',
  },
  TSTagDelimiter = {
    link = 'GruvboxGreen',
  },
  TSTag = {
    link = 'GruvboxOrange',
  },
  TSStructure = {
    link = 'GruvboxOrange',
  },
  TSComment = {
    link = 'Comment',
  },
  TSText = {
    link = 'TSNone',
  },
  TSInclude = {
    link = 'Include',
  },
  TSTypeBuiltin = {
    link = 'Type',
  },
  TSType = {
    link = 'Type',
  },
  TSException = {
    link = 'Exception',
  },
  TSKeywordOperator = {
    link = 'TSOperator',
  },
  TSKeywordFunction = {
    link = 'Keyword',
  },
  TSKeyword = {
    link = 'Keyword',
  },
  TSOperator = {
    link = 'Operator',
  },
  TSLabel = {
    link = 'Label',
  },
  TSRepeat = {
    link = 'Repeat',
  },
  TSConditional = {
    link = 'Conditional',
  },
  TSNamespace = {
    link = 'Include',
  },
  TSAttribute = {
    link = 'PreProc',
  },
  TSAnnotation = {
    link = 'PreProc',
  },
  TSConstructor = {
    link = 'Special',
  },
  TSProperty = {
    link = 'Identifier',
  },
  TSField = {
    link = 'Identifier',
  },
  TSMethod = {
    link = 'Function',
  },
  TSParameterReference = {
    link = 'TSParameter',
  },
  TSParameter = {
    link = 'Identifier',
  },
  TSFuncMacro = {
    link = 'Macro',
  },
  TSFuncBuiltin = {
    link = 'Special',
  },
  TSFunction = {
    link = 'Function',
  },
  TSFloat = {
    link = 'Float',
  },
  TSBoolean = {
    link = 'Boolean',
  },
  TSNumber = {
    link = 'Number',
  },
  TSCharacter = {
    link = 'Character',
  },
  TSStringEscape = {
    link = 'SpecialChar',
  },
  TSStringRegex = {
    link = 'String',
  },
  TSString = {
    link = 'String',
  },
  TSConstMacro = {
    link = 'Define',
  },
  TSConstBuiltin = {
    link = 'Special',
  },
  TSConstant = {
    link = 'Constant',
  },
  TSPunctSpecial = {
    link = 'Delimiter',
  },
  TSPunctBracket = {
    link = 'Delimiter',
  },
  TSPunctDelimiter = {
    link = 'Delimiter',
  },
  TSVariable = {
    link = 'GruvboxFg1',
  },
  TSURI = {
    link = 'Underlined',
  },
  TSLiteral = {
    link = 'String',
  },
  TSTitle = {
    link = 'Title',
  },
  TSError = {
    link = 'Error',
  },
}

M.telescope = {
  TelescopeBorder = {
    link = 'TelescopeNormal',
  },
  TelescopePrompt = {
    link = 'TelescopeNormal',
  },
  TelescopePromptPrefix = {
    link = 'GruvboxRed',
  },
  TelescopeMatching = {
    link = 'GruvboxBlue',
  },
  TelescopePreviewBorder = {
    link = 'TelescopeNormal',
  },
  TelescopeResultsBorder = {
    link = 'TelescopeNormal',
  },
  TelescopePromptBorder = {
    link = 'TelescopeNormal',
  },
  TelescopeNormal = {
    link = 'GruvboxFg1',
  },
  TelescopeMultiSelection = {
    link = 'GruvboxGray',
  },
  TelescopeSlectionCaret = {
    link = 'GruvboxRed',
  },
  TelescopeSelection = {
    link = 'GruvboxOrangeBold',
  },
}

M.gitsigns = {
  GitSignsAdd = {
    link = 'GruvboxGreenSign',
  },
  GitSignsChange = {
    link = 'GruvboxAquaSign',
  },
  GitSignsDelete = {
    link = 'GruvboxRedSign',
  },
  GitSignsCurrentLineBlame = {
    link = 'NonText',
  },
}

M.cmp = {
  CmpItemMenu = {
    link = 'Keyword'
  }
}

M.extras = {
  'let g:indent_blankline_char_highlight_list = ["GruvboxRed", "GruvboxAqua", "GruvboxYellow", "GruvboxPurple", "GruvboxOrange", "GruvboxGreen"]',
  'let g:indent_blankline_context_highlight_list = ["IndentBlanklineChar"]',
  "let g:terminal_color_0 = '#282828'",
  "let g:terminal_color_1 = '#cc241d'",
  "let g:terminal_color_2 = '#98971a'",
  "let g:terminal_color_3 = '#d79921'",
  "let g:terminal_color_4 = '#458588'",
  "let g:terminal_color_5 = '#b16286'",
  "let g:terminal_color_6 = '#689d6a'",
  "let g:terminal_color_7 = '#a89984'",
  "let g:terminal_color_8 = '#928374'",
  "let g:terminal_color_9 = '#fb4934'",
  "let g:terminal_color_10 = '#b8bb26'",
  "let g:terminal_color_11 = '#fabd2f'",
  "let g:terminal_color_12 = '#83a598'",
  "let g:terminal_color_13 = '#d3869b'",
  "let g:terminal_color_14 = '#8ec07c'",
  "let g:terminal_color_15 = '#ebdbb2'",
}

return M
