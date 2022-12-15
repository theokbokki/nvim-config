local ok, oterm = pcall(require, 'oterm')
if not ok then
	return;
end

local open = require('oterm').open

oterm.setup{
	terminal_color = 'oterm',
	split_hl = 'otermSplit',
	keymaps = {exit = '<C-q>', normal = '<C-a>'},
	win_api = {border='rounded', relative="editor"}
}

vim.keymap.set('n', '<leader>oo', function() open() end)
vim.keymap.set('n', '<leader>ov', function() open({layout='vsplit'}) end)
vim.keymap.set('n', '<leader>oc', function() open({layout='center'}) end)
