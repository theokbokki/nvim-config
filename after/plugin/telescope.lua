local ok, telescope = pcall(require, 'telescope')
if not ok then
	return
end


local actions = require('telescope.actions')

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
				['q'] = actions.close,
			},
			n = {
				['q'] = actions.close,
			}
		}
	},
	pickers = {
	},
	extensions = {
	}
}

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<leader>lg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>ch', '<cmd>Telescope command_history<cr>')
vim.keymap.set('n', '<leader>sh', '<cmd>Telescope search_history<cr>')
vim.keymap.set('n', '<leader>lr', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>ld', '<cmd>Telescope lsp_definitions<cr>')
