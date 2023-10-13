local ok, rosepine = pcall(require, 'rose-pine');

if not ok then return end

rosepine.setup {
	variant = 'moon',
	disable_background = true,
	disable_float_background = true,
}

vim.cmd 'colorscheme rose-pine'
