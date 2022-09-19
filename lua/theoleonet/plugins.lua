local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
	return
end

-- Plugins
return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim' -- A library of useful lua functions used by many plugins

	-- Themes
	use {
		'sonph/onehalf', -- Has white and dark variants
		rtp = 'vim/',
	}
	use 'xiyaowong/nvim-transparent' -- Remove all background colors to make nvim transparent

	-- Text formatting
	use 'windwp/nvim-autopairs'
	use 'kylechui/nvim-surround'

	-- Completion
	use 'hrsh7th/nvim-cmp' -- A completion plugin for neovim coded in Lua
	use 'hrsh7th/cmp-buffer' -- Buffer completion
	use 'hrsh7th/cmp-path' -- Path completions
	use 'saadparwaiz1/cmp_luasnip' -- Snippet completions
	use 'hrsh7th/cmp-nvim-lsp' -- LSP completion
	use 'hrsh7th/cmp-nvim-lua' -- Neovim lua api completion

	-- Snippets
	use 'L3MON4D3/LuaSnip' -- Snippet Engine for Neovim written in lua
	use 'rafamadriz/friendly-snippets' -- Snippets collection for a set of different programming languages for faster development

	-- LSP
	use 'williamboman/mason.nvim' -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
	use 'williamboman/mason-lspconfig.nvim' -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
	use 'neovim/nvim-lspconfig' -- Quickstart configs for Nvim LSP
	use 'jose-elias-alvarez/null-ls.nvim'
	use {
		'gbprod/phpactor.nvim',
		run = require("phpactor.handler.update"),
	}

	-- Fuzzy finder + file explorer
	use 'nvim-telescope/telescope.nvim' -- Highly extendable fuzzy finder over lists
	use 'nvim-telescope/telescope-file-browser.nvim' -- File browser extension for telescope.nvim

	-- Syntax highlighting
	use 'nvim-treesitter/nvim-treesitter' -- Nvim Treesitter configurations and abstraction layer
	use 'jwalton512/vim-blade' -- Syntax highlighting for blade + changes .blade.php filetype to blade

	-- Comments
	use 'numToStr/Comment.nvim' -- Smart and powerful comment plugin for neovim

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
