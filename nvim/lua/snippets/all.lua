local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

local lfeatures = {
  c = {
    main = {
      t({ 'int main(int argc, char **argv){', '\t' }),
      i(1),
      t({ '', '}' }),
    },

    print = {
      t('printf('),
      i(1, '"Hello, World\\n"'),
      t(');'),
    },
  },
  python = {
    main = {
      t({ 'if __name__ == "__main__":', '\t' }),
      i(1),
    },
    print = {
      t('print('),
      i(1, '"Hello, World"'),
      t(')'),
    },
  },
  java = {
    main = {
      t({ 'public static void main(String args[]){', '\t' }),
      i(1),
      t({ '', '}' }),
    },
    print = {
      t('System.out.println('),
      i(1, '"Hello, World"'),
      t(');'),
    },
  },
}

setmetatable(lfeatures, {
  __index = function(_, _)
    return {
      main = {
        t('No Main Defined'),
      },
      print = {
        t('No Print Defined'),
      },
    }
  end,
})

local function main_func(_, _)
  return sn(nil, lfeatures[vim.bo.filetype].main)
end

local function print_func(_, _)
  return sn(nil, lfeatures[vim.bo.filetype].print)
end

local function shebang(_, _)
  local cstring = vim.split(vim.bo.commentstring, '%s', true)[1]
  if cstring == '/*' then
    cstring = '//'
  end
  cstring = vim.trim(cstring)
  return sn(nil, {
    t(cstring),
    t('!/usr/bin/env '),
    i(1, vim.bo.filetype),
  })
end

return {
  s({ trig = 'hd', dscr = 'Add SheBang' }, {
    d(1, shebang, {}),
  }),
  s({ trig = 'main', dscr = 'Add Main Method' }, {
    d(1, main_func, {}),
  }),
  s({ trig = 'pr', dscr = 'Add Print Method' }, {
    d(1, print_func, {}),
  }),
}
