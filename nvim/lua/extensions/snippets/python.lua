local indent = require('snippets').u.match_indentation

local python = {
  pr = "print($1)",
  imp = "import $1",
  with = indent "with ${1} as ${2}:\n    ",
  ifmain = indent "if __name__ == '__main__':\n    ${1:main()}",

  cls = indent "class $1:\n    pass",
  fn = indent "def $1(${2}):\n    pass",
  init = indent "def __init__(self, ${1|complete_arg_list(S.v)}",


  try = indent "try:\n    ${1:pass}\nexcept ${2:Exception} as ${3:e}:\n    ${4:pass}",
  tryf = indent "try:\n    ${1:pass}\nexcept ${2:Exception} as ${3:e}:\n    ${4:pass}\nfinally:\n    ${5:pass}",
  trye = indent "try:\n    ${1:pass}\nexcept ${2:Exception} as ${3:e}:\n    ${4:pass}\nelse:\n    ${5:pass}",
  tryef = indent "try:\n    ${1:pass}\nexcept ${2:Exception} as ${3:e}:\n    ${4:pass}\nelse:\n    ${5:pass}\nfinally:\n    ${6:pass}",

  ["en"] = "# -*- coding: utf-8 -*-",
  ["for"] = indent "for ${1:i} in ${2}:\n    $0",
  ["while"] = indent "while ${1:True}:\n    pass",
}

return python
