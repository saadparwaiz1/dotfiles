local packer = require("packer")
local fs = require("std.fs")
local cpath = fs.config / "nvim" / "plugin" / "packer" / "pcompile.lua"

vim.loop.os_setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")

packer.startup({
  function(use)
    -- package manager
    use("wbthomason/packer.nvim")

    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      requires = {
        "nvim-treesitter/nvim-treesitter-refactor",
      },
    })

    -- telescope: fuzzy finder, picker
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
      },
    })

    -- extend default neovim functionality
    use({
      "echasnovski/mini.nvim",
    })
    use({
      "lewis6991/gitsigns.nvim",
    })
    use({
      "feline-nvim/feline.nvim",
    })
    use({
      "hrsh7th/cmp-cmdline",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    })
    use("lewis6991/impatient.nvim")
    use("stevearc/dressing.nvim")

    -- autocompletion: non-native
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
      },
    })

    -- snippets: non-native
    use("L3MON4D3/LuaSnip")
  end,
  config = {
    compile_path = cpath.filename,
  },
})
