vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.startup({
  function(use)
    -- Plugin  Manager
    use {
      'wbthomason/packer.nvim'
    }
    -- ColorScheme
    use {
      'saadparwaiz1/gruvbox-autogenerate',
      run = [[:lua require('gruvbox').generate()]]
    }
    -- Status/Buffer Line
    use {
      'saadparwaiz1/nvimline',
      config = function()
        require('nvimline').setup()
      end
    }
    -- Indent Guides
    use {
      'lukas-reineke/indent-blankline.nvim'
    }
    -- Git Signs
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
      end
    }
    -- Enchanced Functionality
    use {
      'machakann/vim-sandwich',
    }
    use {
      'andymass/vim-matchup'
    }
    use {
      'b3nj5m1n/kommentary'
    }
    use {
      'steelsojka/pears.nvim'
    }
    -- Git Client
    use {
      'TimUntersberger/neogit',
      config = function()
        require('neogit').setup()
      end,
      requires = {
        { 'nvim-lua/plenary.nvim' }
      }
    }
    -- Fuzzy Finders
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', run='make'}
      }
    }
    -- Tree Sitter and It's Extensions
    use {
      'nvim-treesitter/nvim-treesitter-textobjects',
      requires = {
        'nvim-treesitter/nvim-treesitter'
      }
    }
    -- LSP Config
    use {
      'neovim/nvim-lspconfig',
      requires = {
        {'folke/lua-dev.nvim'},
        {'ray-x/lsp_signature.nvim'},
      }
    }
    -- Snippets
    use {
      'L3MON4D3/LuaSnip'
    }
    -- Lsp Extensions
    use {
      'jose-elias-alvarez/null-ls.nvim'
    }
    -- Auto Completion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        '~/Documents/projects/cmp_luasnip'
      }
    }
  end
})
