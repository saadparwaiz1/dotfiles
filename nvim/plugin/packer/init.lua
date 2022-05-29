local packer = require("packer")
local fs = require("std.fs")
local cpath = fs.config / "nvim" / "plugin" / "packer" / "pcompile.lua"

vim.loop.os_setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")

packer.startup({
  function()
    use("wbthomason/packer.nvim")
    use({
      "nvim-treesitter/nvim-treesitter",
      requires = {
        "nvim-treesitter/nvim-treesitter-refactor",
      },
    })
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
      },
    })
    use({
      "echasnovski/mini.nvim",
    })
    use({
      "lewis6991/gitsigns.nvim",
    })
    use({
      "feline-nvim/feline.nvim",
    })
  end,
  config = {
    compile_path = cpath.filename,
  },
})
