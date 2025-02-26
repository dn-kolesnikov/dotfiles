return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Интеграция с LSP
		"hrsh7th/cmp-nvim-lua", -- Автодополнение для Lua API NeoVim
		"hrsh7th/cmp-buffer", -- Автодополнение из буфера
		"hrsh7th/cmp-path", -- Автодополнение путей
		"hrsh7th/cmp-cmdline", -- Автодополнение командной строки
		"saadparwaiz1/cmp_luasnip", -- Интеграция с LuaSnip
		"L3MON4D3/LuaSnip", -- Сниппеты
		"zbirenbaum/copilot-cmp", -- GitHub Copilot
	},
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		local select_opts = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp", group_index = 2, keyword_length = 1 }, -- Источник для LSP
				{ name = "luasnip",  group_index = 2, keyword_length = 2 }, -- Источник для сниппетов
				{ name = "buffer",   group_index = 2, keyword_length = 3 }, -- Автодополнение из буфера
				{ name = "copilot",  group_index = 2, keyword_length = 1 }, -- Источник для Copilot
				{ name = "path" },              -- Автодополнение путей
				{ name = "cmdline" },           -- Автодополнение командной строки
			}),
			window = {
				documentation = cmp.config.window.bordered()
			},
			formatting = {
				fields = { "menu", "abbr", "kind" },
				format = function(entry, item)
					local icons = {
						nvim_lsp = "λ",
						luasnip = "⋗",
						buffer = "Ω",
						path = "🖫",
					}
					item.menu = icons[entry.source.name]
					return item
				end,
			},
			mapping = {
				["<Up>"] = cmp.mapping.select_prev_item(select_opts),
				["<Down>"] = cmp.mapping.select_next_item(select_opts),

				["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
				["<C-n>"] = cmp.mapping.select_next_item(select_opts),

				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),

				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				["<C-f>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-b>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<Tab>"] = cmp.mapping(function(fallback)
					local col = vim.fn.col(".") - 1
					if cmp.visible() then
						cmp.select_next_item(select_opts)
					elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
						fallback()
					else
						cmp.complete()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item(select_opts)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
		})
	end,
}
