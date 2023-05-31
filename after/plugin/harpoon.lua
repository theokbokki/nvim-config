local ok = pcall(require, 'harpoon')
if not ok then
	return
end

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>mm', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>ma', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>mz', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>me', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>mr', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>mt', function() ui.nav_file(5) end)
vim.keymap.set('n', '<leader>my', function() ui.nav_file(6) end)
vim.keymap.set('n', '<leader>mu', function() ui.nav_file(7) end)
vim.keymap.set('n', '<leader>mi', function() ui.nav_file(8) end)
vim.keymap.set('n', '<leader>mo', function() ui.nav_file(9) end)
vim.keymap.set('n', '<leader>mp', function() ui.nav_file(10) end)
