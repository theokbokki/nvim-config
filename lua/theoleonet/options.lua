local options = {
	autoindent = true,
	clipboard = 'unnamedplus',
	cmdheight = 0,
	laststatus = 0,
	linebreak = true,
	numberwidth = 6,
	relativenumber = true,
	shell = 'zsh',
	shiftwidth = 2,
	smartindent = true,
	tabstop = 2,
	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]] -- format on save

-- nvim/init.lua
-- Allow require to look in after/plugin folder

local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path
