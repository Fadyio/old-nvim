--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
	check_ts = true,
	disable_in_macro = true,
	enable_afterquote = true, -- add bracket pairs after quote
	enable_check_bracket_line = true,
	enable_bracket_in_quote = true,
})

local ts_conds = require("nvim-autopairs.ts-conds")

-- press % => %% only while inside a comment or string
npairs.add_rules({
	Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
	Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
})

local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
npairs.add_rules({
	Rule(" ", " "):with_pair(function(opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({
			brackets[1][1] .. brackets[1][2],
			brackets[2][1] .. brackets[2][2],
			brackets[3][1] .. brackets[3][2],
		}, pair)
	end),
})
for _, bracket in pairs(brackets) do
	npairs.add_rules({
		Rule(bracket[1] .. " ", " " .. bracket[2])
			:with_pair(function()
				return false
			end)
			:with_move(function(opts)
				return opts.prev_char:match(".%" .. bracket[2]) ~= nil
			end)
			:use_key(bracket[2]),
	})
end
