local nvim_web_devicons_status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not nvim_web_devicons_status_ok then
	return
end

nvim_web_devicons.setup({
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh",
		},
	},
	color_icons = true,
	default = true,
})
