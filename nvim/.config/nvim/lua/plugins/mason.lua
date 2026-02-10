-- register filetypes for vacuum lsp
vim.filetype.add({
	pattern = {
		["openapi.*%.ya?ml"] = "yaml.openapi",
		["openapi.*%.json"] = "json.openapi",
	},
})

return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"autotools_ls", -- Makefile
				"bashls", -- Bash
				"buf_ls", -- Protobuf
				"dockerls", -- Docker
				"golangci_lint_ls", -- Golang
				"gopls", -- Golang
				"graphql", -- GraphQL
				"html", -- HTML
				"jsonls", -- JSON
				"lemminx", -- XML
				"lua_ls", -- Lua
				"marksman", -- Markdown
				"postgres_lsp", -- SQL
				"qmlls", -- QML
				"stylua", -- lua formatter
				"taplo", -- TOML
				"vacuum", -- openapi/swagger
				"yamlls", -- YAML
			},
			automatic_installation = true,
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{ "neovim/nvim-lspconfig" },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"delve", -- golang debugger
				"gofumpt", -- golang formatter
				"goimports", -- golang formatter
				"golangci-lint", -- golang linter
				"golines", -- golang formatter
				"jq", -- json formatter
				"sleek", -- postgres formatter
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"vacuum", -- openapi/swagger linter
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
		},
	},
}
