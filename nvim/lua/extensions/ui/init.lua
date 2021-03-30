vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_filetype_exclude = { 'help', 'defx', 'markdown', 'man' }
vim.g.indent_blankline_space_char_blankline = ' '
vim.g.indent_blankline_strict_tabs = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_highlight = 'TSIndentContext'
vim.g.indent_blankline_context_patterns = {'class', 'function', 'method', '^if', 'while', 'for', 'with', 'func_literal', 'block', }

require('lspkind').init {
    with_text = true,
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
}
