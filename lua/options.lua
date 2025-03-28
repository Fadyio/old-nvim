local opt = vim.opt

-- Encoding settings: UTF-8 for internal and file encoding
opt.encoding = "utf-8" -- Internal encoding

-- General settings
opt.autowrite = true -- Enable auto write
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.backup = false -- Do not create a backup file
opt.writebackup = false -- Disable write backup
opt.swapfile = false -- Don't use swapfile
opt.conceallevel = 2 -- Ensure `` is visible in markdown files
opt.updatetime = 200 -- Faster completion (4000ms default)
opt.completeopt = "menu,menuone,noselect"
opt.undofile = true -- Automatically saves undo history
opt.undolevels = 10000 -- Maximum number of changes that can be undone
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
opt.mouse = "a" -- Allow the mouse to be used in Neovim
opt.wildmode = "longest:full,full" -- Command-line completion mode

-- UI settings
opt.guifont = "JetBrainsMono Nerd Font:h13" -- Font used in graphical Neovim applications
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.pumblend = 10 -- Popup blend
opt.title = true -- Set window title to the name of the current file
opt.pumheight = 6 -- Popup menu height
opt.showtabline = 0 -- Always show tabs
opt.showmode = false -- Don't show mode since we have a statusline
opt.termguicolors = true -- True color support
opt.signcolumn = "yes" -- Always show the signcolumn
opt.wrap = false -- Disable line wrap
opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor
opt.cursorline = true -- Highlight the current line
opt.laststatus = 3 -- Only the last window will always have a status line
opt.showcmd = false -- Hide (partial) command in the last line of the screen (for performance)

opt.foldmethod = "marker"
opt.foldlevel = 99
opt.foldenable = true

-- Search settings
opt.ignorecase = true -- Ignore case in search patterns
opt.inccommand = "nosplit" -- Preview incremental substitute
opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters
opt.hlsearch = true -- Highlight all matches on previous search pattern
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

-- Better command completion
opt.wildignorecase = true
opt.wildignore:append("**/node_modules/*")
opt.wildignore:append("**/.git/*")

-- Avoid showing extra messages when using completion
opt.shortmess:append("c")

-- Window settings
opt.splitbelow = true -- Force all horizontal splits to go below current window
opt.splitright = true -- Force all vertical splits to go to the right of current window

-- Tabs and indentation
opt.smartindent = true -- Smart indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.numberwidth = 2 -- Set number column width to 2 (default 4)

-- Disable netrw at the very start of your init.lua
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
}
for _, plugin in pairs(disabled_plugins) do
	vim.g["loaded_" .. plugin] = 1
end
