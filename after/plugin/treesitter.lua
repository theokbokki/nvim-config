local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

treesitter.setup {
	ensure_installed = {},
	auto_install = true,
	ignore_install = {
		'phpdoc',
	},
	highlight = {
		enable = true,
		disable = {}
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {}
	},
	additional_vim_regex_highlighting = {
		'blade',
	},
	context_commentstring = {
		enable = true,
	},
}
