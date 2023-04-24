-- local onehalf_ok, onehalf = pcall(vim.cmd, 'colorscheme onehalflight')
--
-- if not onehalf_ok then
-- 	return
-- end

-- vim.cmd 'colorscheme onehalflight'
-- vim.cmd 'colorscheme base16-one-light'
-- vim.cmd 'colorscheme github_light_default'
-- vim.cmd 'colorscheme tokyonight-night'
-- vim.cmd 'colorscheme catppuccin-latte'


require("catppuccin").setup {
	color_overrides = {
		latte = {
			surface1 = "#E2E6F2"
		},
		frappe = {},
		macchiato = {},
		mocha = {},
	}
}

vim.cmd.colorscheme 'catppuccin-latte'
