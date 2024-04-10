return {
    "rose-pine/neovim",
	priority = 1000,
    lazy = false,
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = 'dawn',
            disable_background = true,
            disable_float_background = true,
        })

        -- vim.cmd "colorscheme rose-pine"
    end
}
