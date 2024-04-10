return {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = 'dark',
            highlights = {
                -- Telescope
                TelescopePromptTitle = { fg = "$bg0", bg = "$purple" },
                TelescopePromptBorder = { fg = "$bg1", bg = "$bg1" },
                TelescopePromptNormal = { bg = "$bg1" },
                TelescopePreviewTitle = { fg = "$bg0", bg = "$green" },
                TelescopePreviewBorder = { fg = "$bg0", bg = "$bg0" },
                TelescopePreviewNormal = { bg = "$bg0" },
                TelescopeResultsTitle = { fg = "$bg0", bg = "$blue" },
                TelescopeResultsBorder = { fg = "$bg1", bg = "$bg1" },
                TelescopeResultsNormal = { bg = "$bg1" },
                TelescopeBorder = { fg = "$bg0", bg = "$bg0" },
            },
        })

        -- vim.cmd([[colorscheme onedark]])
    end,
}
