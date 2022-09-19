local ok, telescope = pcall(require, 'telescope')
if not ok then
	return
end

local actions = require('telescope.actions')

telescope.setup {
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				['q'] = actions.close,
			},

			n = {
				['q'] = actions.close
			}
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		find_files = {
			theme = 'ivy',
		},
		live_grep = {
			theme = 'ivy',
		},
		buffers = {
			theme = 'ivy',
		},
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
		},
	},
}

telescope.load_extension('file_browser')

vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>Telescope file_browser<cr>')
