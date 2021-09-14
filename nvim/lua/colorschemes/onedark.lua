local M = {}

M.__name = 'onedark'

M.colors = {
  OnedarkLightGray = {
    guifg = '#4b5263',
  },
  OnedarkDarkGray = {
    guifg = '#5c6370',
  },
  OnedarkGray = {
    guifg = '#2C323C',
  },
  OnedarkBlue = {
    guifg = '#61afef',
  },
  OnedarkLightRed = {
    guifg = ' #e06c75',
  },
  OnedarkDarkRed = {
    guifg = '#be5046',
  },
  OnedarkLightYellow = {
    guifg = '#e5c07b',
  },
  OnedarkDarkYellow = {
    guifg = '#d19a66',
  },
  OnedarkPurple = {
    guifg = '#c678dd',
  },
  OnedarkGreen = {
    guifg = '#98c379',
  },
  OnedarkAqua = {
    guifg = '#56b6c2',
  },
  OnedarkBlack = {
    guifg = '#282c34',
  },
  OnedarkCyan = {
    guifg = '#56B6C2',
  },
}

local normal = '#ABB2BF'
local vertsplit = '#3E4452'

M.neovim = {
  Comment = {
    guifg = M.colors.OnedarkDarkGray.guifg,
    gui = 'italic',
  },
  ColorColumn = {
    guibg = '#3B3735',
  },
  Conceal = {},
  Cursor = {
    guifg = M.colors.OnedarkBlack.guifg,
    guibg = M.colors.OnedarkBlue.guifg,
  },
  lCursor = {
    link = 'Cursor',
  },
  CursorIM = {
    link = 'Cursor',
  },
  CursorColumn = {
    link = 'OnedarkDarkGray',
  },
  CursorLine = {
    gui = 'underline',
  },
  Directory = {
    link = 'OnedarkBlue',
  },
  DiffAdd = {
    guifg = M.colors.OnedarkGreen.guifg,
    guibg = M.colors.OnedarkBlack.guifg,
  },
  DiffChange = {
    guifg = M.colors.OnedarkLightYellow.guifg,
    gui = 'underline',
  },
  DiffDelete = {
    guifg = M.colors.OnedarkBlack.guifg,
    guibg = M.colors.OnedarkLightRed.guifg,
  },
  DiffText = {
    guifg = M.colors.OnedarkLightYellow.guifg,
    guibg = M.colors.OnedarkBlack.guifg,
  },
  EndOfBuffer = {
    link = 'OnedarkBlack',
  },
  ErrorMsg = {
    link = 'OnedarkLightRed',
  },
  VertSplit = {
    guifg = vertsplit
  },
  Folded = {
    link = 'OnedarkDarkGray',
  },
  FoldColumn = {},
  SignColumn = {},
  IncSearch = {
    guifg = M.colors.OnedarkLightYellow.guifg,
    guibg = M.colors.OnedarkDarkGray.guifg,
  },
  LineNr = {
    guifg = M.colors.OnedarkLightGray.guifg,
  },
  CursorLineNr = {},
  MatchParen = {
    guifg = M.colors.OnedarkBlue.guifg,
    gui = 'underline',
  },
  ModeMsg = {},
  NonText = {
    guibg = '#3B4048',
  },
  Normal = {
    guifg = normal,
  },
  NormalFloat = {
    link = 'Normal',
  },
  NormalNC = {
    link = 'Normal',
  },
  Pmenu = {
    guifg = normal,
    guibg = vertsplit,
  },
  PmenuSel = {
    guifg = M.colors.OnedarkDarkGray.guifg,
    guibg = M.colors.OnedarkBlue.guifg,
  },
  PmenuSbar = {
    link = 'OnedarkDarkGray',
  },
  PmenuThumb = {
    link = 'Normal'
  },
  Question = {
    link = 'OnedarkPurple',
  },
  QuickFixLine = {
    guifg = M.colors.OnedarkBlack.guifg,
    guibg = M.colors.OnedarkLightYellow.guifg,
  },
  Search = {
    guifg = M.colors.OnedarkBlack.guifg,
    guibg = M.colors.OnedarkLightYellow.guifg,
  },
  SpecialKey = {
    link = 'NonText'
  },
  SpellRare = {
    link = 'OnedarkDarkYellow',
  },
  SpellBad = {
    guifg = M.colors.OnedarkLightRed.guifg,
    gui = 'underline',
  },
  StatusLine = {
    guifg = M.colors.OnedarkDarkGray.guifg,
    guibg = M.colors.OnedarkDarkGray.guifg,
  },
  StatusLineNC = {
    guifg = M.colors.OnedarkDarkGray.guifg,
  },
  TabLine = {
    guifg = M.colors.OnedarkDarkGray.guifg,
  },
  TabLineFill = {},
  TabLineSel = {
    guifg = M.colors.OnedarkDarkGray.guifg,
  },
  Title = {
    link = 'OnedarkGreen',
  },
  Visual = {
    guibg = vertsplit,
  },
  VisualNOS = {
    link = 'Visual',
  },
  WarningMsg = {
    link = 'OnedarkLightYellow'
  },
  WildMenu = {
    guifg = M.colors.OnedarkBlack.guifg,
    guibg = M.colors.OnedarkBlue.guifg,
  },
  HighlightYank = {
    link = 'OnedarkDarkRed',
  },
}

M.languages = {
  Constant = {
    link = 'OnedarkCyan',
  },
  String = {
    guifg = M.colors.OnedarkGreen.guifg,
    gui = 'italic',
  },
  Character = {
    link = 'OnedarkGreen',
  },
  Number = {
    link = 'OnedarkDarkYellow',
  },
  Boolean = {
    link = 'OnedarkDarkYellow',
  },
  Float = {
    link = 'OnedarkDarkYellow',
  },
  Identifier = {
    link = 'OnedarkLightRed',
  },
  Function = {
    link = 'OnedarkBlue',
  },
  Statement = {
    link = 'OnedarkPurple',
  },
  Conditional = {
    link = 'OnedarkPurple',
  },
  Repeat = {
    link = 'OnedarkPurple',
  },
  Label = {
    link = 'OnedarkPurple',
  },
  Operator = {
    link = 'OnedarkPurple',
  },
  Keyword = {
    link = 'OnedarkDarkRed',
  },
  Exception = {
    link = 'OnedarkPurple',
  },
  PreProc = {
    link = 'OnedarkLightYellow',
  },
  Type = {
    link = 'OnedarkLightYellow',
  },
  StorageClass = {
    link = 'OnedarkLightYellow',
  },
  Structure = {
    link = 'OnedarkLightYellow',
  },
  Typedef = {
    link = 'OnedarkLightYellow',
  },
  Special = {
    guifg = 'OnedarkBlue',
  },
  SpecialChar = {
    link = 'OnedarkDarkYellow',
  },
  Tag = {},
  Delimiter = {},
  Debug = {},
  Underlined = {
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
    guifg = M.colors.OnedarkLightRed.guifg,
    gui = { 'bold', 'underline' },
  },
  Todo = {
    guifg = M.colors.OnedarkPurple.guifg,
    gui = { 'bold', 'italic' },
  },
}

M.lsp_groups = {
  LspReferenceRead = {
    link = 'OnedarkDarkYellow',
  },
  LspReferenceText = {
    link = 'OnedarkDarkYellow',
  },
  LspReferenceWrite = {
    link = 'OnedarkDarkYellow',
  },

  LspDiagnosticsDefaultError = {
    link = 'OnedarkLightRed',
  },
  LspDiagnosticsDefaultWarning = {
    link = 'OnedarkLightYellow',
  },
  LspDiagnosticsDefaultInformation = {
    link = 'OnedarkBlue',
  },
  LspDiagnosticsDefaultHint = {
    link = 'OnedarkCyan',
  },

  LspDiagnosticsVirtualTextError = {
    link = 'OnedarkLightRed',
  },
  LspDiagnosticsVirtualTextWarning = {
    link = 'OnedarkLightYellow',
  },
  LspDiagnosticsVirtualTextInformation = {
    link = 'OnedarkBlue',
  },
  LspDiagnosticsVirtualTextHint = {
    link = 'OnedarkCyan',
  },

  LspDiagnosticsUnderlineHint = {
    guifg = M.colors.OnedarkCyan.guifg,
    gui = 'underline',
  },
  LspDiagnosticsUnderlineError = {
    guifg = M.colors.OnedarkLightRed.guifg,
    gui = 'underline',
  },
  LspDiagnosticsUnderlineWarning = {
    guifg = M.colors.OnedarkLightYellow.guifg,
    gui = 'underline',
  },
  LspDiagnosticsUnderlineInformation = {
    guifg = M.colors.OnedarkBlue.guifg,
    gui = 'underline',
  },

  LspDiagnosticsFloatingError = {
    link = 'OnedarkLightRed',
  },
  LspDiagnosticsFloatingWarning = {
    link = 'OnedarkLightYellow',
  },
  LspDiagnosticsFloatingInformation = {
    link = 'OnedarkBlue',
  },
  LspDiagnosticsFloatingHint = {
    link = 'OnedarkCyan',
  },

  LspDiagnosticsSignError = {
    link = 'OnedarkLightRed',
  },
  LspDiagnosticsSignWarning = {
    link = 'OnedarkLightYellow',
  },
  LspDiagnosticsSignInformation = {
    link = 'OnedarkBlue',
  },
  LspDiagnosticsSignHint = {
    link = 'OnedarkCyan',
  },

  LspFloatWinBorder = {
    link = 'NormalNC',
  },

  LspCodeLens = {
    link = 'Comment',
  },
  LspSignatureHl = {
    link = 'OnedarkDarkYellow',
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
    link = 'OnedarkGreen',
  },
  TSTag = {
    link = 'OnedarkLightRed',
  },
  TSStructure = {
    link = 'OnedarkLightRed',
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
    link = 'Special',
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
    link = 'NormalFloat',
  },
  TelescopePrompt = {
    link = 'NormalFloat',
  },
  TelescopePromptPrefix = {
    link = 'OnedarkLightRed',
  },
  TelescopeMatching = {
    link = 'OnedarkBlue',
  },
  TelescopePreviewBorder = {
    link = 'NormalFloat',
  },
  TelescopeResultsBorder = {
    link = 'NormalFloat',
  },
  TelescopePromptBorder = {
    link = 'NormalFloat',
  },
  TelescopeNormal = {
    link = 'NormalFloat',
  },
  TelescopeMultiSelection = {
    link = 'OnedarkLightGray',
  },
  TelescopeSlectionCaret = {
    link = 'OnedarkLightRed',
  },
  TelescopeSelection = {
    link = 'OnedarkDarkRed',
  },
}

M.gitsigns = {
  GitSignsAdd = {
    link = 'OnedarkGreen',
  },
  GitSignsChange = {
    link = 'OnedarkLightYellow',
  },
  GitSignsDelete = {
    link = 'OnedarkLightRed',
  },
  GitSignsCurrentLineBlame = {
    link = 'NonText',
  },
}

M.extras = {
  'let g:indent_blankline_char_highlight_list = ["OnedarkLightRed", "OnedarkBlue", "OnedarkLightYellow", "OnedarkPurple", "OnedarkDarkRed", "OnedarkGreen"]',
  'let g:indent_blankline_context_highlight_list = ["IndentBlanklineChar"]',
}

return M
