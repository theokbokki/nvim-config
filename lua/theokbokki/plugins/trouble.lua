return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("trouble").setup({})

        -- Lua
        vim.keymap.set("n", "<leader>to", function() require("trouble").toggle() end)
        vim.keymap.set("n", "<leader>twd", function() require("trouble").toggle("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>tdd", function() require("trouble").toggle("document_diagnostics") end)
        vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
        vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)
        vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
    end
}
