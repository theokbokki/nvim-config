vim.api.nvim_create_autocmd(
	"BufWritePost",
	{
		pattern = "*.php",
		callback = function()
			vim.cmd 'silent! !./vendor/bin/pint %'
		end,
	}
)

vim.api.nvim_create_autocmd(
	"BufWritePost",
	{
		pattern = "*.blade.php",
		callback = function()
			-- Run blade-formatter on the entire buffer and capture the output
			vim.cmd 'silent! !blade-formatter -w % &> /dev/null -'
		end,
	}
)
