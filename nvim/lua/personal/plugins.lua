vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.startup({
  function(use)
    -- Performance
    use({
      'lewis6991/impatient.nvim',
    })
    use({
      'nathom/filetype.nvim',
    })
    -- Note Taking
    use({
      'nvim-orgmode/orgmode',
      'akinsho/org-bullets.nvim',
    })
    -- Plugin  Manager
    use({
      'wbthomason/packer.nvim',
    })
    -- Status/Buffer Line
    use({
      'saadparwaiz1/nvimline',
      config = function()
        require('nvimline').setup()
      end,
    })
    -- Indent Guides
    use({
      'lukas-reineke/indent-blankline.nvim',
    })
    -- Git Signs
    use({
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
      end,
    })
    -- Enchanced Functionality
    use({
      'machakann/vim-sandwich',
    })
    use({
      'andymass/vim-matchup',
    })
    use({
      'b3nj5m1n/kommentary',
    })
    use({
      'steelsojka/pears.nvim',
    })
    use({
      'jbyuki/venn.nvim',
    })
    -- Git Client
    use({
      'TimUntersberger/neogit',
      config = function()
        require('neogit').setup()
      end,
      requires = {
        { 'nvim-lua/plenary.nvim' },
      },
    })
    -- Fuzzy Finders
    use({
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { 'kyazdani42/nvim-web-devicons' },
      },
    })
    -- Tree Sitter and It's Extensions
    use({
      'nvim-treesitter/nvim-treesitter-textobjects',
      requires = {
        'nvim-treesitter/nvim-treesitter',
      },
    })
    -- LSP Config
    use({
      'neovim/nvim-lspconfig',
      requires = {
        { 'folke/lua-dev.nvim' },
      },
    })
    -- Snippets
    use({
      'L3MON4D3/LuaSnip',
    })
    -- Lsp Extensions
    use({
      'jose-elias-alvarez/null-ls.nvim',
    })
    -- custom
    use({
      'saadparwaiz1/keymap.nvim',
    })
    -- Auto Completion
    use({
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'kdheepak/cmp-latex-symbols',
        '~/Documents/projects/cmp_luasnip/',
      },
    })
    use({
      'github/copilot.vim',
    })
  end,
})
