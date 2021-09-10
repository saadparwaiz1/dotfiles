local telescope = require('telescope')

telescope.setup({
  defaults = {
    prompt_prefix = '🔍 ',
    set_env = { ['COLORTERM'] = 'truecolor' },
    mappings = {
      i = {
        ['<Esc>'] = 'close',
        ['<Tab>'] = 'toggle_selection'
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      case_mode = 'smart_case',
      override_file_sorter = true,
      override_generic_sorter = true,
    },
  },
})

telescope.load_extension('fzf')
