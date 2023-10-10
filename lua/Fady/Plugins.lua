--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                │              My Neovim Plugins              │
--                ╰─────────────────────────────────────────────╯
-- Bootstrapping LayzNvim Plugin manager
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
require("lazy").setup({
	------------------------ Essential ---------------------------------
	-- dependence dependency for many plugins. Super useful Lua functions
	{ "nvim-lua/plenary.nvim" },
	--  UI Component Library for Neovim
	{ "MunifTanjim/nui.nvim" },
	--  Neovim plugin to improve the default vim.ui interfaces
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	-- Git integration for buffers
	{ "lewis6991/gitsigns.nvim" },
	--  SQLite LuaJIT binding with a very simple api.
	{ "kkharji/sqlite.lua" },
	--  tmux integration for nvim features pane movement and resizing from within nvim.
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	},

	-------------------------- LSP -----------------------------------
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
	{ "jayp0521/mason-null-ls.nvim" },
	-- Autocompletion with CMP
	{ "hrsh7th/nvim-cmp" }, -- Required
	-- LSP source for nvim-cmp
	{ "hrsh7th/cmp-nvim-lsp" }, -- Required
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	{ "rafamadriz/friendly-snippets" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "zbirenbaum/copilot.lua", lazy = true },
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	--  A collection of common configurations for the Nvim LSP client
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-cmdline" },
	{ "onsails/lspkind.nvim" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	},
	--  A feature-rich Go development plugin
	{
		"ray-x/go.nvim",
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	-- null-ls.nvim
	{ "jose-elias-alvarez/null-ls.nvim" },
	--  A file explorer tree for neovim written in lua
	{ "nvim-tree/nvim-tree.lua" },
	-- display a popup with possible key bindings of the command you started typing
	{ "folke/which-key.nvim", lazy = true },
	--  Clarify and beautify your comments using boxes and lines.
	{ "LudoPinelli/comment-box.nvim", event = "VeryLazy" },
	-- Smart and Powerful commenting plugin for neovim
	{ "numToStr/Comment.nvim", event = "VeryLazy" },
	-- Lazygit
	{ "kdheepak/lazygit.nvim", event = "VeryLazy" },
	-- A pretty diagnostics, references, telescope results, quickfix and location list
	{ "folke/trouble.nvim" },
	-- white_check_mark Highlight, list and search todo comments in your projects
	{ "folke/todo-comments.nvim" },
	-- wakatime plugin
	{ "wakatime/vim-wakatime" },
	--  Neovim's answer to the mouse
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	-- powerful autopair plugin for Neovim that supports multiple characters
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	--  markdown preview plugin for (neo)vim
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		lazy = true,
		build = "cd app && npm install && git reset --hard",
	},
	-------------------------- Telescope -----------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = {
			"debugloop/telescope-undo.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-frecency.nvim" },
		},
	},
	--------------------------- UI ------------------------------------
	--A fancy, configurable, notification manager for NeoVim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "rcarriga/nvim-notify" },
	},
	-- adds indentation guides to all lines (including empty lines).
	{ "lukas-reineke/indent-blankline.nvim" },
	-- customizable start screen for neovim.
	{ "goolord/alpha-nvim", lazy = true },
	-- Nvim-web-devicons
	{ "nvim-tree/nvim-web-devicons" },
	-- statline for neovim
	{ "nvim-lualine/lualine.nvim" },
	--  The neovim tabline plugin
	{ "akinsho/bufferline.nvim", version = "*" },
	--  Neovim colorizer
	{ "NvChad/nvim-colorizer.lua" },
	--  Smooth scrolling neovim plugin written in lua
	{ "karb94/neoscroll.nvim" },
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "HiPhish/nvim-ts-rainbow2" },
	-- colorscheme
	{
		"catppuccin/nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		name = "catppuccin",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	-- { "nyoom-engineering/oxocarbon.nvim", lazy = true },
})
