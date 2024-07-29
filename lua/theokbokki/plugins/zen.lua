return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            backdrop = 1,
            options = {
                signcolumn = 'no',
                number = false,
                relativenumber = false,
            }
        },
        on_open = function(win)
            vim.opt.statuscolumn = ""
        end,
        on_close = function()
            vim.opt.statuscolumn = "%=%{v:lnum} %s"
        end,
    }
}
