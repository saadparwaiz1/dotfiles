return {
  req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require('$1')]],
}
