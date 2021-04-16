" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/lush.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("nvim-autopairs").setup()' },
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-comment"] = {
    config = { 'require("nvim_comment").setup()' },
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/vim-vsnip"
  }
}

-- Config for: nvim-autopairs
require("nvim-autopairs").setup()
-- Config for: nvim-comment
require("nvim_comment").setup()
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
