return {
	"junegunn/seoul256.vim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		-- vim.cmd([[let g:seoul256_background = 255]])
		-- vim.cmd([[colorscheme seoul256-light]])
	end,
}
