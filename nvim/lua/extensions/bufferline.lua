-- ===========================
-- BUBBLY.NVIM BUFFERLINE FACTORY
-- ===========================
-- File Created by: saadparwaiz [github.com/saadparwaiz1]
-- Plugin Created by: datwaft [github.com/datwaft]

local bubble_factory = require'bubbly.factories.bubble'

local function _is_valid(bnum)
	if not bnum or bnum < 1 then
		return false
	end

	 return vim.api.nvim_buf_get_option(bnum, "buflisted") and vim.api.nvim_buf_is_valid(bnum)
end

local function list_valid_buffers()
	local buf_nums = vim.api.nvim_list_bufs()
	local valid_bufs = {}

	local count = 1
	for _, buf in ipairs(buf_nums) do
		if _is_valid(buf) then
			valid_bufs[count] = buf
			count = count + 1
		end
	end
	return valid_bufs
end

return function()
	local this = vim.fn.bufnr('%')
	this = vim.fn.bufname(this)
	if this == '' then this = '[No Name]' end

	local bufline = {}
	local buflist = list_valid_buffers()

	for i = 1, #buflist do
		local bufname = vim.fn.bufname(buflist[i])
		if bufname == '' then bufname = '[No Name]' end
		local color = this == bufname and vim.g.bubbly_colors.tabline.active or vim.g.bubbly_colors.tabline.inactive
		local style = this == bufname and vim.g.bubbly_styles.tabline.active or vim.g.bubbly_styles.tabline.inactive
		bufline[#bufline + 1] = {
			{ pre = '%'..i..'T', data = bufname, post = '%T', color = color, style = style },
			{ pre = '%'..i..'X', data = vim.g.bubbly_characters.close, post = '%X', color = { background = 'darkgrey', foreground = 'foreground' } },
		}
	end

	local result = ''
	for _, e in ipairs(bufline) do
		result = result..bubble_factory(e)..' '
	end
	return result
end
