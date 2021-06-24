vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.startup({function()
  local lsp_fts = {'python', 'bash', 'sh', 'zsh', 'c', 'cpp', 'lua', 'tex', 'rust'}
  -- plugin manager
  use {
    'wbthomason/packer.nvim'
  }
  -- fuzzy finders
  use {
    'camspiers/snap',
    rocks = {'fzy'},
    module = 'snap'
  }
  use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
      },
      config = function ()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        local chdir = function (br)
          local selected = require('telescope.actions.state').get_selected_entry(br)
          local cwd = selected.cwd
          local ordinal = selected.ordinal
          local selected_dir = require('s.util').path.join(cwd, ordinal)
          vim.api.nvim_set_current_dir(selected_dir)
          require('telescope.actions').close(br)
        end

        telescope.setup {
          defaults = {
            vimgrep_arguments = {
              'rg', '--with-filename', '--line-number', '--column', '--smart-case'
            },
            mappings = {i = {
              ['<Esc>'] = actions.close,
              ['\\optcmdcr'] = chdir
            }},
            prompt_position = 'bottom',
            prompt_prefix = '🔍',
            initial_mode = 'insert',
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal",
            file_sorter = require'telescope.sorters'.get_fzy_sorter,
            generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
            shorten_path = true,
            file_ignore_patterns = {
              "%.pdf", ".git/.*", "node_modules/.*", "__pycache__/.*", "%.swp",
              "%.db", "Caches/.*", '%.png', '%.jpg'
            },
            winblend = 0,
            width = 0.75,
            preview_cutoff = 120,
            results_height = 1,
            results_width = 0.8,
            border = {},
            borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
            color_devicons = true,
            use_less = true,
            set_env = {['COLORTERM'] = 'truecolor'},
            file_previewer = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
            buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker
          },
          extensions = {
            fzf = {
              override_generic_sorter = false,
              override_file_sorter = true,
              case_mode = "smart_case",
            }
          }
        }

        require('telescope').load_extension('fzf')
      end,
      module = 'telescope'
  }
  -- LSP Extensions
  use {
    'hrsh7th/nvim-compe',
    ft = lsp_fts,
    config = function()
      require('compe').setup {
        enabled = true,
        source = {
          path = true,
          spell = true,
          buffer = true,
          nvim_lsp = true,
          nvim_lua = true,
        }
      }
    end,
    requires = {
      {
        'neovim/nvim-lspconfig',
        requires = {'ray-x/lsp_signature.nvim'},
        module = 'lspconfig',
        config = function ()
        vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = {spacing = 5, prefix = ' '},
            signs = true,
            update_in_insert = false
          })

        vim.fn.sign_define("LspDiagnosticsSignError", {text = "✘"})
        vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})
        vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})
        vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
        vim.lsp.handlers["textDocument/hover"] =
          vim.lsp.with(vim.lsp.handlers.hover, {
            border = require('s.util').config.border
          })

        vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = require('s.util').config.border
          })
        vim.lsp.protocol.CompletionItemKind = {
          '', 'ƒ', '',
          '', '', '',
          'ﰮ', '', '',
          '', '', '了',
          '', '﬌', '',
          '', '', '',
          '', '', '',
          'ﬦ', '',
        }
        end,
      },

      {
        'L3MON4D3/LuaSnip',
        module = 'luasnip',
        config = function ()
          vim.api.nvim_set_keymap(
            "i",
            "<Tab>",
            [[luaeval("require('s.util').config.tab_complete()")]],
            {expr=true}
          )
          vim.api.nvim_set_keymap(
            "s",
            "<Tab>",
            [[luaeval("require('s.util').config.tab_complete()")]],
            {expr=true}
          )
          vim.api.nvim_set_keymap(
            "i",
            "<S-Tab>",
            [[luaeval("require('s.util').config.s_tab_complete()")]],
            {expr=true}
          )
          vim.api.nvim_set_keymap(
            "s",
            "<S-Tab>",
            [[luaeval("require('s.util').config.s_tab_complete()")]],
            {expr=true}
          )
        end
      },

      {
        'kosayoda/nvim-lightbulb',
        ft = lsp_fts,
      },

      {
        'simrat39/rust-tools.nvim',
        module = 'rust-tools'
      }
    }
  }

  -- Treesiter Extensions
  use {
    'nvim-treesitter/nvim-treesitter',
    ft = {'lua', 'bash', 'python', 'latex'},
    config = function ()
      local treesitter = require('nvim-treesitter.configs')
      treesitter.setup({
        ensure_installed = {'lua', 'bash', 'python', 'latex'},
        highlight = {enable = true}
      })
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
      vim.g.indent_blankline_show_current_context = true
    end
  }
  -- Enchanced Functionality Plugins
  use {
    'tpope/vim-surround',
    keys = {
      {'n', 'ds'},
      {'n', 'cs'},
      {'n', 'cS'},
      {'n', 'ys'},
      {'n', 'yS'},
      {'n', 'yss'},
      {'n', 'ySs'},
      {'n', 'ySS'},
      {'x', 'S'},
      {'x', 'gS'},
    }
  }
  use {
    'terrortylor/nvim-comment',
    config = function()
      require("nvim_comment").setup()
      vim.api.nvim_set_keymap(
        'n',
        'gc',
        ':set operatorfunc=CommentOperator<CR>g@l',
        {noremap=true, silent=true}
      )
      vim.api.nvim_del_keymap('n', 'gcc')
    end,
    keys = 'gc'
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require('neogit').setup {}
    end,
    cmd = 'Neogit'
  }
  use {
    'steelsojka/pears.nvim',
    config = function()
      require("pears").setup(function(conf)
        conf.preset "tag_matching"
        conf.remove_pair_on_outer_backspace(false)
        conf.on_enter(function(pear_handle)
          if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
            if vim.g.loaded_compe then
              return vim.fn['compe#confirm']('<CR>')
            end
            return vim.api.nvim_replace_termcodes('<C-y>', true, true, true)
          else
            pear_handle()
          end
        end)
      end)
    end
  }
  -- FileType Specific Plugins
  use {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    run = 'cd app && npm install'
  }
  -- UI Related Plugins
  use {
    'glepnir/galaxyline.nvim',
    config = function ()
      require('s.util').config.galaxyline()
    end,
    requires = {
      {
        'kyazdani42/nvim-web-devicons',
        module = 'nvim-web-devicons'
      }
    }
  }
  use {
    'romgrk/barbar.nvim'
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    config = function ()
      vim.g.indent_blankline_char = '│'
      vim.g.indent_blankline_filetype_exclude = {
        'help',
        'defx',
        'markdown',
        'man',
        'packer'
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
        'block'
      }
      vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
    end,
    event = 'BufReadPre'
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end,
    event = 'BufReadPre'
  }
  use {
    'saadparwaiz1/gruvbox-autogenerate',
    config = function ()
    	vim.cmd('colorscheme gruvbox')
    end,
    run = [[nvim -c 'lua require("gruvbox").generate()' -c 'q']]
  }
end, config = {
  display = {
    open_fn = require('packer.util').float
  }
}})
