local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
  sources = {
    require("null-ls").builtins.diagnostics.revive,
  },
})

require("mason-null-ls").setup({
  ensure_installed = {
    "gofmt",
    "goimports",
    "revive",
    "isort",
    "fixjson",
    "black",
    "terraform_fmt",
    "yamlfmt",
    "stylua",
    "jq",
    "ansiblelint",
    "flake8",
    "hadolint",
    "todo_comments",
    "shellharden",
    "trail_space",
    "zsh",
    "yamllint",
  },
  automatic_installation = true,
  handlers = {},
})
