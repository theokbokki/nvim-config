local options = {
	autoindent = true,
	clipboard = 'unnamedplus',
	-- cmdheight = 0,
	laststatus = 0,
	linebreak = true,
	scrolloff = 999,
	shiftwidth = 4,
	smartindent = true,
	tabstop = 4,
	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.mapleader = ","
