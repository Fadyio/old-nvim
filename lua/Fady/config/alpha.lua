--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	"                                                                             			",
	"  ███████╗     █████╗     ██████╗     ██╗   ██╗    ███╗   ██╗    ██╗   ██╗    ██╗    ███╗   ███╗  ",
	"  ██╔════╝    ██╔══██╗    ██╔══██╗    ╚██╗ ██╔╝    ████╗  ██║    ██║   ██║    ██║    ████╗ ████║  ",
	"  █████╗      ███████║    ██║  ██║     ╚████╔╝     ██╔██╗ ██║    ██║   ██║    ██║    ██╔████╔██║  ",
	"  ██╔══╝      ██╔══██║    ██║  ██║      ╚██╔╝      ██║╚██╗██║    ╚██╗ ██╔╝    ██║    ██║╚██╔╝██║  ",
	"  ██║         ██║  ██║    ██████╔╝       ██║       ██║ ╚████║     ╚████╔╝     ██║    ██║ ╚═╝ ██║  ",
	"  ╚═╝         ╚═╝  ╚═╝    ╚═════╝        ╚═╝       ╚═╝  ╚═══╝      ╚═══╝      ╚═╝    ╚═╝     ╚═╝  ",
	"                                                                             ",
}
dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "󰷾 " .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Keyword"

vim.api.nvim_create_autocmd("User", {
	callback = function()
		local stats = require("lazy").stats()
		local ms = math.floor(stats.startuptime * 100) / 100
		dashboard.section.footer.val = "󱐌 Lazy-loaded " .. stats.loaded .. " plugins in " .. ms .. "ms"
		pcall(vim.cmd.AlphaRedraw)
	end,
})

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
