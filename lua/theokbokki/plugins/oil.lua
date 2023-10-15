return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require ("oil").setup {
			-- Skip the confirmation popup for simple operations
			skip_confirm_for_simple_edits = false,

			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,

				-- This function defines what will never be shown, even when `show_hidden` is set
				is_always_hidden = function(name, bufnr)
					return name == ".DS_Store"
				end
			}
		}

		vim.keymap.set('n', '<leader>e', ':Oil<CR>')
	end,
}
