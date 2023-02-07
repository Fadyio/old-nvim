--  ╭──────────────────────────────────────────────────────────╮
--  │  Written by @Fadynagh from http://fadyio.com             │
--  │  Email:me@fadyio.com                                     │
--  │  Github: @Fadyio                                         │
--  ╰──────────────────────────────────────────────────────────╯

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Better paste
keymap("v", "p", '"_dP', opts)

-- delete char without copying it
keymap("n", "x", '"_x')

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- unhighlight what you searched for
keymap("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>", { noremap = true })

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- Comment and Comment box
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
-- left aligned fixed size box with left aligned text
keymap("n", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})
keymap("v", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})
-- centered adapted box with centered text
keymap("n", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})
keymap("v", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})
-- centered line
keymap("n", "<Leader>bl", "<Cmd>lua require('comment-box').cline()<CR>", {})
keymap("i", "<M-l>", "<Cmd>lua require('comment-box').cline()<CR>", {})

-- Git
keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)

--  markdown preview plugin for (neo)vim
keymap("n", "<leader>MM", "<cmd>MarkdownPreviewToggle<CR>", opts)
keymap("n", "<leader>MS", "<cmd>MarkdownPreviewStop<CR>", opts)

-- splits
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- split windows equal width
keymap("n", "<leader>sx", ":close<CR>") --  close the current split window

-- tabs
keymap("n", "<leader>to", ":tabnew<CR>") -- open new tab

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
