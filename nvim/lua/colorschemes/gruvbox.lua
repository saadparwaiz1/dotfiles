local GruvboxFg0 = { fg = "#FBF0C6" }
local GruvboxFg1 = { fg = "#EBDBB2" }
local GruvboxFg4 = { fg = "#A89985" }
local GruvboxBg0 = { fg = "#292929" }
local GruvboxBg1 = { fg = "#3B3735" }
local GruvboxBg2 = { fg = "#4F4945" }
local GruvboxBg3 = { fg = "#655B53" }
local GruvboxBg4 = { fg = "#7D6F64" }
local GruvboxGray = { fg = "#918273" }
local GruvboxBlue = { fg = "#83A598" }
local GruvboxRed = { fg = "#FB4632" }
local GruvboxYellow = { fg = "#FABD2E" }
local GruvboxPurple = { fg = "#D4879C" }
local GruvboxGreen = { fg = "#B8BA26" }
local GruvboxAqua = { fg = "#8EC07C" }
local GruvboxOrange = { fg = "#FE811B" }
local GruvboxPink = { fg = "#D4879C" }

local GruvboxYellowUnderline = { sp = GruvboxYellow.fg, undercurl = true }
local GruvboxBlueUnderline = { sp = GruvboxBlue.fg, undercurl = true }
local GruvboxPurpleUnderline = { sp = GruvboxPurple.fg, undercurl = true }
local GruvboxAquaUnderline = { sp = GruvboxAqua.fg, undercurl = true }
local GruvboxRedUnderline = { sp = GruvboxRed.fg, undercurl = true }
local GruvboxRedBold = { fg = GruvboxRed.fg, bold = true }
local GruvboxGreenBold = { fg = GruvboxGreen.fg, bold = true }
local GruvboxYellowBold = { fg = GruvboxYellow.fg, bold = true }
local GruvboxAquaBold = { fg = GruvboxAqua.fg, bold = true }
local GruvboxOrangeBold = { fg = GruvboxOrange.fg, bold = true }
local GruvboxRedSign = { fg = GruvboxRed.fg, bg = GruvboxBg0.fg }
local GruvboxGreenSign = { fg = GruvboxGreen.fg, bg = GruvboxBg0.fg }
local GruvboxYellowSign = { fg = GruvboxYellow.fg, bg = GruvboxBg0.fg }
local GruvboxBlueSign = { fg = GruvboxBlue.fg, bg = GruvboxBg0.fg }
local GruvboxAquaSign = { fg = GruvboxAqua.fg, bg = GruvboxBg0.fg }

local colorscheme = {
  Comment = {
    fg = GruvboxGray.fg,
    italic = true,
  },
  ColorColumn = {
    fg = GruvboxBg1.fg,
    bg = GruvboxFg1.fg,
    reverse = true,
  },
  Cursor = {
    reverse = true,
  },
  CursorLine = {
    bg = GruvboxBg0.fg,
  },
  DiffAdd = {
    fg = GruvboxGreen.fg,
    bg = GruvboxBg0.fg,
  },
  DiffChange = {
    fg = GruvboxAqua.fg,
    bg = GruvboxBg0.fg,
  },
  DiffDelete = {
    fg = GruvboxRed.fg,
    bg = GruvboxBg0.fg,
  },
  DiffText = {
    fg = GruvboxYellow.fg,
    bg = GruvboxBg0.fg,
  },
  ErrorMsg = {
    fg = GruvboxBg0.fg,
    bg = GruvboxRed.fg,
    bold = true,
  },
  VertSplit = {
    fg = GruvboxBg3.fg,
    bg = GruvboxBg0.fg,
  },
  Folded = {
    fg = GruvboxGray.fg,
    bg = GruvboxBg0.fg,
  },
  FoldColumn = {
    fg = GruvboxGray.fg,
    bg = GruvboxBg0.fg,
  },
  SignColumn = {
    bg = GruvboxBg0.fg,
  },
  IncSearch = {
    fg = GruvboxOrange.fg,
    bold = true,
  },
  CursorLineNr = {
    fg = GruvboxYellow.fg,
    bg = GruvboxBg0.fg,
  },
  Normal = {
    fg = GruvboxFg1.fg,
    bg = GruvboxBg0.fg,
  },
  Pmenu = {
    fg = GruvboxFg1.fg,
    bg = GruvboxBg1.fg,
  },
  PmenuSel = {
    fg = GruvboxBg1.fg,
    bg = GruvboxBlue.fg,
    bold = true,
  },
  PmenuSbar = {
    bg = GruvboxBg1.fg,
  },
  PmenuThumb = {
    bg = GruvboxBg4.fg,
  },
  QuickFixLine = {
    fg = GruvboxBg0.fg,
    bg = GruvboxYellow.fg,
    bold = true,
  },
  Search = {
    fg = GruvboxYellow.fg,
    bold = true,
  },
  StatusLine = {
    fg = GruvboxBg1.fg,
    bg = GruvboxFg1.fg,
    reverse = true,
  },
  StatusLineNC = {
    fg = GruvboxBg0.fg,
    bg = GruvboxFg4.fg,
    reverse = true,
  },
  TabLine = {
    fg = GruvboxBg4.fg,
    bg = GruvboxBg0.fg,
  },
  TabLineFill = {
    fg = GruvboxBg4.fg,
    bg = GruvboxBg0.fg,
  },
  TabLineSel = {
    fg = GruvboxGreen.fg,
    bg = GruvboxBg0.fg,
  },
  WildMenu = {
    fg = GruvboxBlue.fg,
    bg = GruvboxBg1.fg,
    bold = true,
  },
  Visual = {
    fg = GruvboxOrangeBold.fg,
    bold = true,
  },
  String = {
    fg = GruvboxGreen.fg,
    italic = true,
  },
  Underlined = {
    fg = GruvboxBlue.fg,
    underline = true,
  },
  Bold = {
    bold = true,
  },
  Italic = {
    italic = true,
  },
  Ignore = {},
  Error = {
    fg = GruvboxRed.fg,
    bold = true,
    underline = true,
  },
  Todo = {
    fg = GruvboxFg0.fg,
    bold = true,
    underline = true,
  },
  Conceal = GruvboxOrange,
  Directory = GruvboxGreenBold,
  LineNr = GruvboxBg4,
  MatchParen = GruvboxYellowBold,
  ModeMsg = GruvboxYellowBold,
  NonText = GruvboxBg2,
  Question = GruvboxOrangeBold,
  SpecialKey = GruvboxFg4,
  SpellRare = GruvboxPurpleUnderline,
  SpellBad = GruvboxRedUnderline,
  Title = GruvboxGreenBold,
  WarningMsg = GruvboxRedBold,
  HighlightYank = GruvboxRedBold,
  Constant = GruvboxPurple,
  Character = GruvboxPurple,
  Number = GruvboxPurple,
  Boolean = GruvboxPurple,
  Float = GruvboxPurple,
  Identifier = GruvboxBlue,
  Function = GruvboxAqua,
  Statement = GruvboxRed,
  Conditional = GruvboxRed,
  Repeat = GruvboxRed,
  Label = GruvboxRed,
  Operator = GruvboxOrange,
  Keyword = GruvboxRed,
  Exception = GruvboxRed,
  PreProc = GruvboxAqua,
  Type = GruvboxYellow,
  StorageClass = GruvboxOrange,
  Structure = GruvboxAqua,
  Typedef = GruvboxYellow,
  Special = GruvboxOrange,
  SpecialChar = GruvboxRed,
  Tag = GruvboxAquaBold,
  Debug = GruvboxRed,
  LspReferenceRead = GruvboxYellowBold,
  LspReferenceText = GruvboxYellowBold,
  LspReferenceWrite = GruvboxYellowBold,
  LspSignatureActiveParameter = GruvboxYellowBold,
  DiagnosticError = GruvboxRed,
  DiagnosticWarn = GruvboxYellow,
  DiagnosticInfo = GruvboxBlue,
  DiagnosticHint = GruvboxAqua,
  DiagnosticUnderlineHint = GruvboxAquaUnderline,
  DiagnosticUnderlineError = GruvboxRedUnderline,
  DiagnosticUnderlineWarn = GruvboxYellowUnderline,
  DiagnosticUnderlineInfo = GruvboxBlueUnderline,
  DiagnosticSignError = GruvboxRedSign,
  DiagnosticSignWarn = GruvboxYellowSign,
  DiagnosticSignInfo = GruvboxBlueSign,
  DiagnosticSignHint = GruvboxAquaSign,
  TSTagDelimiter = GruvboxGreen,
  TSTag = GruvboxOrange,
  TSStructure = GruvboxOrange,
  TelescopePromptPrefix = GruvboxRed,
  TelescopeMatching = GruvboxBlue,
  TelescopeNormal = GruvboxFg1,
  TelescopeMultiSelection = GruvboxGray,
  TelescopeSlectionCaret = GruvboxRed,
  TelescopeSelection = GruvboxOrangeBold,
  GitSignsAdd = GruvboxGreenSign,
  GitSignsChange = GruvboxAquaSign,
  GitSignsDelete = GruvboxRedSign,
  CmpDocumentation = { fg = GruvboxFg0.fg, bg = GruvboxBg0.fg },
  CmpDocumentationBorder = { fg = GruvboxGray.fg, bg = GruvboxBg0.fg },
  CmpItemAbbr = { fg = GruvboxFg0.fg },
  CmpItemAbbrDeprecated = { fg = GruvboxFg0.fg, strikethrough = true },
  CmpItemAbbrMatch = { fg = GruvboxBlue.fg },
  CmpItemAbbrMatchFuzzy = { fg = GruvboxBlue.fg },
  CmpItemKindDefault = { fg = GruvboxGray.fg },
  CmpItemMenu = { fg = GruvboxGray.fg },
  CmpItemKindKeyword = { fg = GruvboxBlue.fg },
  CmpItemKindVariable = { fg = GruvboxPurple.fg },
  CmpItemKindConstant = { fg = GruvboxPurple.fg },
  CmpItemKindReference = { fg = GruvboxPurple.fg },
  CmpItemKindValue = { fg = GruvboxPurple.fg },
  CmpItemKindFunction = { fg = GruvboxOrange.fg },
  CmpItemKindMethod = { fg = GruvboxOrange.fg },
  CmpItemKindConstructor = { fg = GruvboxOrange.fg },
  CmpItemKindClass = { fg = GruvboxPink.fg },
  CmpItemKindInterface = { fg = GruvboxPink.fg },
  CmpItemKindStruct = { fg = GruvboxPink.fg },
  CmpItemKindEvent = { fg = GruvboxPink.fg },
  CmpItemKindEnum = { fg = GruvboxPink.fg },
  CmpItemKindUnit = { fg = GruvboxPink.fg },
  CmpItemKindModule = { fg = GruvboxYellow.fg },
  CmpItemKindProperty = { fg = GruvboxAqua.fg },
  CmpItemKindField = { fg = GruvboxAqua.fg },
  CmpItemKindTypeParameter = { fg = GruvboxAqua.fg },
  CmpItemKindEnumMember = { fg = GruvboxAqua.fg },
  CmpItemKindOperator = { fg = GruvboxAqua.fg },
  CmpItemKindSnippet = { fg = GruvboxGray.fg },
  lCursor = {
    link = "Cursor",
  },
  CursorIM = {
    link = "Cursor",
  },
  CursorColumn = {
    link = "CursorLine",
  },
  EndOfBuffer = {
    link = "NonText",
  },
  NormalFloat = {
    link = "Normal",
  },
  NormalNC = {
    link = "Normal",
  },
  VisualNOS = {
    link = "Visual",
  },
  Delimiter = {
    link = "Special",
  },
  LspFloatWinBorder = {
    link = "NormalNC",
  },

  LspCodeLens = {
    link = "Comment",
  },
  TSNone = {},
  TSDefinitionUsage = {
    link = "LspReferenceRead",
  },
  TSEmphasis = {},
  TSUnderline = {
    link = "Underlined",
  },
  TSStrong = {
    link = "Bold",
  },
  TSVariableBuiltin = {
    link = "Special",
  },
  TSComment = {
    link = "Comment",
  },
  TSText = {
    link = "TSNone",
  },
  TSInclude = {
    link = "Include",
  },
  TSTypeBuiltin = {
    link = "Type",
  },
  TSType = {
    link = "Type",
  },
  TSException = {
    link = "Exception",
  },
  TSKeywordOperator = {
    link = "TSOperator",
  },
  TSKeywordFunction = {
    link = "Keyword",
  },
  TSKeyword = {
    link = "Keyword",
  },
  TSOperator = {
    link = "Operator",
  },
  TSLabel = {
    link = "Label",
  },
  TSRepeat = {
    link = "Repeat",
  },
  TSConditional = {
    link = "Conditional",
  },
  TSNamespace = {
    link = "Include",
  },
  TSAttribute = {
    link = "PreProc",
  },
  TSAnnotation = {
    link = "PreProc",
  },
  TSConstructor = {
    link = "Special",
  },
  TSProperty = {
    link = "Identifier",
  },
  TSField = {
    link = "Identifier",
  },
  TSMethod = {
    link = "Function",
  },
  TSParameterReference = {
    link = "TSParameter",
  },
  TSParameter = {
    link = "Identifier",
  },
  TSFuncMacro = {
    link = "Macro",
  },
  TSFuncBuiltin = {
    link = "Special",
  },
  TSFunction = {
    link = "Function",
  },
  TSFloat = {
    link = "Float",
  },
  TSBoolean = {
    link = "Boolean",
  },
  TSNumber = {
    link = "Number",
  },
  TSCharacter = {
    link = "Character",
  },
  TSStringEscape = {
    link = "SpecialChar",
  },
  TSStringRegex = {
    link = "String",
  },
  TSString = {
    link = "String",
  },
  TSConstMacro = {
    link = "Define",
  },
  TSConstBuiltin = {
    link = "Special",
  },
  TSConstant = {
    link = "Constant",
  },
  TSPunctSpecial = {
    link = "Delimiter",
  },
  TSPunctBracket = {
    link = "Delimiter",
  },
  TSPunctDelimiter = {
    link = "Delimiter",
  },
  TSVariable = {
    link = "GruvboxFg1",
  },
  TSURI = {
    link = "Underlined",
  },
  TSLiteral = {
    link = "String",
  },
  TSTitle = {
    link = "Title",
  },
  TSError = {
    link = "Error",
  },
  TelescopeBorder = {
    link = "TelescopeNormal",
  },
  TelescopePrompt = {
    link = "TelescopeNormal",
  },
  TelescopePreviewBorder = {
    link = "TelescopeNormal",
  },
  TelescopeResultsBorder = {
    link = "TelescopeNormal",
  },
  TelescopePromptBorder = {
    link = "TelescopeNormal",
  },
  GitSignsCurrentLineBlame = {
    link = "NonText",
  },
}

local extras = [[
vim.g.terminal_color_0 = '#282828'
vim.g.terminal_color_1 = '#cc241d'
vim.g.terminal_color_2 = '#98971a'
vim.g.terminal_color_3 = '#d79921'
vim.g.terminal_color_4 = '#458588'
vim.g.terminal_color_5 = '#b16286'
vim.g.terminal_color_6 = '#689d6a'
vim.g.terminal_color_7 = '#a89984'
vim.g.terminal_color_8 = '#928374'
vim.g.terminal_color_9 = '#fb4934'
vim.g.terminal_color_10 = '#b8bb26'
vim.g.terminal_color_11 = '#fabd2f'
vim.g.terminal_color_12 = '#83a598'
vim.g.terminal_color_13 = '#d3869b'
vim.g.terminal_color_14 = '#8ec07c'
vim.g.terminal_color_15 = '#ebdbb2'
]]

return { colorscheme = colorscheme, extras = extras, __name = "gruvbox" }
