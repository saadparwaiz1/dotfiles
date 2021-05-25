vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.startup(function()
  local lsp_fts = {'python', 'bash', 'sh', 'zsh', 'c', 'cpp', 'lua', 'tex', 'rust'}
  -- plugin manager
  use {
    'wbthomason/packer.nvim'
  }
  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {
        'kyazdani42/nvim-web-devicons',
        module = 'nvim-web-devicons'
      },
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    },
    config = function ()
    	require('extensions/fuzzy')
    end,
    keys = {
      {'n', '\\cmdf'},
      {'n', '\\cmdl'},
      {'n', '\\cmdy'},
      {'n', '\\optcmdb'},
      {'n', '<leader>gf'},
      {'n', '<leader>gc'},
      {'n', '<leader>gb'},
      {'n', '<leader>gs'}
    }
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
          snippets_nvim = true
        }
      }
      vim.api.nvim_set_keymap(
        'i',
        '<C-e>',
        'compe#close("<C-e>")',
        {
          noremap = true,
          silent = true,
          expr = true
        }
      )
    end,
    requires = {
      {
        'neovim/nvim-lspconfig',
        ft = lsp_fts,
        requires = {'ray-x/lsp_signature.nvim'},
        config = function ()
          require('extensions/lsp')
        end,
      },

      {
        '~/Library/Projects/snippets.nvim',
        module = 'snippets',
        config = function()
          require('extensions/snippets')
        end
      },

      {
        'kosayoda/nvim-lightbulb',
        ft = lsp_fts,
      },

      {
        'onsails/lspkind-nvim',
        ft = lsp_fts,
        config = function ()
          require('lspkind').init({
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
            }
          })
        end
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
    ft = {'lua', 'python'},
    config = function ()
      local treesitter = require('nvim-treesitter.configs')
      treesitter.setup({
        ensure_installed = {'lua', 'python'},
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
    config = function() require("nvim_comment").setup() end,
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
  -- UI Related Plugins
  use {'saadparwaiz1/nvimline'}
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
    event = 'InsertEnter'
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end,
    event = 'InsertEnter'
  }
  use {
    'saadparwaiz1/gruvbox-custom',
    config = function ()
    	vim.cmd('colorscheme gruvbox')
    end,
    run = [[nvim -c 'lua require("gruv.gruvbox")' -c 'q']]
  }
end)
