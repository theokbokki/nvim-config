local options = {
    autoindent = true, -- copy indent from current line when starting new one
    clipboard = "unnamedplus", -- make vim clipboard the same as mac clipboard
    expandtab = true,
    ignorecase = true, -- ignore case when searching
    number = true, -- show absolute line number on cursor line (when relative number is on)
    scrolloff = 999, -- keep current line in the center
    shell = "/bin/zsh",
    shiftwidth = 4, -- use four spaces for indent width
    -- statuscolumn = "%=%{v:lnum} %s",
    smartcase = true, -- make search case sensitive if there are multiple cases
    swapfile = false, -- remove swap files
    tabstop = 4, -- make tab 4 spaces wide
    termguicolors = true, -- make colors pretty
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.mapleader = ","
