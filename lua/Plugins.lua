--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                │              My Neovim Plugins              │
--                ╰─────────────────────────────────────────────╯
-- Bootstrapping LayzNvim Plugins manager
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

local plugins = {

	-- An implementation of the Popup API from vim in Neovim
	"nvim-lua/popup.nvim",
	-- UI Component Library for Neovim.
	"MunifTanjim/nui.nvim",
	-- dependence dependency for many plugins. Super useful Lua functions
	"nvim-lua/plenary.nvim",
	-- Fix neovim CursorHold and CursorHoldI autocmd events performance bug
	"antoinemadec/FixCursorHold.nvim",
	-- Speeds up load times
	"lewis6991/impatient.nvim",
	-- highly opinionated wrapper for storing, retrieving, caching, and persisting SQLite
	"tami5/sqlite.lua",
	-- customizable start screen for neovim.
	{ "goolord/alpha-nvim", lazy = true },
	-- display a popup with possible key bindings of the command you started typing
	{ "folke/which-key.nvim", lazy = true },
	-- adds indentation guides to all lines (including empty lines).
	"lukas-reineke/indent-blankline.nvim",
	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	--  tmux integration for nvim features pane movement and resizing from within nvim.
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	},

	-- A high-performance color highlighter for Neovim
	"norcalli/nvim-colorizer.lua",
	-- Highlight words and lines on the cursor for Neovim
	"RRethy/vim-illuminate",
	-- Neovim statusline written in Lua.
	"nvim-lualine/lualine.nvim",
	--A fancy, configurable, notification manager for NeoVim
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "rcarriga/nvim-notify" },
	},
	-- treesitter helpers
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",
	-- 	---------------------------------------------------------------------------- }}}k
	-- 	-------------------------------LSP FEATURES------------------------------ {{{
	-- LSP

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "jayp0521/mason-null-ls.nvim" },
			{ "jayp0521/mason-nvim-dap.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },
			{ "tamago324/cmp-zsh" },
			{ "dmitmel/cmp-cmdline-history" },
			{ "rafamadriz/friendly-snippets" },
		},
	},

	--  vscode-like pictograms for neovim lsp completion items
	"onsails/lspkind.nvim",
	-- null-ls.nvim
	"jose-elias-alvarez/null-ls.nvim",
	--  Clarify and beautify your comments using boxes and lines.
	"LudoPinelli/comment-box.nvim",
	-- 	-------------------------------EDITOR FEATURES------------------------------ {{{
	-- Smart and Powerful commenting plugin for neovim
	"numToStr/Comment.nvim",
	-- powerful autopair plugin for Neovim that supports multiple characters
	"windwp/nvim-autopairs",
	-- nvim-tree
	"nvim-tree/nvim-tree.lua",
	-- GIT
	"lewis6991/gitsigns.nvim",
	"kdheepak/lazygit.nvim",
	-- A pretty diagnostics, references, telescope results, quickfix and location list
	"folke/trouble.nvim",
	-- white_check_mark Highlight, list and search todo comments in your projects
	"folke/todo-comments.nvim",
	--  Neovim motions on speed!
	"phaazon/hop.nvim",
	-- wakatime plugin
	"wakatime/vim-wakatime",
	-- telescope.nvim
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-file-browser.nvim",
	--  The superior project management solution for Neovim
	"ahmedkhalf/project.nvim",
	-- Neovim plugin to preview the contents of the registers
	{
		"tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ '"', mode = { "n", "v" } },
			{ "<C-R>", mode = "i" },
		},
		cmd = "Registers",
	},
	--  Seamless navigation between tmux panes and vim splits
	"christoomey/vim-tmux-navigator",
	---------------------------------------------------------------------------- }}}
	-------------------------------  colorScheme  ------------------------------ {{{

	{ "catppuccin/nvim", as = "catppuccin" },
	"sainnhe/gruvbox-material",
}
require("lazy").setup(plugins, opts)
