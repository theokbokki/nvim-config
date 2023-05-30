local map = vim.keymap.set

-- Remap <ESC> to jj
map('i', 'jj', '<ESC>')

-- Netrw remaps
map('n', '<leader>e', ':Ex<CR>')

-- Select all
map('n', '<C-a>', 'gg<S-v>G')

-- Keep window centered
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Don't override the current clipboard
map('x', '<leader>p', '\"_dP')

-- Change keymap for codium code completion
map('i', '<C-q>', function() return vim.fn['codeium#Accept']() end, { expr = true })

-- Emmet
vim.cmd 'imap <expr> <leader><tab> emmet#expandAbbrIntelligent("<tab>")'

-- Switch between two buffers avoiding the netrw buffer
map('n', '<leader>bp', ':bprev<CR>')
