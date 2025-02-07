return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			-- go = { "gofmt", "goimports" },
			avsc = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
