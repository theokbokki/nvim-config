return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"blade",
				"css",
				"go",
				"html",
				"lua",
				"php",
				"rust",
				"scss",
				"svelte",
			},
			auto_install = true,
			ignore_install = {
				"phpdoc",
			},
			highlight = {
				enable = true,
				disable = {},
			},
			autopairs = {
				enable = true,
			},
            indent = {
                enable = true,
                disable = {"php"},
            }
		})

        require('nvim-treesitter.configs').setup {}

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

        -- Change blade filetypes
		vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true })
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.blade.php",
			command = "set ft=blade",
		})

        -- Change gohtml filetypes
		vim.api.nvim_create_augroup("TemplFiltypeRelated", { clear = true })
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.gohtml",
			command = "set ft=gohtml",
		})

		vim.api.nvim_create_augroup("Shader", { clear = true })
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.frag",
			command = "set ft=glsl",
		})

        vim.filetype.add({ extension = { templ = "templ" }})

		vim.api.nvim_create_augroup("PhpAutoindent", { clear = true })
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.php",
			command = "set ai",
        })
	end,
}
