vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.startup(function()
    -- plugin manager
    use {'wbthomason/packer.nvim'}
    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            {'kyazdani42/nvim-web-devicons'}
        }
    }
    -- LSP Extensions
    use {
        'hrsh7th/nvim-compe',
        requires = {
            {'onsails/lspkind-nvim'}, {'neovim/nvim-lspconfig'},
            {'L3MON4D3/LuaSnip'}
        }
    }
    -- Treesiter Extensions
    use {'nvim-treesitter/nvim-treesitter'}
    -- Enchanced Functionality Plugins
    use {'windwp/nvim-autopairs', config = 'require("nvim-autopairs").setup()'}
    use 'saadparwaiz1/vim-surround'
    use {'terrortylor/nvim-comment', config = 'require("nvim_comment").setup()'}
    -- UI Related Plugins
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use {'npxbr/gruvbox.nvim', requires = {"rktjmp/lush.nvim"}}
end)
