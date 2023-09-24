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

telescope.load_extension("git_worktree")

vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>lg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>lw', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
vim.keymap.set('n', '<leader>cw', "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
