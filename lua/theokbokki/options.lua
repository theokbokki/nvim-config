local options = {
	autoindent = true,
	autoread = true,
	clipboard = 'unnamedplus',
	laststatus = 2,
	background = light,
	linebreak = true,
	statuscolumn = "%=%s    ",
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

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
