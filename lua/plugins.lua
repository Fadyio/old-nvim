--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │                                             │
--                │             Email:me@fadyio.com             │
--                │                                             │
--                │               Github: @fadyio               │
--                │                                             │
--                │              My Neovim Plugins              │
--                ╰─────────────────────────────────────────────╯

-- Bootstrapping Packer Plugins manager
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",

		install_path,
	})
end
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	git = {
		cmd = "git", -- The base command for git operations
		depth = 1, -- Git clone depth
		clone_timeout = 1000, -- Timeout, in seconds, for git clones
		default_url_format = "https://github.com/%s", -- Lua format string used for "aaa/bbb" style plugins
	},
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Let packer manage itself
	use("wbthomason/packer.nvim")
	-- Replace default filetype.vim which is slower
	use("nathom/filetype.nvim")
	-- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/popup.nvim")
	-- UI Component Library for Neovim.
	use("MunifTanjim/nui.nvim")
	-- Required dependency for many plugins. Super useful Lua functions
	use("nvim-lua/plenary.nvim")
	-- Fix neovim CursorHold and CursorHoldI autocmd events performance bug
	use("antoinemadec/FixCursorHold.nvim")
	-- Speeds up load times
	use("lewis6991/impatient.nvim")
	-- highly opinionated wrapper for storing, retrieving, caching, and persisting SQLite
	use("tami5/sqlite.lua")
	---------------------------------------------------------------------------- }}}
	---------------------------------APPEARANCE--------------------------------- {{{
	-- customizable start screen for neovim.
	use("goolord/alpha-nvim")
	-- display a popup with possible key bindings of the command you started typing
	use("folke/which-key.nvim")
	-- adds indentation guides to all lines (including empty lines).
	use("lukas-reineke/indent-blankline.nvim")
	-- bufferline
	use("akinsho/bufferline.nvim")
	-- A high-performance color highlighter for Neovim
	use("norcalli/nvim-colorizer.lua")
	-- This plugin provides the same icons as well as colors for each icon.
	use("nvim-tree/nvim-web-devicons")
	-- Highlight words and lines on the cursor for Neovim
	use("RRethy/vim-illuminate")
	-- Neovim statusline written in Lua.
	use("nvim-lualine/lualine.nvim")
	--A fancy, configurable, notification manager for NeoVim
	use("rcarriga/nvim-notify")
	-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
	use("folke/noice.nvim")
	--  Go development plugin for Vim
	use("fatih/vim-go")

	-- markdown previewer
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	-- nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")

	-- 	---------------------------------------------------------------------------- }}}k
	-- 	-------------------------------LSP FEATURES------------------------------ {{{
	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jayp0521/mason-null-ls.nvim" },
			{ "jayp0521/mason-nvim-dap.nvim" },
			-- cmp plugins
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },
			{ "tamago324/cmp-zsh" },
			{ "dmitmel/cmp-cmdline-history" },
			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	-- null-ls.nvim
	use("jose-elias-alvarez/null-ls.nvim")
	--  Clarify and beautify your comments using boxes and lines.
	use("LudoPinelli/comment-box.nvim")
	--  vscode-like pictograms for neovim lsp completion items
	use("onsails/lspkind.nvim")

	-- 	---------------------------------------------------------------------------- }}}k
	-- 	-------------------------------  Debug Adapter ------------------------------ {{{
	-- DAP (Debug Adapter Protocol)
	-- use("mfussenegger/nvim-dap")
	-- -- nvim-dap-ui
	-- use("rcarriga/nvim-dap-ui")
	-- -- A NeoVim plugin for managing several debuggers for Nvim-dap
	-- use("ravenxrz/DAPInstall.nvim")
	-- 	---------------------------------------------------------------------------- }}}
	-- 	-------------------------------EDITOR FEATURES------------------------------ {{{
	-- Smart and Powerful commenting plugin for neovim
	use("numToStr/Comment.nvim")
	-- powerful autopair plugin for Neovim that supports multiple characters
	use("windwp/nvim-autopairs")
	-- nvim-tree
	use("nvim-tree/nvim-tree.lua")
	-- GIT
	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")
	-- A pretty diagnostics, references, telescope results, quickfix and location list
	use("folke/trouble.nvim")
	-- white_check_mark Highlight, list and search todo comments in your projects
	use("folke/todo-comments.nvim")
	--  Neovim motions on speed!
	use("phaazon/hop.nvim")
	-- wakatime plugin
	use("wakatime/vim-wakatime")
	-- telescope.nvim
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-file-browser.nvim")
	--  The superior project management solution for Neovim
	use("ahmedkhalf/project.nvim")

	---------------------------------------------------------------------------- }}}
	-------------------------------  colorScheme  ------------------------------ {{{

	use({ "catppuccin/nvim", as = "catppuccin" })
	use("sainnhe/gruvbox-material")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
