local map = vim.keymap.set

-- Remap <ESC> to jj
map("i", "jj", "<ESC>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Move around windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Keep window centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Don't override the current clipboard
map("x", "<leader>p", '"_dP')
