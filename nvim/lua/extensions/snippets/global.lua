function expression_buffer(string)
  if string == "" or string == nil then
    return "nil"
  end

  local f = loadstring("return " .. string)

  if f == nil then
    return "nil"
  end

  return tostring(f())
end


return {
  hd = "#!/usr/bin/env $1",
  calc = "${1|expression_buffer(S.v)}",
}
