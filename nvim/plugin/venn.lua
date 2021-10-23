local venn_enabled = nil
local keymap = require('knvim.keymap')

local function toggle_venn()
  if venn_enabled == nil then
    vim.notify('Venn Mode Enabled')
    venn_enabled = true
    vim.opt.virtualedit = 'all'
    keymap.tmp('J', '<C-v>j:VBox<CR>', {})
    keymap.tmp('K', '<C-v>k:VBox<CR>', {})
    keymap.tmp('H', '<C-v>h:VBox<CR>', {})
    keymap.tmp('L', '<C-v>l:VBox<CR>', {})
    keymap.tmp('f', ':VBox<CR>', { mode = 'v' })
  else
    vim.notify('Venn Mode Disabled')
    vim.opt.virtualedit = ''
    keymap.revert('J')
    keymap.revert('L')
    keymap.revert('H')
    keymap.revert('K')
    keymap.revert('f', 'v')
    venn_enabled = nil
  end
end

keymap.map('<leader>v', toggle_venn, {})
