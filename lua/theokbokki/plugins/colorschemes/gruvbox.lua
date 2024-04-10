return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = function ()
        require('gruvbox').setup({
            bold = false,
            italic = {
                strings = false,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
        })

        vim.cmd([[colorscheme gruvbox]])
        vim.cmd([[
            augroup CustomCommentCollor
            autocmd!
            autocmd VimEnter * hi GitSignsAdd guibg=#3C3836
            autocmd VimEnter * hi GitSignsChange guibg=#3C3836
            autocmd VimEnter * hi GitSignsDelete guibg=#3C3836
            augroup END
        ]])
    end,
}
