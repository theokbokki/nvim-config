local ok, onehalf = pcall(vim.cmd, 'colorscheme onehalflight')
if not ok then
	return
end

vim.cmd 'colorscheme onehalflight'
