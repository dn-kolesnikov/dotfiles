-- Set up nvim-cmp.
local status_ok, nvim_cmp = pcall(require, "cmp")
if not status_ok then
	return
end

nvim_cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = nvim_cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = nvim_cmp.mapping.preset.insert({
		["<C-b>"] = nvim_cmp.mapping.scroll_docs(-4),
		["<C-f>"] = nvim_cmp.mapping.scroll_docs(4),
		["<C-Space>"] = nvim_cmp.mapping.complete(),
		["<C-e>"] = nvim_cmp.mapping.abort(),
		["<CR>"] = nvim_cmp.mapping.confirm({ select = true }),
	}),
	sources = nvim_cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	})
})
local custom_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP config
local lspconfig = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local custom_on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local bufopts = { noremap=true, silent=true, buffer=bufnr }

	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<localleader>dj", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "<localleader>dk", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "<localleader>dl", "<cmd>Telescope diagnostics<cr>", bufopts)
	vim.keymap.set("n", "<localleader>r", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<localleader>gbf", vim.lsp.buf.format, bufopts)
end

local servers = {
	"ccls",
	"cssls",
	"gopls",
	"html",
	"volar",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = custom_on_attach,
		capabilities = custom_capabilities,
	})
end

lspconfig["lua_ls"].setup({
	on_attach = custom_on_attach,
	capabilities = custom_capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {"vim"},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

