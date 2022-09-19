local ok, null_ls = pcall(require, 'null-ls')
if not ok then
	return
end

null_ls.setup {
	sources = {
		null_ls.builtins.formatting.blade_formatter.with {
			args = { "-i=2", "--write", "$FILENAME" }
		},
		null_ls.builtins.formatting.pint.with {
			command = 'pint'
		},
	}
}
