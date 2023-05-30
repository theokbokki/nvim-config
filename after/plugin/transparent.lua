local ok, transparent = pcall(require, 'transparent')
if not ok then
	return
end

transparent.setup {
	groups = { -- table: default groups
		'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
		'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
		'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
		'SignColumn', 'CursorLineNr', 'EndOfBuffer',
	},
	extra_groups = {
		"NormalFloat", "TelescopePrompt"
	},                -- table: additional groups that should be cleared
	exclude_groups = {}, -- table: groups you don't want to clear}
}

vim.api.nvim_create_autocmd(
	"BufWinEnter",
	{
		pattern = '*',
		callback = function()
			vim.defer_fn(function()
				vim.cmd('TransparentEnable')
				vim.cmd('highlight GitSignsAdd guibg=NONE')
			end, 250)
		end
	}
)
