local indent = require('snippets').u.match_indentation

local c = {
       dm = "#define $1 $2",
       df = "#define $1($2) $3",
       pr = 'printf("${1:%s}", ${2})',
       st = indent 'struct $1{\n    $2\n}',
       fn = indent '$1 $2($3){\n}',

       ['ifndef'] = '#ifndef $1\n#define $1\n#endif',
       ['for'] = indent 'for(${1:int i = 0;}, ${2:i} ${3:<} ${4:count}; ${5:i++}){\n    $6\n}',

       inc = "#include ${1:<stdio.h>}",
       main = indent "int main(int argc, char **argv){\n  return 0;\n}"
}

return c
