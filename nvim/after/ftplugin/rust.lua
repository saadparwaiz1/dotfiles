local util = require('util')

local opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
          use_telescope = true
        },
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = "<-",
          other_hints_prefix  = "",
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
        },
        hover_actions = {
          border = util.config.border,
        }
    },
    server = {
      on_attach = util.lsp.on_attach,
      capabilities = util.lsp.capabilities
    }
}

require('rust-tools').setup(opts)
