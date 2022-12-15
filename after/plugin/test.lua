vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>')

-- make test commands execute using dispatch.vim
vim.cmd([[ 
	let g:test#neovim#start_normal = 1 " If using neovim strategy
	let test#php#phpunit#executable = 'php artisan test'

function! OtermStrategy(cmd)
	execute 'Otermf '.a:cmd.' |less -X'
endfunction

	let g:test#custom_strategies = {'oterm': function('OtermStrategy')}
	let g:test#strategy = "oterm"
]])
