return {
  hd = "${LINE_COMMENT}!/usr/bin/env $1",
  calc = "${1|calc_buffer(S.v)}",
}
