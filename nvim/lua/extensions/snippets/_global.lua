return {
  hd = "${LINE_COMMENT}!/usr/bin/env $1",
  calc = "${1>require('util').snips.calc_buffer(S.v)}",
}
