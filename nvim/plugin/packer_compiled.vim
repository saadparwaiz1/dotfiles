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
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-custom"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/gruvbox-custom"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nå\5\0\0\2\0\18\0%6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0006\0\0\0009\0\1\0+\1\2\0=\1\t\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0006\0\0\0009\0\1\0005\1\r\0=\1\f\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0006\0\0\0009\0\1\0005\1\17\0=\1\16\0K\0\1\0\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude\1\2\0\0\24IndentBlanklineChar,indent_blankline_context_highlight_list\1\5\0\0\15WarningMsg\15Identifier\tType\vString)indent_blankline_char_highlight_list\1\n\0\0\nclass\rfunction\vmethod\b^if\nwhile\bfor\twith\17func_literal\nblock&indent_blankline_context_patterns*indent_blankline_show_current_context!indent_blankline_strict_tabs\6 *indent_blankline_space_char_blankline\1\6\0\0\thelp\tdefx\rmarkdown\bman\vpacker&indent_blankline_filetype_exclude\b‚îÇ\26indent_blankline_char\6g\bvim\0" },
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n¬\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15symbol_map\1\0\20\tEnum\b‰∫Ü\rFunction\bÔûî\nValue\bÔ¢ü\vMethod\a∆í\vFolder\bÔÑï\tText\bÓòí\15EnumMember\bÔÖù\vStruct\bÔÉä\rConstant\bÓà¨\fSnippet\bÔ¨å\fKeyword\bÔ†Ö\tFile\bÔÖõ\nColor\bÓà´\tUnit\bÔëµ\rProperty\bÓò§\vModule\bÔ£ñ\14Interface\bÔ∞Æ\nClass\bÓÉç\rVariable\bÓûõ\16Constructor\bÓàè\1\0\1\14with_text\2\tinit\flspkind\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/neogit"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_buffer.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_calc.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_emoji.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_luasnip.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lsp.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lua.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_omni.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_path.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_snippets_nvim.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_spell.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_tags.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_treesitter.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_ultisnips.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsc.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsp.vim", "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vsnip.vim" },
    config = { "\27LJ\2\n¸\1\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\3\texpr\2\vsilent\2\fnoremap\2\25compe#close(\"<C-e>\")\n<C-e>\6i\20nvim_set_keymap\bapi\bvim\vsource\1\0\6\vbuffer\2\tpath\2\nspell\2\18snippets_nvim\2\rnvim_lua\2\rnvim_lsp\2\1\0\1\fenabled\2\nsetup\ncompe\frequire\0" },
    load_after = {
      ["snippets.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19extensions/lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÏ\1\0\0\5\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3B\1\2\0016\1\b\0009\1\t\1'\2\v\0=\2\n\0016\1\b\0009\1\t\1'\2\r\0=\2\f\1K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\3\0\0\blua\vpython\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-treesitter"
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
    config = { "\27LJ\2\nÖ\2\0\1\a\0\f\2#6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\26Ä6\1\0\0009\1\1\0019\1\3\1B\1\1\0029\1\4\1\b\1\1\0X\1\19Ä6\1\0\0009\1\5\0019\1\6\1\15\0\1\0X\2\5Ä6\1\0\0009\1\1\0019\1\a\1'\3\b\0D\1\2\0006\1\0\0009\1\t\0019\1\n\1'\3\v\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\n<C-y>\27nvim_replace_termcodes\bapi\t<CR>\18compe#confirm\17loaded_compe\6g\rselected\18complete_info\15pumvisible\afn\bvim\2˛ˇˇˇ\31l\1\1\4\0\5\0\n9\1\0\0'\3\1\0B\1\2\0019\1\2\0+\3\1\0B\1\2\0019\1\3\0003\3\4\0B\1\2\1K\0\1\0\0\ron_enter#remove_pair_on_outer_backspace\17tag_matching\vpreset8\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\nsetup\npears\frequire\0" },
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
  ["snippets.nvim"] = {
    after = { "nvim-compe" },
    config = { "\27LJ\2\n¡\6\0\0\a\0\30\00036\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\1\3\0009\1\4\0015\2\6\0005\3\5\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0\18\4\1\0'\6\r\0B\4\2\2=\4\14\3\18\4\1\0'\6\15\0B\4\2\2=\4\16\3\18\4\1\0'\6\17\0B\4\2\2=\4\18\3\18\4\1\0'\6\19\0B\4\2\2=\4\20\3\18\4\1\0'\6\21\0B\4\2\2=\4\22\3\18\4\1\0'\6\23\0B\4\2\2=\4\24\3\18\4\1\0'\6\25\0B\4\2\2=\4\26\3\18\4\1\0'\6\27\0B\4\2\2=\4\28\3=\3\29\2=\2\2\0K\0\1\0\vpython\nwhile\30while ${1:True}:\n    pass\bfor\31for ${1:i} in ${2}:\n    $0\btryFtry:\n    ${1:pass}\nexcept ${2:Exception} as ${3:e}:\n    ${4:pass}\tinit3def __init__(self, ${1|complete_arg_list(S.v)}\afn\27def $1(${2}):\n    pass\bcls\23class $1:\n    pass\vifmain/if __name__ == '__main__':\n    ${1:main()}\twith\28with ${1} as ${2}:\n    \1\0\3\bimp\14import $1\apr\14print($1)\aen\28# -*- coding: utf-8 -*-\blua\1\0\1\breq?local ${2:${1|S.v:match\"([^.()]+)[()]*$\"}} = require('$1')\6c\1\0\1\tmain2int main(int argc, char **argv){\n\treturn 0;\n}\f_global\1\0\0\1\0\2\tcalc\26${1|calc_buffer(S.v)}\ahd\22#!/usr/bin/env $1\22match_indentation\6u\rsnippets\24extensions/snippets\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/snippets.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21extensions/fuzzy\frequire\0" },
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/start/vim-surround"
  }
}

time("Defining packer_plugins", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\nå\5\0\0\2\0\18\0%6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0006\0\0\0009\0\1\0+\1\2\0=\1\t\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0006\0\0\0009\0\1\0005\1\r\0=\1\f\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0006\0\0\0009\0\1\0005\1\17\0=\1\16\0K\0\1\0\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude\1\2\0\0\24IndentBlanklineChar,indent_blankline_context_highlight_list\1\5\0\0\15WarningMsg\15Identifier\tType\vString)indent_blankline_char_highlight_list\1\n\0\0\nclass\rfunction\vmethod\b^if\nwhile\bfor\twith\17func_literal\nblock&indent_blankline_context_patterns*indent_blankline_show_current_context!indent_blankline_strict_tabs\6 *indent_blankline_space_char_blankline\1\6\0\0\thelp\tdefx\rmarkdown\bman\vpacker&indent_blankline_filetype_exclude\b‚îÇ\26indent_blankline_char\6g\bvim\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)
-- Config for: gruvbox-custom
time("Config for gruvbox-custom", true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\0", "config", "gruvbox-custom")
time("Config for gruvbox-custom", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21extensions/fuzzy\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: pears.nvim
time("Config for pears.nvim", true)
try_loadstring("\27LJ\2\nÖ\2\0\1\a\0\f\2#6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\26Ä6\1\0\0009\1\1\0019\1\3\1B\1\1\0029\1\4\1\b\1\1\0X\1\19Ä6\1\0\0009\1\5\0019\1\6\1\15\0\1\0X\2\5Ä6\1\0\0009\1\1\0019\1\a\1'\3\b\0D\1\2\0006\1\0\0009\1\t\0019\1\n\1'\3\v\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\n<C-y>\27nvim_replace_termcodes\bapi\t<CR>\18compe#confirm\17loaded_compe\6g\rselected\18complete_info\15pumvisible\afn\bvim\2˛ˇˇˇ\31l\1\1\4\0\5\0\n9\1\0\0'\3\1\0B\1\2\0019\1\2\0+\3\1\0B\1\2\0019\1\3\0003\3\4\0B\1\2\1K\0\1\0\0\ron_enter#remove_pair_on_outer_backspace\17tag_matching\vpreset8\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\nsetup\npears\frequire\0", "config", "pears.nvim")
time("Config for pears.nvim", false)
-- Config for: nvim-comment
time("Config for nvim-comment", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time("Config for nvim-comment", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-lightbulb', 'snippets.nvim', 'lspkind-nvim', 'nvim-compe'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-lightbulb', 'snippets.nvim', 'lspkind-nvim', 'nvim-compe'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-lightbulb', 'snippets.nvim', 'lspkind-nvim', 'nvim-compe'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType plaintex ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-lightbulb', 'snippets.nvim', 'lspkind-nvim', 'nvim-compe'}, { ft = "plaintex" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-lightbulb', 'snippets.nvim', 'lspkind-nvim', 'nvim-compe'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-lightbulb', 'snippets.nvim', 'lspkind-nvim', 'nvim-compe'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-treesitter', 'nvim-lightbulb', 'snippets.nvim', 'lspkind-nvim', 'nvim-compe'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-lightbulb', 'snippets.nvim', 'lspkind-nvim', 'nvim-compe'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-treesitter', 'nvim-lightbulb', 'snippets.nvim', 'lspkind-nvim', 'nvim-compe'}, { ft = "lua" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time("Sourcing ftdetect script at: /Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/query.vim", true)
vim.cmd [[source /Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/query.vim]]
time("Sourcing ftdetect script at: /Users/saadparwaiz/Library/ApplicationSupport/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/query.vim", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
