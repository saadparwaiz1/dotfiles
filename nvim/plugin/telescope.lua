local telescope = require('telescope')
telescope.setup({
  defaults = {
    prompt_prefix = '🔍 ',
    set_env = {['COLORTERM']='truecolor'},
    mappings = {
      i = {
        ['<Esc>'] = require('telescope.actions').close
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      case_mode = "smart_case",
      override_file_sorter = true,
      override_generic_sorter = true,
    }
  }
})

telescope.load_extension('fzf')
