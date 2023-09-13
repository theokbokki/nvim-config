local ok, telescope = pcall(require, 'telescope')

if not ok then return end

local actions = require('telescope.actions')

telescope.setup {
	defaults = {
		mappings = {
			i = {
				['qq'] = actions.close,
			},
			n = {
				['q'] = actions.close
			}
		}
	}
}

vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>lg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>')
