local ok, staline = pcall(require, 'staline')

staline.setup {
	sections = {
		left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
		mid = {},
		right = { 'file_name', 'line_column' }
	},
	mode_colors = {
		i = "#eb6f92",
		n = "#f6c177",
		c = "#c4a7e7",
		v = "#31748f",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " "
	}
}
