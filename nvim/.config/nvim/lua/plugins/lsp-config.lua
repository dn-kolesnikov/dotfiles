vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs, _desc)
			local opts = { noremap = true, silent = true, buffer = true, desc = _desc }
			vim.keymap.set(mode, lhs, rhs, opts)
		end
		bufmap(
			"n",
			"K",
			vim.lsp.buf.hover,
			"Displays hover information about the symbol under the cursor"
		)
		bufmap(
			"n",
			"gi",
			vim.lsp.buf.implementation,
			"Lists all the implementations for the symbol under the cursor"
		)
		bufmap(
			"n",
			"gd",
			vim.lsp.buf.definition,
			"Jump to the definition"
		)
		bufmap(
			"n",
			"gt",
			vim.lsp.buf.type_definition,
			"Jumps to the definition of the type symbol"
		)
		bufmap(
			"n",
			"<localleader>gD",
			vim.lsp.buf.declaration,
			"Jump to declaration"
		)
		bufmap(
			"n",
			"<localleader>gr",
			vim.lsp.buf.references,
			"Lists all the references"
		)
		bufmap(
			"n",
			"<localleader>rn",
			vim.lsp.buf.rename,
			"Renames all references to the symbol under the cursor"
		)
		bufmap(
			"n",
			"<localleader>gbf",
			vim.lsp.buf.format,
			"Format current buffer"
		)
		bufmap(
			"n",
			"<localleader>ca",
			vim.lsp.buf.code_action,
			"Selects a code action available at the current cursor position"
		)
		bufmap(
			"n",
			"<localleader>gl",
			vim.diagnostic.open_float,
			"Show diagnostics in a floating window"
		)
		bufmap(
			"n",
			"<localleader>dk",
			vim.diagnostic.goto_prev,
			"Move to the previous diagnostic"
		)
		bufmap(
			"n",
			"<localleader>dj",
			vim.diagnostic.goto_next,
			"Move to the next diagnostic"
		)
		bufmap(
			"n",
			"<localleader>dl",
			"<cmd>Telescope diagnostics<cr>",
			"Show diagnostics in a Telescope"
		)
	end,
})

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"dockerls", -- Docker
				"gopls", -- Golang
				"graphql", -- GraphQL
				"html", -- HTML
				"jsonls", -- JSON
				"lemminx", -- XML
				"lua_ls", -- Lua
				"marksman", -- Markdown
				"pbls", -- Protobuf
				"prettier", -- JSON, JavaScript
				"sqls", -- SQL
				"taplo", -- TOML
				"vacuum", -- OpenAPI/YAML
				"yamlls", -- YAML
			},
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nanotee/sqls.nvim",
			"b0o/SchemaStore.nvim",
		},
		event = "BufReadPre",

		config = function()
			local lspconfig = require("lspconfig")

			local servers = {
				dockerls = {}, -- Docker
				graphql = {}, -- GraphQL
				html = {}, -- HTML
				lemminx = {}, -- XML
				marksman = {}, -- Markdown
				pbls = {}, -- Protobuf
				sqls = {}, -- SQL
				taplo = {}, -- TOML

				jsonls = { -- JSON
					filetypes = {
						"avsc",
						"json",
						"jsonc",
					},
				},

				lua_ls = { -- lua_ls
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = {
									"vim",
									"require",
								},
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},

				gopls = { -- Golang
					settings = {
						gopls = {
							gofumpt = true,
							analyses = {
								unusedparams = true,
							},
							staticcheck = true,
						},
					},
				},

				yamlls = { -- YAML
					settings = {
						yaml = {
							schemaStore = {
								enable = true,
								url = "https://www.schemastore.org/api/json/catalog.json",
							},
							format = {
								enable = true,
							},
							schemaDownload = {
								enable = true,
							},
							hover = true,
							validate = true,
							completion = true,
						},
					},
					capabilities = {
						textDocument = {
							foldingRange = {
								dynamicRegistration = false,
								lineFoldingOnly = true,
							},
						},
					},
				},

			}

			for server, opts in pairs(servers) do
				lspconfig[server].setup({ opts })
			end
		end,
	},
}
