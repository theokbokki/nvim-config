local ok, zen = pcall(require, 'zen-mode')
if not ok then
	return
end

zen.setup { window = { backdrop = 1 } }

vim.api.nvim_create_autocmd("BufReadPost", { command = "ZenMode" })
