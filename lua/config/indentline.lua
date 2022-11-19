local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indent_blankline.setup({
	enabled = true,
	char = "▏",
	show_trailing_blankline_indent = false,
	colored_indent_levels = false,
	show_first_indent_level = true,
	use_treesitter = true,
	show_current_context = true,
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = {
		"help",
		"packer",
		"NvimTree",
		"alpha",
		"dashboard",
		"dashpreview",
		"neo-tree",
		"vista",
		"sagahover",
		"sagasignature",
		"log",
		"lspsagafinder",
		"lspinfo",
		"dapui_scopes",
		"dapui_breakpoints",
		"dapui_stacks",
		"dapui_watches",
		"dap-repl",
		"toggleterm",
	},
})
