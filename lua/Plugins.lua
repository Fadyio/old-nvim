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
	-- Git integration for buffers
	{ "lewis6991/gitsigns.nvim" },
	--  tmux integration for nvim features pane movement and resizing from within nvim.
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	},

	-------------------------- LSP -----------------------------------
	-- LSP Support
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	-- Autocompletion with CMP
	{ "hrsh7th/nvim-cmp" },
	-- LSP source for nvim-cmp
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "zbirenbaum/copilot.lua", lazy = true },
	{ "ray-x/cmp-sql" },
	{ "CopilotC-Nvim/CopilotChat.nvim", lazy = true },
	{ "AndreM222/copilot-lualine" },
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{ "nvimtools/none-ls.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },
	{
		"ray-x/go.nvim",
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{ "onsails/lspkind.nvim" },
	---------------------------------------------------------------------
	--  A file explorer tree for neovim written in lua
	{ "nvim-tree/nvim-tree.lua" },
	-- display a popup with possible key bindings of the command you started typing
	{ "folke/which-key.nvim", lazy = true },
	-- Neogit
	{ "NeogitOrg/neogit" },
	-- Diffview
	{ "sindrets/diffview.nvim" },
	--
	-- A pretty diagnostics, references, telescope results, quickfix and location list
	{ "folke/trouble.nvim" },
	-- white_check_mark Highlight, list and search todo comments in your projects
	{ "folke/todo-comments.nvim" },
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	},

	{
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
			})
		end,
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	},
	--  Neovim's answer to the mouse
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
    --stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
	},
	-- powerful autopair plugin for Neovim that supports multiple characters
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	--------------------------- Dubugger --------------------------------
	-- {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	dependencies = { "leoluz/nvim-dap-go", "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	-- },
	-------------------------- Telescope -----------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"debugloop/telescope-undo.nvim",
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	--------------------------- UI ------------------------------------
	--A fancy, configurable, notification manager for NeoVim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "rcarriga/nvim-notify" },
	},
	-- adds indentation guides to all lines (including empty lines).
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- customizable start screen for neovim.
	{ "goolord/alpha-nvim", lazy = true },
	-- Nvim-web-devicons
	{ "nvim-tree/nvim-web-devicons" },
	-- statline for neovim
	{ "nvim-lualine/lualine.nvim" },

	--  The neovim tabline plugin
	{ "akinsho/bufferline.nvim" },
	--  Smooth scrolling neovim plugin written in lua
	{
		"karb94/neoscroll.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local opts = {
				mappings = {
					"<C-u>",
					"<C-d>",
				},
			}
			require("neoscroll").setup(opts)
		end,
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "HiPhish/rainbow-delimiters.nvim" },
	{
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
	},
})
