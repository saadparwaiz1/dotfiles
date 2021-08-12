local ls = require('luasnip')
local types = require('luasnip.util.types')


ls.config.set_config({
  history = false,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {
          {
            "choiceNode",
            "GruvboxOrange"
          }
        }
      }
    }
  }
})

ls.snippets = {}

setmetatable(ls.snippets, {
  __index = function (t,k)
    local ok, mod = pcall(require, 'snippets.'..k)
    if ok then
      t[k] = mod
      return mod
    end
    t[k] = {}
    return {}
  end
})

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

local function snip_choice_trigger()
  if ls.choice_active() then
    return t '<Plug>luasnip-next-choice'
  end
  return  t '<C-k>'
end


vim.keymap.map('<C-k>', snip_choice_trigger, {mode = {'i', 's'}, opts = {expr=true, silent=true}})
