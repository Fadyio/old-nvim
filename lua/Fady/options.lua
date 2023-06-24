--                ╭─────────────────────────────────────────────╮
--                │ Written by @Fadynagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
----------------------------------------------------------------------------
--                                 ╭──────────╮
--                                 │ settings │
--                                 ╰──────────╯
-------------------------------GLOBAL OPTIONS------------------------------- {{{
vim.g.modelines = false -- Disable modelines as a security precaution
vim.opt.fileencoding = "utf-8" -- Set encoding and fileencoding to utf-8
vim.opt.encoding = "UTF-8" -- Set encoding UTF-8
vim.opt.autowrite = true -- enable auto write
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.backup = false -- creates a backup file
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.undolevels = 10000 -- Maximum number of changes that can be undone
vim.opt.undofile = true -- automatically saves undo history
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.filetype = "on"
vim.opt.swapfile = false -- don't use swapfile
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.spelllang = "en_us"
vim.opt.spell = true

--------------------------------------------------------------------------- }}}
-- UI config
vim.opt.guifont = "JetBrainsMono Nerd Font:h13" -- the font used in graphical neovim applications
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.pumblend = 10 -- Popup blend
vim.opt.title = true -- This option tells Neovim to set the window title to the name of the current file.
vim.opt.pumheight = 6 -- pop up menu height
vim.opt.showtabline = 0 -- always show tabs
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.termguicolors = true -- True color support
vim.opt.signcolumn = "yes:1" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.wrap = false -- Disable line wrap
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.cursorline = true -- highlight the current line
vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.fillchars:append({ eob = " " }) -- remove the ~ from end of buffer
--vim.opt.ruler = false -- hide the line and column number of the cursor position
vim.opt.laststatus = 3 -- only the last window will always have a status line
vim.opt.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
-- Search Settings
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "split" -- preview incremental substitute
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
-- Window Settings
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
-- Tabs and Indentation
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
---------------------------------------------------------------------------- }}}
--------------------------DISABLE BUILT IN PLUGINS-------------------------- {{{
local disabled_plugins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}
for _, plugin in pairs(disabled_plugins) do
	vim.g["loaded_" .. plugin] = 1
end
