local lsp = require("lsp-zero")

lsp.preset("lsp-compe")

lsp.preset({
	float_border = "none",
	configure_diagnostics = false,
	vim.diagnostic.config({
		virtual_text = false,
	}),
})

lsp.set_sign_icons({
	error = "",
	warn = "",
	hint = "",
	info = "",
})
lsp.nvim_workspace()
lsp.setup()
