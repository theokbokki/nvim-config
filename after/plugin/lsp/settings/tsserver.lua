return {
	root_dir = require('lspconfig.util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git",
		vim.loop.cwd())

}
