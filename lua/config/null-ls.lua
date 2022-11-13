local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local completion = null_ls.builtins.completion
--NOTE how to args to null-ls [with({ extra_args = { "--format" } }),]

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should useinstead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	sources = {
		-- formatting
		formatting.stylua, --lua
		formatting.autopep8, -- automatically formats Python code to conform to the PEP 8 style guide.
		formatting.black, --for python
		formatting.clang_format, -- c and c++
		formatting.eslint_d, -- For javascript
		formatting.fixjson, -- For json files
		formatting.gofmt, -- For golang
		formatting.goimports, --Updates your Go import lines, adding missing ones and removing unreferenced ones
		formatting.isort, --Python utility / library to sort imports alphabetically and automatically separate
		formatting.jq, -- Command-line JSON processor
		formatting.pg_format, -- PostgreSQL SQL syntax beautifier
		formatting.rubocop, -- Ruby static code analyzer and formatter
		formatting.rustfmt, -- for rust
		formatting.shellharden, -- For shell
		formatting.shfmt, -- for shell
		formatting.sql_formatter, -- formatter for different query languages
		formatting.terraform_fmt, -- The terraform-fmt command rewrites terraform
		formatting.trim_newlines.with({ disabled_filetypes = { "yaml", "yml" } }), -- A simple wrapper around awk to remove trailing newlines.
		formatting.trim_whitespace.with({ disabled_filetypes = { "yml", "yaml" } }), -- A simple wrapper around awk to remove trailing whitespace.
		formatting.yamlfmt, -- yamlfmt is an extensible command line tool

		-- diagnostics
		diagnostics.ansiblelint, -- for ansible
		diagnostics.cppcheck, -- for c and c++
		diagnostics.eslint_d, -- for javascript
		diagnostics.cpplint, -- tool to check C/C++ files for style issues following Google's C++ style guide
		diagnostics.flake8, -- for python
		diagnostics.gitlint, -- for git
		diagnostics.golangci_lint, -- For Go
		diagnostics.staticcheck, -- For Go
		diagnostics.hadolint, -- for Dockerfile
		diagnostics.luacheck, -- for lua
		diagnostics.rubocop, -- For ruby
		diagnostics.todo_comments, -- For Todo comments
		diagnostics.trail_space, -- Uses inbuilt Lua code to detect lines with trailing whitespace
		diagnostics.shellcheck, -- for shell
		diagnostics.zsh, -- for zsh
		diagnostics.yamllint, -- for yaml

		-- actions
		actions.gitsigns, -- Injects code actions for Git operations
		actions.shellcheck, -- for bash, zsh, sh files
		actions.eslint_d, -- codeAction for javascript and its framework

		-- Completion
		completion.luasnip,
	},
})
