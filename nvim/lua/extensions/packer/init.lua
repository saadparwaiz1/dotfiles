vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.startup(function()
  -- plugin manager
  use {'wbthomason/packer.nvim'}
  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    },
    config = function ()
    	require('extensions/fuzzy')
    end
  }
  -- LSP Extensions
  use {
    'hrsh7th/nvim-compe',
    ft = {'python', 'bash', 'sh', 'zsh', 'c', 'cpp', 'lua', 'tex', 'plaintex'},
    config = function()
      require('compe').setup {
        enabled = true,
        source = {
          path = true,
          spell = true,
          buffer = true,
          nvim_lsp = true,
          nvim_lua = true,
          snippets_nvim = true
        }
      }
      vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', {noremap = true, silent = true, expr = true})
    end
  }
  use {
    'neovim/nvim-lspconfig',
    ft = {'python', 'bash', 'sh', 'zsh', 'c', 'cpp', 'lua', 'tex', 'plaintex'},
    config = function ()
      require('extensions/lsp')
    end
  }
  use {
    'norcalli/snippets.nvim',
    ft = {'python', 'bash', 'sh', 'zsh', 'c', 'cpp', 'lua', 'tex', 'plaintex'},
    config = function()
      require('extensions/snippets')
      local snippets = require('snippets')
      local indent = snippets.u.match_indentation

      snippets.snippets = {
        _global = {
          hd = "#!/usr/bin/env $1",
          calc = "${1|calc_buffer(S.v)}",
        },
        c = {
          main = "int main(int argc, char **argv){\n\treturn 0;\n}"
        },
        lua = {
          req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require('$1')]],
        },
        python = {
          pr = "print($1)",
          imp = "import $1",
          with = indent "with ${1} as ${2}:\n    ",
          ifmain = indent "if __name__ == '__main__':\n    ${1:main()}",
          cls = indent "class $1:\n    pass",
          fn = indent "def $1(${2}):\n    pass",
          init = indent "def __init__(self, ${1|complete_arg_list(S.v)}",
          try = indent "try:\n    ${1:pass}\nexcept ${2:Exception} as ${3:e}:\n    ${4:pass}",
          ["en"] = "# -*- coding: utf-8 -*-",
          ["for"] = indent "for ${1:i} in ${2}:\n    $0",
          ["while"] = indent "while ${1:True}:\n    pass",
        }
      }
    end
  }
  use {
    'kosayoda/nvim-lightbulb',
    ft = {'python', 'bash', 'sh', 'zsh', 'c', 'cpp', 'lua', 'tex', 'plaintex'},
  }
  use {
    'onsails/lspkind-nvim',
    ft = {'python', 'bash', 'sh', 'zsh', 'c', 'cpp', 'lua', 'tex', 'plaintex'},
    config = function ()
      require('lspkind').init {
        with_text = true,
        symbol_map = {
            Text = '',
            Method = 'ƒ',
            Function = '',
            Constructor = '',
            Variable = '',
            Class = '',
            Interface = 'ﰮ',
            Module = '',
            Property = '',
            Unit = '',
            Value = '',
            Enum = '了',
            Keyword = '',
            Snippet = '﬌',
            Color = '',
            File = '',
            Folder = '',
            EnumMember = '',
            Constant = '',
            Struct = ''
        }
      }
    end
  }

  -- Treesiter Extensions
  use {
    'nvim-treesitter/nvim-treesitter',
    ft = {'lua', 'python'},
    config = function ()
      local treesitter = require('nvim-treesitter.configs')
      treesitter.setup {
        ensure_installed = {'lua', 'python'},
        highlight = {enable = true}
      }
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
    end
  }
  -- Enchanced Functionality Plugins
  use {'tpope/vim-surround'}
  use {
    'terrortylor/nvim-comment',
    config = function() require("nvim_comment").setup() end
  }
  use {
    'steelsojka/pears.nvim',
    config = function()
      require("pears").setup(function(conf)
        conf.preset "tag_matching"
        conf.remove_pair_on_outer_backspace(false)
        conf.on_enter(function(pear_handle)
          if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
            if vim.g.loaded_compe then
              return vim.fn['compe#confirm']('<CR>')
            end
            return vim.api.nvim_replace_termcodes('<C-y>', true, true, true)
          else
            pear_handle()
          end
        end)
      end)
    end
  }
  -- UI Related Plugins
  use {'saadparwaiz1/nvimline'}
  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    config = function ()
      vim.g.indent_blankline_char = '│'
      vim.g.indent_blankline_filetype_exclude = { 'help', 'defx', 'markdown', 'man', 'packer' }
      vim.g.indent_blankline_space_char_blankline = ' '
      vim.g.indent_blankline_strict_tabs = false
      vim.g.indent_blankline_show_current_context = true
      vim.g.indent_blankline_context_patterns = { 'class', 'function', 'method', '^if', 'while', 'for', 'with', 'func_literal', 'block' }
      vim.g.indent_blankline_char_highlight_list = {"WarningMsg", "Identifier", "Type", "String"}
      vim.g.indent_blankline_context_highlight_list = {'IndentBlanklineChar'}
      vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end
  }
  use {
    'saadparwaiz1/gruvbox-custom',
    config = function ()
    	vim.cmd('colorscheme gruvbox')
    end,
    run = 'python3 init.py'
  }
end)
