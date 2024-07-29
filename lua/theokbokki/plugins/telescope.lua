return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>f", mode = { "n" }, function() require('telescope.builtin').find_files() end},
        { "<leader>lg", mode = { "n" }, function() require('telescope.builtin').live_grep() end},
        { "<leader>b", mode = { "n" }, function() require('telescope.builtin').buffers() end},
    },
    config = function()
        local actions = require("telescope.actions")

        require ('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['qq'] = actions.close,
                    },
                    n = {
                        ['q'] = actions.close,
                    },
                },
                border = {
                    prompt = { 1, 1, 1, 1 },
                    results = { 1, 1, 1, 1 },
                    preview = { 1, 1, 1, 1 },
                },
                borderchars = {
                    results = { " ", " ", "─", "│", "│", " ", "─", "└" },
                    prompt = { "─", " ", " ", "│", "┌", "─", " ", "│" },
                    preview = { "─", "│", "─", "│", "┬", "┐", "┘", "┴" },
                },
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                    },
                },
                sorting_strategy = "ascending",
            },
            pickers = {
                -- find_files = {
                --     theme = "ivy",
                -- },
                -- live_grep = {
                --     theme = "ivy",
                -- },
                -- buffers = {
                --     theme = "ivy",
                -- },
            },
        }
    end,
}
