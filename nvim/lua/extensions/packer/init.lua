vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.startup(function()
  -- plugin manager
  use {'wbthomason/packer.nvim'}
  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    }
  }
  -- LSP Extensions
  use {
    'hrsh7th/nvim-compe',
    requires = {
      {'L3MON4D3/LuaSnip'},
      {'onsails/lspkind-nvim'},
      {'neovim/nvim-lspconfig'},
      {'kosayoda/nvim-lightbulb'}
    }
  }
  -- Treesiter Extensions
  use {'nvim-treesitter/nvim-treesitter'}
  -- Enchanced Functionality Plugins
  use {'tpope/vim-surround'}
  use {
    'terrortylor/nvim-comment',
    config = function() require("nvim_comment").setup() end
  }
  use {
    'steelsojka/pears.nvim',
    config = function()
      require("pears").setup(function(conf)
        conf.preset "tag_matching"
        conf.remove_pair_on_outer_backspace(false)
        conf.on_enter(function(pear_handle)
          if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
            return vim.fn['compe#confirm']('<CR>')
          else
            pear_handle()
          end
        end)
      end)
    end
  }
  -- UI Related Plugins
  use {'saadparwaiz1/nvimline'}
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end
  }
  use {
    'npxbr/gruvbox.nvim',
    requires = {"rktjmp/lush.nvim"},
    config = function()
      vim.g.gruvbox_italic = 1
      vim.cmd('colorscheme gruvbox')
      vim.cmd('hi Function guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE')
      vim.cmd('hi Operator guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE')
    end
  }
end)
