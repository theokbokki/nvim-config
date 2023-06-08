local ok, prettier = pcall(require, "prettier")
if not ok then
	return
end

prettier.setup({
	bin = 'prettierd', -- or `'prettierd'` (v0.22+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"vimwiki",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	["null-ls"] = {
		condition = function()
			return prettier.config_exists({
				-- if `false`, skips checking `package.json` for `"prettier"` key
				check_package_json = true,
			})
		end,
		runtime_condition = function(params)
			-- return false to skip running prettier
			return true
		end,
		timeout = 5000,
	}
})
