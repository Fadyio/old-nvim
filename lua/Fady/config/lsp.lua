--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
--

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event) end,
})

local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ansiblels",
		"bashls",
		"gopls",
		"jsonls",
		"pyright",
		"sqlls",
		"yamlls",
		"docker_compose_language_service",
		"dockerls",
	},
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.pyright.setup({})
lspconfig.ansiblels.setup({})
lspconfig.bashls.setup({})
lspconfig.docker_compose_language_service.setup({})
lspconfig.dockerls.setup({})
lspconfig.jsonls.setup({
	capabilities = capabilities,
})

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

-- setup languages
-- GoLang
lspconfig["gopls"].setup({
	cmd = { "gopls" },
	on_attach = on_attach,
	capabilities = capabilities,
	filetype = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
})

local get_servers = require("mason-lspconfig").get_installed_servers
for _, server_name in ipairs(get_servers()) do
	lspconfig[server_name].setup({
		capabilities = lsp_capabilities,
	})
end

require("mason-null-ls").setup({
	ensure_installed = {
		"gofmt",
		"goimports",
		"isort",
		"fixjson",
		"black",
		"terraform_fmt",
		"yamlfmt",
		"stylua",
		"jq",
		"ansiblelint",
		"flake8",
		"golangci_lint",
		"hadolint",
		"todo_comments",
		"trail_space",
		"zsh",
		"yamllint",
	},
	automatic_installation = true,
	handlers = {},
})

-- disable the virtual text
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = { only_current_line = true },
	underline = false,
	severity_sort = true,
	float = {
		border = "rounded",
	},
})

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = "", Warn = "", Hint = "󱍅", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
				["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
				["https://raw.githubusercontent.com/awslabs/goformation/v6.10.0/schema/cloudformation.schema.json"] = {
					"/cloudformation.yml",
					"/cloudformation.yaml",
					"/*.cf.yml",
					"/cf.yaml",
				},
				["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
					"/.gitlab-ci.yml",
					"/.gitlab-ci.yaml",
				},
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
				["https://json.schemastore.org/chart.json"] = "Chart.yaml",
				["https://json.schemastore.org/taskfile.json"] = "Taskfile*.yml",
				["https://raw.githubusercontent.com/GoogleContainerTools/skaffold/master/docs/content/en/schemas/v2beta26.json"] = "skaffold.yaml",
				["https://raw.githubusercontent.com/rancher/k3d/main/pkg/config/v1alpha3/schema.json"] = "k3d.yaml",
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.20.13/all.json"] = "/*.yaml",
			},
			schemaStore = { enable = true, url = "https://www.schemastore.org/json" },
			customTags = {
				"!fn",
				"!And",
				"!If",
				"!Not",
				"!Equals",
				"!Or",
				"!FindInMap sequence",
				"!Base64",
				"!Cidr",
				"!Ref",
				"!Ref Scalar",
				"!Sub",
				"!GetAtt",
				"!GetAZs",
				"!ImportValue",
				"!Select",
				"!Split",
				"!Join sequence",
			},
		},
	},
})

vim.api.nvim_set_hl(0, "LspInlayHint", { link = "NvimDapVirtualText" })
