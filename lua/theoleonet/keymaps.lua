local map = vim.keymap.set

-- Map "," as leader key
vim.g.mapleader = ','

-- Remap <ESC> to jj
map('i', 'jj', '<ESC>')

-- Delete a word backwards
map('n', 'dw', 'vb"_d')

-- Select all
map('n', '<C-a>', 'gg<S-v>G')

-- Move window
map('', '<C-h>', '<C-w>h')
map('', '<C-k>', '<C-w>k')
map('', '<C-j>', '<C-w>j')
map('', '<C-l>', '<C-w>l')

-- Emmet
vim.cmd 'imap <expr> <leader><tab> emmet#expandAbbrIntelligent("<tab>")'
