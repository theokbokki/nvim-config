local options = {
	autoindent = true,
	clipboard = 'unnamedplus',
	cmdheight = 0,
	laststatus = 0,
	linebreak = true,
	numberwidth = 6,
	number = true,
	relativenumber = true,
	scrolloff = 999,
	shell = 'zsh',
	shiftwidth = 4,
	smartindent = true,
	tabstop = 4,
	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Change blade.php files filetype from php to blade
vim.cmd [[ autocmd BufRead,BufNewFile *.blade.php set filetype=blade ]]

-- nvim/init.lua
-- Allow require to look in after/plugin folder
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path

vim.api.nvim_set_hl(0, 'Comment', { italic = true })
