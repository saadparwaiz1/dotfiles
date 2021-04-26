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
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/saadparwaiz/Library/Caches/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/LuaSnip"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\nê\1\0\0\3\0\a\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\3\0'\2\5\0B\0\2\0016\0\0\0009\0\3\0'\2\6\0B\0\2\1K\0\1\0=hi Operator guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE=hi Function guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE\24colorscheme gruvbox\bcmd\19gruvbox_italic\6g\bvim\0" },
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
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
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
  nvimline = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/nvimline"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pears.nvim"] = {
    config = { "\27LJ\2\n¡\1\0\1\4\0\a\2\0226\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\r€6\1\0\0009\1\1\0019\1\3\1B\1\1\0029\1\4\1\b\1\1\0X\1\6€6\1\0\0009\1\1\0019\1\5\1'\3\6\0D\1\2\0X\1\2€\18\1\0\0B\1\1\1K\0\1\0\t<CR>\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\2þÿÿÿ\31l\1\1\4\0\5\0\n9\1\0\0'\3\1\0B\1\2\0019\1\2\0+\3\1\0B\1\2\0019\1\3\0003\3\4\0B\1\2\1K\0\1\0\0\ron_enter#remove_pair_on_outer_backspace\17tag_matching\vpreset8\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\nsetup\npears\frequire\0" },
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/pears.nvim"
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
  }
}

time("Defining packer_plugins", false)
-- Config for: pears.nvim
time("Config for pears.nvim", true)
try_loadstring("\27LJ\2\n¡\1\0\1\4\0\a\2\0226\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\r€6\1\0\0009\1\1\0019\1\3\1B\1\1\0029\1\4\1\b\1\1\0X\1\6€6\1\0\0009\1\1\0019\1\5\1'\3\6\0D\1\2\0X\1\2€\18\1\0\0B\1\1\1K\0\1\0\t<CR>\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\2þÿÿÿ\31l\1\1\4\0\5\0\n9\1\0\0'\3\1\0B\1\2\0019\1\2\0+\3\1\0B\1\2\0019\1\3\0003\3\4\0B\1\2\1K\0\1\0\0\ron_enter#remove_pair_on_outer_backspace\17tag_matching\vpreset8\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\nsetup\npears\frequire\0", "config", "pears.nvim")
time("Config for pears.nvim", false)
-- Config for: nvim-comment
time("Config for nvim-comment", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time("Config for nvim-comment", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: gruvbox.nvim
time("Config for gruvbox.nvim", true)
try_loadstring("\27LJ\2\nê\1\0\0\3\0\a\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\3\0'\2\5\0B\0\2\0016\0\0\0009\0\3\0'\2\6\0B\0\2\1K\0\1\0=hi Operator guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE=hi Function guifg=#8ec07c guibg=NONE guisp=NONE gui=NONE\24colorscheme gruvbox\bcmd\19gruvbox_italic\6g\bvim\0", "config", "gruvbox.nvim")
time("Config for gruvbox.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
