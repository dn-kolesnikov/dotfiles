return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			avsc = { "jq" },
			json = { "jq" },
			graphql = { "prettier" },
			markdown = { "prettier" },
			yaml = { "prettier" },
			lua = { "stylua" },
			sql = { "sleek" },
			go = {
				"goimports",
				"gofumpt",
				-- "golines",
			},
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 2000,
			async = false,
		},
	},
}
