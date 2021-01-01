-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Utilities {{{
-- ============================================================================
local function line(fmt)
	vim.o.statusline = vim.o.statusline .. fmt
end

local function file_extension()
	local extensions = vim.fn.expand('%:e')
	return extensions ~= '' and extensions or  vim.fn.has('mac') and 'darwin' or vim.o.fileformat
end

local function current_mode()
	local mode = vim.fn.mode()
	if mode == 'n' then
		return 'NORMAL'
	end
	if mode == 'i' then
		return 'INSERT'
	end
	if mode == 'R' then
		return 'REPLACE'
	end
	if mode == 'c' then
		return 'COMMAND'
	end
	if mode == 't' then
		return 'TERMINAL'
	end
	return 'VISUAL'
end

local function git_branch()
	local git_info = vim.b.git_info
	local cwd = vim.fn.expand('%:p:h')

	if git_info then
		return git_info
	end

	local branch = vim.fn.system('cd ' .. cwd .. ' &> /dev/null && git rev-parse --abbrev-ref HEAD 2> /dev/null | tr -d "\n"')

	if branch == '' or not branch then
		branch = vim.bo.readonly and '' or ''
	else
		branch = ' ' .. branch
	end

	vim.b.git_info = branch

	return branch
end

_G.current_mode = current_mode
_G.file_extension = file_extension
_G.git_branch = git_branch
-- }}}
-- ============================================================================
-- Status Line {{{
-- ============================================================================
vim.o.statusline = ''

line("%#Seperator#%#Mode#%{v:lua.current_mode()}%#Seperator#%#SubStatusLine# ")
line("%#FileSeperator#%#File#%t%#FileSeperator#%#SubStatusLine# ")
line("%#GitSeperator#%#Git#%{v:lua.git_branch()}%#GitSeperator#%#SubStatusLine# ")
line("%#SubStatusLine#%=")
line("%#ExtSeperator#%#Ext#%{v:lua.file_extension()}%#ExtSeperator#%#SubStatusLine# ")
line("%#LineSeperator#%#Line#%l:%c %p%%%#LineSeperator#")
-- }}}
-- ============================================================================
