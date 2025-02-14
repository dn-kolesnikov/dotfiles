local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Run gofmt + goimport on save",
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.formatting_sync(nil, 500)
	end,
	group = format_sync_grp,
})

return {
	"ray-x/go.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
		"ray-x/guihua.lua",
	},
	event = {
		"CmdlineEnter",
	},
	ft = {
		"go",
		"gomod",
		"gowork",
		"gosum",
		"gotmpl",
		"gohtmltmpl",
		"gotexttmpl",
	},
	build = ':lua require("go.install").update_all_sync()',
	opts = {
		fillstruct = "gopls", -- Использовать gopls для fillstruct
		gofmt = "gopls", -- Использовать gopls для gofmt
		goimports = "gopls", -- Использовать gopls для goimports
		tag_transform = "camelcase", -- Преобразование тегов в camelCase

		lsp_cfg = true, -- Включить конфигурацию LSP
		lsp_gofumpt = true, -- Использовать gofumpt для форматирования
		lsp_keymaps = false,
		-- lsp_diag_virtual_text = { space = 0, prefix = "■" },
		-- lsp_diag_signs = true,
		lsp_diag_update_in_insert = false,
		lsp_document_formatting = true,
		lsp_inlay_hints = {
			enable = true,
			style = 'eol',
		},
		inlay_hints = { -- Настройки inlay hints
			enabled = true, -- Включить inlay hints
			only_current_line = false,
			only_current_line_autocmd = "CursorHold",
			show_variable_name = true,
			parameter_hints = true,
			other_hints = true,
		},

		test_runner = "go", -- Использовать `go test` для тестов
		verbose = false, -- Отключить вывод отладочной информации
		gocoverage_sign = '│',
		gocoverage_highlight = 'Comment',
		gocoverage_set_signs = true,
		gocoverage_show_summary = true,
		gocoverage_show_report = true,
	},
	keys = {
		{ '<leader>tc', '<cmd>GoCoverage<cr>',      { desc = 'Run test coverage' } },
		{ '<leader>tr', '<cmd>GoCoverageClear<cr>', { desc = 'Clear test coverage' } },
	},
}
