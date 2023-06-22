--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
local status_ok, oil = pcall(require, "oil")
if not status_ok then
	return
end

oil.setup({
	columns = {
		"icon",
		"permissions",
		"size",
	},
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = true,
		-- This function defines what is considered a "hidden" file
		is_hidden_file = function(name, bufnr)
			return vim.startswith(name, ".")
		end,
	},
})
