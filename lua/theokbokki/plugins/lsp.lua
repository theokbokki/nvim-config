return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	    "simrat39/rust-tools.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local capabilities = cmp_nvim_lsp.default_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
		local opts = { noremap = true, silent = true }

		vim.diagnostic.config({
            virtual_text = false,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "●",
                    [vim.diagnostic.severity.WARN] = "●",
                    [vim.diagnostic.severity.HINT] = "●",
                    [vim.diagnostic.severity.INFO] = "●",
                },
            },
        })

		-- show diagnostics for line
		keymap.set("n", "<leader>d", vim.diagnostic.open_float)
		keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev)
		keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr
            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(bufnr, true)
            end

			-- go to declaration
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			-- go to declaration
			keymap.set("n", "gd", vim.lsp.buf.definition, opts)

			-- see available code actions, in visual mode will apply to selection
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			-- smart rename
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			-- show documentation for what is under cursor
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			-- Bro it helps don't ask questions
			keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

			-- mapping to restart lsp if necessary
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"emmet_ls",
				"gopls",
                "templ",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"phpactor",
				"rust_analyzer",
				"svelte",
				"tsserver",
				"volar",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									-- Get the language server to recognize the `vim` global
									globals = { "vim" },
								},
							},
						},
					})
				end,

				["rust_analyzer"] = function()
					require("rust-tools").setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,

				["emmet_ls"] = function()
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						filetypes = {
							"astro",
							"htmldjango",
							"css",
							"html",
							"scss",
							"svelte",
							"vue",
							"blade",
                            "gohtml",
                            "templ",
                            "eruby"
						},
					})
				end,

                ["phpactor"] = function()
                    lspconfig.phpactor.setup{
                        on_attach = on_attach,
                        init_options = {
                            ["language_server_phpstan.enabled"] = false,
                            ["language_server_psalm.enabled"] = false,
                            ["language_server_php_cs_fixer.enabled"] = false,
                            ["php_code_sniffer.enabled"] = false,
                            ["language_server_worse_reflection.inlay_hints.enable"] = false,
                            -- ["language_server_worse_reflection.inlay_hints.params"] = true,
                            -- ["language_server_worse_reflection.inlay_hints.types"] = true,
                        }
                    }
                end
			},
		})
	end,
}
