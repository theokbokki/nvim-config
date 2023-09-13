local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	-- Utilities
	'nvim-lua/plenary.nvim',

	-- Text formating
	'windwp/nvim-autopairs',
	'kylechui/nvim-surround',

	-- Comments
	'numToStr/Comment.nvim',

	-- Moving around (files/dirs)
	'ThePrimeagen/harpoon',
	{
		'folke/flash.nvim',
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{ "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
			{
				"S",
				mode = { "n", "o", "x" },
				function() require("flash").treesitter() end,
				desc =
				"Flash Treesitter"
			},
			{
				"r",
				mode = "o",
				function() require("flash").remote() end,
				desc =
				"Remote Flash"
			},
			{
				"R",
				mode = { "o", "x" },
				function() require("flash").treesitter_search() end,
				desc =
				"Treesitter Search"
			},
			{
				"<c-s>",
				mode = { "c" },
				function() require("flash").toggle() end,
				desc =
				"Toggle Flash Search"
			},
		},
	},

	-- File explorer
	'stevearc/oil.nvim',

	-- Fuzzy finder
	'nvim-telescope/telescope.nvim',

	-- Syntax highlighting
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- Colorscheme
	{ 'rose-pine/neovim',                name = 'rose-pine' },
	'marko-cerovac/material.nvim',
	'rktjmp/lush.nvim',
	{ dir = '~/tests/whitecube', },

	-- LSP
	'neovim/nvim-lspconfig',
	{
		'williamboman/mason.nvim',
		build = function()
			pcall(vim.cmd, 'MasonUpdate')
		end,
	},
	'williamboman/mason-lspconfig.nvim',
	'nvimdev/guard.nvim',
	'folke/trouble.nvim',
	'mattn/emmet-vim',
	'jwalton512/vim-blade',

	-- Completion
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',

	-- Snippets
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',

	-- Status line
	'tamton-aquib/staline.nvim',

	-- Writing
	'vimwiki/vimwiki',

	-- Zen
	'folke/zen-mode.nvim'
}
