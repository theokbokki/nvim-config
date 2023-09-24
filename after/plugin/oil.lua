local ok, oil = pcall(require, 'oil')

if not ok then return end

oil.setup {
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
