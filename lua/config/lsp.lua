--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email: git@fadyio.com           │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
--

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"terraformls",
		"lua_ls",
		"ansiblels",
		"bashls",
		"gopls",
		"jsonls",
		"yamlls",
	},
	automatic_installation = true,
})
local get_servers = require("mason-lspconfig").get_installed_servers
for _, server_name in ipairs(get_servers()) do
	lspconfig[server_name].setup({
		capabilities = lsp_capabilities,
	})
end

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"use",
					"after_each",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- GoLang
lspconfig["gopls"].setup({
	cmd = { "gopls" },
	on_attach = on_attach,
	capabilities = capabilities,
	filetype = { "go", "gomod", "gowork", "gotmpl" },
	lsroot_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	filetypes = { "yaml", "yml" },
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		yaml = {
			format = { enable = true, singleQuote = true },
			hover = true,
			completion = true,
			validate = true,
			schemas = {
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = "roles/tasks/*.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
				["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
				["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
					"/.gitlab-ci.yml",
					"/.gitlab-ci.yaml",
				},
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
				["https://json.schemastore.org/chart.json"] = "Chart.yaml",
				["https://json.schemastore.org/taskfile.json"] = "Taskfile*.yml",
				["https://raw.githubusercontent.com/rancher/k3d/main/pkg/config/v1alpha3/schema.json"] = "k3d.yaml",
			},
			schemaStore = { enable = true, url = "https://www.schemastore.org/json" },
		},
	},
})

-- Create an autocommand group named 'goimports'
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimports()
	end,
	group = format_sync_grp,
})
