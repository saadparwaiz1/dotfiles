local c = {
       pr = 'printf("${1:%s}", ${2})',
       st = 'struct $1{\n\t$2\n}',
       fn = '$1 $2($3){\n}',
       main = "int main(int argc, char **argv){\n\treturn 0;\n}"
}

return c
