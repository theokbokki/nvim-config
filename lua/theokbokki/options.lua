local options = {
	autoindent = true,
	autoread = true,
	background = 'light',
	clipboard = 'unnamedplus',
	laststatus = 2,
	linebreak = true,
	number = true,
	relativenumber = true,
	statuscolumn = "%=%s %l    ",
	colorcolumn="80,120",
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
