--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
--
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end
local builtin = require("telescope.builtin")

local setup = {
  layout = {
    width = { max = 30 }, -- min and max width of the columns
    spacing = 3,        -- spacing between columns
  },
  active = true,
  plugins = {
    marks = true,    -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
  },
}

local opts = {
  mode = "n",    -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v",    -- VISUAL mode
  prefix = "<leader>",
  buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local wk = require("which-key")

wk.add({
  { "<leader>w",  "<cmd>w!<CR>",                   desc = "Save" },
  { "<leader>q",  "<cmd>q!<CR>",                   desc = "Quit" },
  { "<leader>x",  "<cmd>bdelete!<CR>",             desc = "Close Buffer" },
  { "<leader>f",  group = "Files" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  {
    "<leader>fh",
    "<cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>",
    desc = "Find hidden files",
  },
  { "<leader>F",  "<cmd>Telescope live_grep theme=ivy<cr>",                                  desc = "Find Text" },
  { "<leader>U",  "<cmd>Telescope undo<cr>",                                                 desc = "Undo Tree" },
  { "<leader>h",  "<cmd>lua vim.lsp.inlay_hint.get({ bufnr = 0 })<cr>",                      desc = "Inlay Hint" },

  { "<leader>g",  group = "Git" },
  { "<leader>gg", "<cmd>Neogit<cr>",                                                         desc = "NeoGit" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",                            desc = "Blame" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                          desc = "Preview Hunk" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                            desc = "Reset Hunk" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                          desc = "Reset Buffer" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                            desc = "Stage Hunk" },
  { "<leader>gd", "<cmd>DiffviewOpen<cr>",                                                   desc = "Diff Open" },
  {
    "<leader>gh",
    "<cmd>DiffviewFileHistory<cr>",
    desc = "Diff File History",
  },
  {
    "<leader>gu",
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    desc = "Undo Stage Hunk",
  },
  {
    "<leader>go",
    "<cmd>Telescope git_status<cr>",
    desc = "Open changed file",
  },
  {
    "<leader>gb",
    "<cmd>Telescope git_branches<cr>",
    desc = "Checkout branch",
  },
  {
    "<leader>gc",
    "<cmd>Telescope git_commits<cr>",
    desc = "Checkout commit",
  },
  {
    "<leader>gC",
    "<cmd>Telescope git_bcommits<cr>",
    desc = "Checkout commit(for current file)",
  },

  { "<leader>l",  group = "LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>ld", "<cmd>Telescope diagnostics<cr>",         desc = "Diagnostics" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",      desc = "Format" },
  { "<leader>li", "<cmd>LspInfo<cr>",                       desc = "Info" },
  { "<leader>lI", "<cmd>Mason<cr>",                         desc = "Mason Info" },
  {
    "<leader>lj",
    vim.diagnostic.goto_next,
    desc = "Next Diagnostic",
  },
  {
    "<leader>lk",
    vim.diagnostic.goto_prev,
    desc = "Prev Diagnostic",
  },
  {
    "<leader>ls",
    "<cmd>Telescope lsp_document_symbols<cr>",
    desc = "Document Symbols",
  },
  {
    "<leader>lS",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    desc = "Workspace Symbols",
  },

  { "<leader>t", group = "Trouble" },
  {
    "<leader>tt",
    "<cmd>Trouble<CR>",
    desc = "Trouble Toggle",
  },
  {
    "<leader>tw",
    "<cmd>Trouble workspace_diagnostics<CR>",
    desc = "Workspace Diagnostics",
  },
  {
    "<leader>td",
    "<cmd>Trouble document_diagnostics<CR>",
    desc = "Document Diagnostics",
  },
  {
    "<leader>tl",
    "<cmd>Trouble loclist<CR>",
    desc = "Trouble Loclist",
  },
  {
    "<leader>tq",
    "<cmd>Trouble quickfix<CR>",
    desc = "Trouble Quickfix",
  },
  {
    "<leader>tr",
    "<cmd>Trouble lsp_references<CR>",
    desc = "LSP References",
  },

  { "<leader>T", group = "TODO" },
  {
    "<leader>Tq",
    "<cmd>TodoQuickFix<CR>",
    desc = "Todo Quick Fix",
  },
  { "<leader>Tl", "<cmd>TodoLocList<CR>",       desc = "Todo LocList" },
  {
    "<leader>Tt",
    "<cmd>TodoTelescope<CR>",
    desc = "Todo Telescope",
  },

  { "<leader>c",  group = "Copilot" },
  { "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "Open Chat" },
  { "<leader>cs", "<cmd>CopilotChatSave<CR>",   desc = "Save Chat" },

  { "<leader>d",  group = "Debugging" },
  {
    "<leader>dt",
    "<cmd>lua require('dap').toggle_breakpoint()<CR>",
    desc = "Toggle Breakpoint",
  },
  { "<leader>dc", "<cmd>lua require('dap').continue()<CR>", desc = "Continue" },

  { "<leader>s",  group = "Search" },
  { "<leader>sd", "<cmd>Telescope help_tags<cr>",           desc = "Find Help" },
  { "<leader>sm", "<cmd>Telescope man_pages<cr>",           desc = "Man Pages" },
  {
    "<leader>sr",
    "<cmd>Telescope oldfiles<cr>",
    desc = "Open Recent File",
  },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>",   desc = "Keymaps" },
  { "<leader>sc", "<cmd>Telescope commands<cr>",  desc = "Commands" },
  {
    "<leader>sp",
    "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
    desc = "Colorscheme with Preview",
  },
}, { mode = "n", noremap = true, silent = true })

which_key.setup(setup)
