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

vim.g.mapleader = ","

require("lazy").setup {
	-- Utilities
	'nvim-lua/plenary.nvim',

	-- Colorschemes
	'chriskempson/base16-vim', -- For writing
	'junegunn/seoul256.vim',   -- For coding
	'xiyaowong/nvim-transparent', -- Remove all background colors to make nvim transparent

	-- FuzzyFinder / Moving around (between files)
	{
		'echasnovski/mini.files',
		version = false
	},
	'nvim-telescope/telescope.nvim',
	'ThePrimeagen/harpoon',
	{
		'gelguy/wilder.nvim',
		dependencies = {
			{
				'liuchengxu/vim-clap',
				build =
				':Clap install-binary' -- This command doesn't really work, instead do :call clap#installer#build_maple()
			},
			'romgrk/fzy-lua-native',
			'nvim-tree/nvim-web-devicons'
		},
	},

	-- Syntax highlighting
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- LSP + CMP
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	},
	'jose-elias-alvarez/null-ls.nvim',
	'mattn/emmet-vim',
	'MunifTanjim/prettier.nvim',
	'Exafunction/codeium.vim',
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		keys = {
			{ "<leader>la", ":Laravel artisan<cr>" },
			{ "<leader>lr", ":Laravel routes<cr>" },
			{
				"<leader>lt",
				function()
					require("laravel.tinker").send_to_tinker()
				end,
				mode = "v",
				desc = "Laravel Application Routes",
			},
		},
		event = { "VeryLazy" },
		config = function()
			require("laravel").setup()
			require("telescope").load_extension "laravel"
		end,
	},
	'jwalton512/vim-blade',

	-- Clipboard management
	'gbprod/yanky.nvim',

	-- Git
	'lewis6991/gitsigns.nvim',
	'tpope/vim-fugitive',

	-- Text formatting
	'windwp/nvim-autopairs',
	'kylechui/nvim-surround',

	-- Moving around (in file)
	{
		'ggandor/leap.nvim',
		dependencies = {
			'tpope/vim-repeat',
		}
	},

	-- Notifications
	"rcarriga/nvim-notify",

	-- Comments
	'numToStr/Comment.nvim', -- Smart and powerful comment plugin for neovim

	-- Writing
	'vimwiki/vimwiki',

	-- Zen
	{
		'folke/zen-mode.nvim',
		requires = { 'xiyaowong/nvim-transparent' }
	},
	'folke/twilight.nvim',
}
