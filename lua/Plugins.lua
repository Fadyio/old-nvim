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
  { "zbirenbaum/copilot.lua",         lazy = true },
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
  --  A file explorer yazi
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        function()
          require("yazi").yazi()
        end,
        desc = "Open the file manager",
      },
      {
        -- Open in the current working directory
        "<leader>e",
        function()
          require("yazi").yazi(nil, vim.fn.getcwd())
        end,
        desc = "Open the file manager in nvim's working directory",
      },
    },
    ---@type YaziConfig
    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 0.8,
    },
  },
  -- display a popup with possible key bindings of the command you started typing
  { "folke/which-key.nvim",    lazy = true },
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

  -------------------------- Telescope -----------------------------
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
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
  { "lukas-reineke/indent-blankline.nvim",      main = "ibl",  opts = {} },
  -- Nvim-web-devicons
  { "nvim-tree/nvim-web-devicons" },
  -- statline for neovim
  { "nvim-lualine/lualine.nvim" },

  --  The neovim tabline plugin
  { "akinsho/bufferline.nvim" },
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
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
  },
})
