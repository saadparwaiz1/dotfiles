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

local function bufferline()
	local buffers = list_valid_buffers()
	local bufline = {}
	local this = vim.api.nvim_buf_get_name(vim.fn.bufnr('%'))

	for _, v in pairs(buffers) do
		v = vim.api.nvim_buf_get_name(v)

		if v == this then
			if v == '' then v = '[No Name]' else v = vim.fn.fnamemodify(v, ':t') end
			table.insert(bufline, '%#ExtSeperator#%#Ext#' .. v .. '%#ExtSeperator#%#SubStatusLine#')
		else
		if v == '' then v = '[No Name]' else v = vim.fn.fnamemodify(v, ':t') end
			table.insert(bufline, '%#FileSeperator#%#File#' .. v .. '%#FileSeperator#%#SubStatusLine#')
		end
	end

	return table.concat(bufline, ' ')
end

_G.bufferline = bufferline

vim.o.tabline = '%!v:lua.bufferline()'
