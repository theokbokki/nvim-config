vim.g.mapleader = ","

-- Options
vim.opt.autoindent = true
vim.opt.bg = "light"
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.scrolloff = 999
vim.opt.shell = "/bin/zsh"
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.pumborder = "rounded"
vim.opt.completeopt = "menu,menuone,noinsert,fuzzy,popup"

-- Mappings
-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Keep window centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't override the current clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Plugins
vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/stevearc/oil.nvim", name = "oil" },
    { src = "https://github.com/mason-org/mason.nvim", name = "mason" },
    { src = "https://github.com/xiyaowong/transparent.nvim", name = "transparent" },
    { src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns" },
})

-- Colorscheme
require("transparent")

-- Fuzzy finder 
require("fzf-lua").setup({
    actions = {
        files = {
            true,
            ["ctrl-q"] = FzfLua.actions.file_sel_to_qf,
        }
    } 
})

vim.keymap.set("n", "<leader>f", function() FzfLua.files() end)
vim.keymap.set("n", "<leader>b", function() FzfLua.buffers() end)
vim.keymap.set("n", "<leader>lg", function() FzfLua.live_grep() end)
vim.keymap.set("n", "gd", function() FzfLua.lsp_definitions() end)

-- File explorer
require("oil").setup()
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")

-- Git
require("gitsigns")

-- LSP
require("mason").setup()

local opts = { noremap = true, silent = true, buffer = bufnr }

vim.lsp.config['phpactor'] = {
    cmd = { 'phpactor', 'language-server' },
    filetypes = { 'php' },
    root_markers = { '.git', 'composer.json', '.phpactor.json', '.phpactor.yml' },
    workspace_required = true,
}
vim.lsp.enable('phpactor')

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, {
                autotrigger = true,
            })

            vim.api.nvim_create_autocmd("InsertCharPre", {
                buffer = ev.buf,
                callback = function()
                    vim.lsp.completion.get()
                end,
            })
        end
    end,
})
