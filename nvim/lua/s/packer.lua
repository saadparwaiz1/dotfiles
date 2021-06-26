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
  -- LSP Extensions
  use {
    'hrsh7th/nvim-compe',
    event = 'InsertEnter *',
    config = function()
      require('compe').setup {
        enabled = true,
        source = {
          path = true,
          spell = true,
          buffer = true,
          luasnip = true,
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
        event = 'InsertEnter *',
        config = function ()
          require('s.snippets')
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
    requires = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
        config = function ()
          local treesitter = require('nvim-treesitter.configs')
          treesitter.setup({
            highlight = {enable = true},
            textobjects = {
              select = {
                enable = true,
                keymaps = {
                  ["af"] = "@function.outer",
                  ["if"] = "@function.inner",
                  ["ac"] = "@class.outer",
                  ["ic"] = "@class.inner",
                },
              },
              swap = {
                enable = true,
                swap_next = {
                  ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                  ["<leader>A"] = "@parameter.inner",
                },
              },

              move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                  ["]m"] = "@function.outer",
                  ["]]"] = "@class.outer",
                },
                goto_next_end = {
                  ["]M"] = "@function.outer",
                  ["]["] = "@class.outer",
                },
                goto_previous_start = {
                  ["[m"] = "@function.outer",
                  ["[["] = "@class.outer",
                },
                goto_previous_end = {
                  ["[M"] = "@function.outer",
                  ["[]"] = "@class.outer",
                },
              },
              matchup = {
                enable = true
              },
            },
          })
          vim.wo.foldmethod = 'expr'
          vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
          vim.g.indent_blankline_show_current_context = true
        end
      },
      {
        'romgrk/nvim-treesitter-context',
        after = 'nvim-treesitter',
        config = function ()
          require'treesitter-context.config'.setup{enable = true}
        end
      }
    },
  }
  -- Enchanced Functionality Plugins
  use {
    'machakann/vim-sandwich',
    setup = function ()
      vim.g['sandwich#magicchar#f#patterns'] = {
        {
          header = [[\<\%(\h\k*\.\)*\h\k*]],
          bra    = '(',
          ket    = ')',
          footer = '',
        }
      }
    end,
    config = function ()
      vim.cmd('runtime macros/sandwich/keymap/surround.vim')
    end,
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
    'andymass/vim-matchup',
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
  use{
    'kyazdani42/nvim-tree.lua',
    cmd = 'NvimTreeToggle'
  }
  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle'
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
    run = [[:lua require("gruvbox").generate()]]
  }
end, config = {
  display = {
    open_fn = require('packer.util').float
  }
}})
