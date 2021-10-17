vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_filetype_exclude = {
  'help',
  'markdown',
  'man',
  'packer',
}
vim.g.indent_blankline_space_char_blankline = ' '
vim.g.indent_blankline_strict_tabs = false
vim.g.indent_blankline_show_current_context = false
vim.g.indent_blankline_context_patterns = {
  'class',
  'function',
  'method',
  '^if',
  'while',
  'for',
  'with',
  'func_literal',
  'block',
}
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
