local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Define on_attach function to use across LSP configs
local on_attach = function(client, bufnr)
    -- You can add keymaps and other buffer-local settings here
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    -- Add more keymaps as needed
end

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

-- Default server setup for most servers
local get_servers = require("mason-lspconfig").get_installed_servers
for _, server_name in ipairs(get_servers()) do
    if server_name ~= "lua_ls" and server_name ~= "gopls" and server_name ~= "yamlls" then
        lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
            on_attach = on_attach,
        })
    end
end

-- Lua language server with custom settings
lspconfig.lua_ls.setup({
    capabilities = lsp_capabilities,
    on_attach = on_attach,
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
lspconfig.gopls.setup({
    cmd = { "gopls" },
    on_attach = on_attach,
    capabilities = lsp_capabilities,
    filetype = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
})

-- YAML with schema support
lspconfig.yamlls.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
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

-- Go auto-formatting
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require("go.format").goimports()
    end,
    group = format_sync_grp,
})
