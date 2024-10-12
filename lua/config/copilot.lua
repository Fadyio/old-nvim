local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end

copilot.setup({
	panel = { enabled = false },
	suggestion = { enabled = false },
	filetypes = {
		yaml = true,
		markdown = false,
		help = false,
		gitcommit = true,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 16.x
	server_opts_overrides = {},
})