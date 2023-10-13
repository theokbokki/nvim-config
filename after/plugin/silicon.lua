local ok, silicon = pcall(require, 'silicon')

if not ok then return end

silicon.setup({
	font = 'FiraCode Font=16',
	theme = 'Rose Pine Moon',
	background = '#F1DAEE',
	output = {
		path = "~/screenshots"
	},
	window_title = function()
		return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ':~:.')
	end,
})
