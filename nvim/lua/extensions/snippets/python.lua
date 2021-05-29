local snippets = require('snippets')
local indent = snippets.u.match_indentation

return {
  pr = "print($1)",
  imp = "import $1",
  with = indent "with ${1} as ${2}:\n    ",
  ifmain = indent "if __name__ == '__main__':\n    ${1:main()}",
  fn = indent "def $1(${2}):\n    pass",
  cls = indent "class ${1:MyClass}:\n    def __init__(self${2>SUtils.complete_arg_list(S.v)}",
  try = indent "try:\n    ${1:pass}\nexcept ${2:Exception} as ${3:e}:\n    ${4:pass}",
  ["en"] = "# -*- coding: utf-8 -*-",
  ["for"] = indent "for ${1:i} in ${2}:\n    $0",
  ["while"] = indent "while ${1:True}:\n    pass",
}
