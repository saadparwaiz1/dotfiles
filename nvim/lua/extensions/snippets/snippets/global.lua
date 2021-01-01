local force_comment = require('snippets.utils').force_comment

local function expression_buffer(string)
	if string == "" or string == nil then
		return "nil"
	end

	local f = loadstring("return " .. string)

	if f == nil then
		return "nil"
	end

	return tostring(f())
end

_G.expression_buffer = expression_buffer

return {
	hd = "#!/usr/bin/env $1",
	calc = "${1|expression_buffer(S.v)}",
	["vim:"] = force_comment([[vim: set foldmethod=marker foldlevel=1 nomodeline:]]),
	sec = force_comment("$1 {{{\n============================================================================\n}}}\n============================================================================")
}
