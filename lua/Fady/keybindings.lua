--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯

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
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Disable annoying command line thing
keymap("n", "q:", ":q<CR>")

-- Easy insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<Esc>A;<Esc>")
keymap("i", ",,", "<Esc>A,<Esc>")

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

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap("v", "y", "myy`y")
keymap("v", "Y", "myY`y")

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

-- Comment and Comment box
vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
vim.keymap.set("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
-- left aligned fixed size box with left aligned text
vim.keymap.set("n", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})
vim.keymap.set("v", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})
-- centered adapted box with centered text
vim.keymap.set("n", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})
vim.keymap.set("v", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})
-- centered line
vim.keymap.set("n", "<Leader>bl", "<Cmd>lua require('comment-box').cline()<CR>", {})
keymap("i", "<M-l>", "<Cmd>lua require('comment-box').cline()<CR>", {}) -- Git
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)

--  markdown preview plugin for (neo)vim
vim.keymap.set("n", "<leader>MM", "<cmd>MarkdownPreviewToggle<CR>", opts)
vim.keymap.set("n", "<leader>MS", "<cmd>MarkdownPreviewStop<CR>", opts)

-- LSP keymap
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
vim.keymap.set("n", "<F4>", "cmd>lua vim.lsp.buf.range_code_action()<cr>", opts)
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
