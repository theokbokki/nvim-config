return {
    "luukvbaal/statuscol.nvim",
    config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            relculright = true,
            segments = {
                {
                    text = { " " }
                },
                {
                    sign = {
                        namespace = { "diagnostic/signs" },
                        maxwidth = 1,
                        auto = true,
                    }
                },
                {
                    text = { builtin.lnumfunc },
                },
                {
                    text = { " " }
                },
                {
                    sign = {
                        namespace = { "gitsigns" },
                        maxwidth = 1,
                        colwidth = 1,
                        auto = true,
                    }
                },
            }
        })
    end,
}
