local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
  filetype = 'org',
}

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'org' },
  },
})

require('orgmode').setup({
  org_agenda_files = { '~/Documents/projects/journal/agenda/' },
  org_default_notes_file = '~/Documents/projects/journal/quick.org',
  org_todo_keywords = { 'TODO(t)', 'WAITING', '|', 'DONE', 'DELEGATED' },
  org_hide_emphasis_markers = true,
  org_highlight_latex_and_related = 'entities',
})

require('org-bullets').setup({
  symbols = { '◉', '○', '✸', '✿' },
})
