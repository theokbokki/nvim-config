local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = {
	},
})


local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
	return
end


local servers = {
	"lua_ls",
	"html",
	"cssls",
	"emmet_ls",
	"marksman",
	"tailwindcss",
	"jsonls",
	"vuels",
	"tsserver",
	"svelte",
}

vim.diagnostic.config({ virtual_text = false })

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("lsp/handlers").on_attach,
		capabilities = require("lsp/handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
