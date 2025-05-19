vim.g.mapleader = ","

-- Options
local options = {
    autoindent = true,
    clipboard = "unnamedplus",
    expandtab = true,
    ignorecase = true,
    number = true,
    scrolloff = 999,
    shell = "/bin/zsh",
    shiftwidth = 4,
    smartcase = true,
    swapfile = false,
    tabstop = 4,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Mappings
local map = vim.keymap.set

-- Select all
map("n", "<C-a>", "gg<S-v>G");

-- Keep window centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Don't override the current clipboard
map("x", "<leader>p", [["_dP]])

-- Go to defintion
map("n", "gd", vim.lsp.buf.definition)

-- LSP
vim.lsp.config["phpactor"] = {
    cmd = { 'phpactor', 'language-server' },
    filetypes = { 'php' },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local cwd = assert(vim.uv.cwd())
        local root = vim.fs.root(fname, { 'composer.json', '.git', '.phpactor.json', '.phpactor.yml' })

        -- prefer cwd if root is a descendant
        on_dir(root and vim.fs.relpath(cwd, root) and cwd)
    end,
}

vim.lsp.config["ts_ls"] = {
    init_options = { hostInfo = 'neovim' },
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {'javascript'},
    root_markers = {'package.json', '.git'},
    handlers = {
        -- handle rename request for certain code actions like extracting functions / types
        ['_typescript.rename'] = function(_, result, ctx)
            local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
            vim.lsp.util.show_document({
                uri = result.textDocument.uri,
                range = {
                    start = result.position,
                    ['end'] = result.position,
                },
            }, client.offset_encoding)
            vim.lsp.buf.rename()
            return vim.NIL
        end,
    },
    on_attach = function(client)
        -- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
        -- `vim.lsp.buf.code_action()` if specified in `context.only`.
        vim.api.nvim_buf_create_user_command(0, 'LspTypescriptSourceAction', function()
            local source_actions = vim.tbl_filter(function(action)
                return vim.startswith(action, 'source.')
            end, client.server_capabilities.codeActionProvider.codeActionKinds)

            vim.lsp.buf.code_action({
                context = {
                    only = source_actions,
                },
            })
        end, {})
    end,
}

vim.lsp.enable({
    "phpactor",
    "ts_ls",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = false })
    end,
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- Colorscheme
        {
            "pbrisbin/vim-colors-off",
            config = function()
                vim.cmd("colorscheme off")

                vim.opt.background = "light";

                vim.defer_fn(function()
                    vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#C6C6C6", bold = true })
                end, 0)
            end
        },

        -- Finder
        {
            'stevearc/oil.nvim',
            dependencies = { { "echasnovski/mini.icons", opts = {} } },
            config = function()
                require ("oil").setup {
                    view_options = {
                        -- Show files and directories that start with "."
                        show_hidden = true,

                        -- This function defines what will never be shown, even when `show_hidden` is set
                        is_always_hidden = function(name, bufnr)
                            return name == ".DS_Store"
                        end
                    }
                }

                map('n', '<leader>e', ':Oil<CR>')
            end,
            lazy = false,
        },

        -- Fuzzy finder
        {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = function()
                require ("telescope").setup {
                    pickers = {
                        find_files = {
                            previewer = false,
                        },
                        live_grep = {},
                        buffers = {
                            previewer = false,
                        },
                        highlights = {},
                    },
                }

                local builtin = require('telescope.builtin')

                map('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
                map('n', '<leader>lg', builtin.live_grep, { desc = 'Telescope live grep' })
                map('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
                map('n', '<leader>h', builtin.highlights, { desc = 'Telescope buffers' })
            end,
        },

        -- LSP
        {
            "mason-org/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },

        -- Treesitter
        {
            'nvim-treesitter/nvim-treesitter',
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = {"php"},
                    indent = {
                        enable = true,
                    },
                })
            end,
        }
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "off" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

