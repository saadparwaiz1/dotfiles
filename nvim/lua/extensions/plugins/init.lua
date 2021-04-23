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
    use {'tpope/vim-surround'}
    use {'terrortylor/nvim-comment', config = 'require("nvim_comment").setup()'}
    use {
        'steelsojka/pears.nvim',
        config = require("pears").setup(function(conf)
            conf.preset "tag_matching"
            conf.expand_on_enter(false)
        end)
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
