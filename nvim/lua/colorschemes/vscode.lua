vscNone = nil
vscFront = "#D4D4D4"
vscBack = "#1E1E1E"
vscTabCurrent = "#1E1E1E"
vscTabOther = "#2D2D2D"
vscTabOutside = "#252526"
vscLeftDark = "#252526"
vscLeftMid = "#373737"
vscLeftLight = "#636369"
vscPopupFront = "#BBBBBB"
vscPopupBack = "#272727"
vscPopupHighlightBlue = "#004b72"
vscPopupHighlightGray = "#343B41"
vscSplitLight = "#898989"
vscSplitDark = "#444444"
vscSplitThumb = "#424242"
vscCursorDarkDark = "#222222"
vscCursorDark = "#51504F"
vscCursorLight = "#AEAFAD"
vscSelection = "#264F78"
vscLineNumber = "#5A5A5A"
vscDiffRedDark = "#4B1818"
vscDiffRedLight = "#6F1313"
vscDiffRedLightLight = "#FB0101"
vscDiffGreenDark = "#373D29"
vscDiffGreenLight = "#4B5632"
vscSearchCurrent = "#515c6a"
vscSearch = "#613315"
vscContext = "#404040"
vscContextCurrent = "#707070"
vscGray = "#808080"
vscViolet = "#646695"
vscBlue = "#569CD6"
vscDarkBlue = "#223E55"
vscMediumBlue = "#18a2fe"
vscLightBlue = "#9CDCFE"
vscGreen = "#6A9955"
vscBlueGreen = "#4EC9B0"
vscLightGreen = "#B5CEA8"
vscRed = "#F44747"
vscOrange = "#CE9178"
vscLightRed = "#D16969"
vscYellowOrange = "#D7BA7D"
vscYellow = "#DCDCAA"
vscPink = "#C586C0"

local colorscheme = {
  Normal = { fg = vscFront, bg = vscBack },
  ColorColumn = { bg = vscCursorDarkDark },
  Cursor = {
    fg = vscCursorDark,
    bg = vscCursorLight,
  },
  CursorLine = { bg = vscCursorDarkDark },
  CursorColumn = { bg = vscCursorDarkDark },
  Directory = { fg = vscBlue, bg = vscBack },
  DiffAdd = { bg = vscDiffGreenLight },
  DiffChange = { bg = vscDiffRedDark },
  DiffDelete = { bg = vscDiffRedLight },
  DiffText = { bg = vscDiffRedLight },
  EndOfBuffer = { fg = vscBack },
  ErrorMsg = { fg = vscRed, bg = vscBack },
  VertSplit = {
    fg = vscSplitDark,
    bg = vscBack,
  },
  Folded = {
    fg = vscLeftLight,
    bg = vscLeftDark,
    underline = true,
  },
  FoldColumn = {
    fg = vscLineNumber,
    bg = vscBack,
  },
  SignColumn = { bg = vscBack },
  IncSearch = {
    fg = vscNone,
    bg = vscSearchCurrent,
  },
  LineNr = { fg = vscLineNumber, bg = vscBack },
  CursorLineNr = {
    fg = vscPopupFront,
    bg = vscBack,
  },
  MatchParen = {
    fg = vscNone,
    bg = vscCursorDark,
  },
  ModeMsg = { fg = vscFront, bg = vscLeftDark },
  MoreMsg = { fg = vscFront, bg = vscLeftDark },
  NonText = {
    fg = vscLineNumber,
    bg = vscBack,
  },
  Pmenu = {
    fg = vscPopupFront,
    bg = vscPopupBack,
  },
  PmenuSel = {
    fg = vscPopupFront,
    bg = vscPopupHighlightBlue,
  },
  PmenuSbar = { bg = vscPopupHighlightGray },
  PmenuThumb = { bg = vscPopupFront },
  Question = { fg = vscBlue, bg = vscBack },
  Search = { fg = vscNone, bg = vscSearch },
  SpecialKey = { fg = vscBlue, bg = vscNone },
  StatusLine = {
    fg = vscFront,
    bg = vscLeftMid,
  },
  StatusLineNC = {
    fg = vscFront,
    bg = vscLeftDark,
  },
  TabLine = { fg = vscFront, bg = vscTabOther },
  TabLineFill = {
    fg = vscFront,
    bg = vscTabOutside,
  },
  TabLineSel = {
    fg = vscFront,
    bg = vscTabCurrent,
  },
  Title = { fg = vscNone, bg = vscNone, bold = true },
  Visual = { fg = vscNone, bg = vscSelection },
  VisualNOS = {
    fg = vscNone,
    bg = vscSelection,
  },
  WarningMsg = {
    fg = vscRed,
    bg = vscBack,
    bold = true,
  },
  WildMenu = {
    fg = vscNone,
    bg = vscSelection,
  },
  Comment = {
    fg = vscGreen,

    italic = true,
  },
  Constant = { fg = vscBlue },
  String = { fg = vscOrange },
  Character = { fg = vscOrange },
  Number = { fg = vscLightGreen },
  Boolean = { fg = vscBlue },
  Float = { fg = vscLightGreen },
  Identifier = { fg = vscLightBlue },
  Function = { fg = vscYellow },
  Statement = { fg = vscPink },
  Conditional = { fg = vscPink },
  Repeat = { fg = vscPink },
  Label = { fg = vscPink },
  Operator = { fg = vscFront },
  Keyword = { fg = vscPink },
  Exception = { fg = vscPink },
  PreProc = { fg = vscPink },
  Include = { fg = vscPink },
  Define = { fg = vscPink },
  Macro = { fg = vscPink },
  Type = { fg = vscBlue },
  StorageClass = { fg = vscBlue },
  Structure = { fg = vscBlue },
  Typedef = { fg = vscBlue },
  Special = { fg = vscYellowOrange },
  SpecialChar = { fg = vscFront },
  Tag = { fg = vscFront },
  Delimiter = { fg = vscFront },
  SpecialComment = { fg = vscGreen },
  Debug = { fg = vscFront },
  Underlined = { fg = vscNone, underline = true },
  Conceal = { fg = vscFront, bg = vscBack },
  Ignore = { fg = vscFront },
  Error = {
    fg = vscRed,
    bg = vscBack,
    undercurl = true,
    sp = vscRed,
  },
  Todo = {
    fg = vscYellowOrange,
    bg = vscBack,
    bold = true,
  },
  SpellBad = {
    fg = vscRed,
    bg = vscBack,
    undercurl = true,
    sp = vscRed,
  },
  SpellCap = {
    fg = vscRed,
    bg = vscBack,
    undercurl = true,
    sp = vscRed,
  },
  SpellRare = {
    fg = vscRed,
    bg = vscBack,
    undercurl = true,
    sp = vscRed,
  },
  SpellLocal = {
    fg = vscRed,
    bg = vscBack,
    undercurl = true,
    sp = vscRed,
  },
  Whitespace = {
    fg = vscLineNumber,
  },

  -- Treesitter
  TSError = { fg = vscRed },
  TSPunctBracket = { fg = vscFront },
  TSPunctSpecial = { fg = vscFront },
  markdownTSPunctSpecial = {
    fg = vscBlue,

    bold = true,
  },
  TSConstant = { fg = vscYellow },
  TSConstBuiltin = { fg = vscBlue },
  TSConstMacro = { fg = vscBlueGreen },
  TSStringRegex = { fg = vscOrange },
  TSString = { fg = vscOrange },
  TSCharacter = { fg = vscOrange },
  TSNumber = { fg = vscLightGreen },
  TSBoolean = { fg = vscBlue },
  TSFloat = { fg = vscLightGreen },
  TSAnnotation = { fg = vscYellow },
  TSAttribute = { fg = vscBlueGreen },
  TSNamespace = { fg = vscBlueGreen },
  TSFuncBuiltin = { fg = vscYellow },
  TSFunction = { fg = vscYellow },
  TSFuncMacro = { fg = vscYellow },
  TSParameter = { fg = vscLightBlue },
  TSParameterReference = {
    fg = vscLightBlue,
  },
  TSMethod = { fg = vscYellow },
  TSField = { fg = vscLightBlue },
  TSProperty = { fg = vscLightBlue },
  TSConstructor = { fg = vscBlueGreen },
  TSConditional = { fg = vscPink },
  TSRepeat = { fg = vscPink },
  TSLabel = { fg = vscLightBlue },
  TSKeyword = { fg = vscBlue },
  TSKeywordFunction = { fg = vscBlue },
  TSKeywordOperator = { fg = vscBlue },
  TSOperator = { fg = vscFront },
  TSException = { fg = vscPink },
  TSType = { fg = vscBlueGreen },
  TSTypeBuiltin = { fg = vscBlue },
  TSStructure = { fg = vscLightBlue },
  TSInclude = { fg = vscPink },
  TSVariable = { fg = vscLightBlue },
  TSVariableBuiltin = { fg = vscLightBlue },
  TSText = { fg = vscFront },
  TSUnderline = { fg = vscYellowOrange },
  TSTag = { fg = vscBlue },
  TSTagDelimiter = { fg = vscGray },

  TSTitle = {
    fg = isDark and vscBlue or vscYellowOrange,

    bold = true,
  },
  TSLiteral = { fg = vscFront },
  TSEmphasis = { fg = vscFront, italic = true },
  TSStrong = {
    fg = isDark and vscBlue or vscViolet,

    bold = true,
  },
  TSURI = { fg = vscFront },
  TSTextReference = {
    fg = vscOrange,
  },
  TSPunctDelimiter = { fg = vscFront },
  TSStringEscape = {
    fg = vscOrange,

    bold = true,
  },

  TSNote = { fg = vscBlueGreen, bold = true },
  TSWarning = { fg = vscYellowOrange, bold = true },
  TSDanger = { fg = vscRed, bold = true },
  CmpItemKindVariable = {
    fg = vscLightBlue,
  },
  CmpItemKindInterface = {
    fg = vscLightBlue,
  },
  CmpItemKindText = { fg = vscLightBlue },
  CmpItemKindFunction = { fg = vscPink },
  CmpItemKindMethod = { fg = vscPink },
  CmpItemKindKeyword = { fg = vscFront },
  CmpItemKindProperty = { fg = vscFront },
  CmpItemKindUnit = { fg = vscFront },
  CmpItemKindConstructor = {
    fg = vscUiOrange,
  },
  CmpItemMenu = { fg = vscPopupFront },
  CmpItemAbbr = { fg = vscFront },
  CmpItemAbbrDeprecated = {
    fg = vscCursorDark,
    bg = vscPopupBack,
    strikethrough = true,
  },
  CmpItemAbbrMatch = {
    fg = vscMediumBlue,
    bold = true,
  },
  CmpItemAbbrMatchFuzzy = {
    fg = vscMediumBlue,
    bold = true,
  },

  TelescopePromptBorder = {
    fg = vscLineNumber,
  },
  TelescopeResultsBorder = {
    fg = vscLineNumber,
  },
  TelescopePreviewBorder = {
    fg = vscLineNumber,
  },
  TelescopeNormal = { fg = vscFront },
  TelescopeSelection = {
    fg = vscFront,
    bg = vscPopupHighlightBlue,
  },
  TelescopeMultiSelection = {
    fg = vscFront,
    bg = vscPopupHighlightBlue,
  },
  TelescopeMatching = {
    fg = vscMediumBlue,
    bold = true,
  },
  TelescopePromptPrefix = { fg = vscFront },
  LspDiagnosticsDefaultError = { link = "DiagnosticError" },
  LspDiagnosticsDefaultHint = { link = "DiagnosticHint" },
  LspDiagnosticsDefaultInformation = { link = "DiagnosticInfo" },
  LspDiagnosticsDefaultWarning = { link = "DiagnosticWarn" },
  LspDiagnosticsUnderlineError = { link = "DiagnosticUnderlineError" },
  LspDiagnosticsUnderlineHint = { link = "DiagnosticUnderlineHint" },
  LspDiagnosticsUnderlineInformation = { link = "DiagnosticUnderlineInfo" },
  LspDiagnosticsUnderlineWarning = { link = "DiagnosticUnderlineWarn" },
  DiagnosticError = { fg = vscRed },
  DiagnosticWarn = { fg = vscYellow },
  DiagnosticInfo = { fg = vscBlue },
  DiagnosticHint = { fg = vscBlue },
  DiagnosticUnderlineError = {
    undercurl = true,
    sp = vscRed,
  },
  DiagnosticUnderlineWarn = {
    undercurl = true,
    sp = vscYellow,
  },
  DiagnosticUnderlineInfo = {
    undercurl = true,
    sp = vscBlue,
  },
  DiagnosticUnderlineHint = {
    undercurl = true,
    sp = vscBlue,
  },
  LspReferenceText = { bg = vscPopupHighlightGray },
  LspReferenceRead = {
    bg = vscPopupHighlightGray,
  },
  LspReferenceWrite = {
    bg = vscPopupHighlightGray,
  },
}

return { colorscheme = colorscheme, __name = "vscode" }
