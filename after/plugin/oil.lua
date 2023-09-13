local ok, oil = pcall(require, 'oil')

if not ok then return end

oil.setup{
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = true,

		-- This function defines what will never be shown, even when `show_hidden` is set
		is_always_hidden = function(name, bufnr)
			return name == ".DS_Store"
		end,
	},
}

vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.api.nvim_create_autocmd("User", {
	pattern = "OilEnter",
	callback = vim.schedule_wrap(function(args)
		local oil = require("oil")
		if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
			oil.select({ preview = true })
		end
	end),
})
