local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	auto_install = true,
	sync_install = false,

	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	},
	indent = { enable = true, disable = { "" } },
	autotag = { enable = true },
	endwise = { enable = true },
})
