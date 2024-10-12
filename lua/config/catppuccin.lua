--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
require("catppuccin").setup({
  flavour = "auto", -- latte, frappe, macchiato, mocha
  background = {   -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
  term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" },     -- Change the style of comments
    conditionals = { "italic" },
  },
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    treesitter = true,
    notify = true,
    treesitter_context = true,
    rainbow_delimiters = true,
    alpha = true,
    mason = true,
    noice = true,
    nvimtree = true,
    which_key = true,
    flash = true,
    harpoon = true,
    dap = true,
    dap_ui = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    lsp_trouble = true,
    telescope = {
      enabled = true,
      style = "nvchad",
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
