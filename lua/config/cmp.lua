local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- local kind_icons = {
-- 	Text = "",
-- 	Method = "",
-- 	Function = "",
-- 	Constructor = "",
-- 	Field = "",
-- 	Variable = "",
-- 	Class = "",
-- 	Interface = "",
-- 	Module = "",
-- 	Property = "",
-- 	Unit = "",
-- 	Value = "",
-- 	Enum = "",
-- 	Keyword = "",
-- 	Snippet = "",
-- 	Color = "",
-- 	File = "",
-- 	Reference = "",
-- 	Folder = "",
-- 	EnumMember = "",
-- 	Constant = "",
-- 	Struct = "",
-- 	Event = "",
-- 	Operator = "",
-- 	TypeParameter = "",
-- }

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
	formatting = { format = require("lspkind").cmp_format() },
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "treesitter" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	view = {
		entries = "custom",
	},
	completion = {
		keyword_length = 1,
		completeopt = "menu,noselect",
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
		{
			{ name = "cmdline_history" },
		},
	}),
})

-- setup zsh compluting
_ = vim.cmd([[
  augroup CmpZsh
    au!
    autocmd Filetype zsh lua require'cmp'.setup.buffer { sources = { { name = "zsh" }, } }
  augroup END
]])

-- Use buffer source for `/`
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

--  see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
-- vim.cmd([[
--   highlight! link CmpItemMenu Comment
--   " gray
--   highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--   " blue
--   highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
--   highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
--   " light blue
--   highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
--   highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
--   highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
--   " pink
--   highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
--   highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
--   " front
--   highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--   highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
--   highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
-- ]])
