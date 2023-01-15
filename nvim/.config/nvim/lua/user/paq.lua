-- plugin manager

-- Automatically install Paq
local install_path = string.format("%s/site/pack/paqs/start/paq-nvim", vim.fn.stdpath("data"))
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PAQ_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/savq/paq-nvim.git",
		install_path
	})
end

-- Use a protected call so we don't error out on first use
local status_ok, paq = pcall(require, "paq")
if not status_ok then
	return
end

paq {
	-- Paq plugin manager
	{"savq/paq-nvim"},

	-- collection of common config"s for LSP
	{"neovim/nvim-lspconfig"},

	-- library for build-in Lua
	{"nvim-lua/plenary.nvim"},

	-- an implementation of the Popup API from Vim in Nvim
	--{"nvim-lua/popup.nvim"},

	-- float term, codeaction and codelens gui support
	{"ray-x/guihua.lua"},

	-- Collection of minimal Lua modules to improve Neovim
	{"echasnovski/mini.nvim"},

	-- A completion engine plugin for neovim written in Lua.
	{"hrsh7th/nvim-cmp"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	-- Snippet Engine for Neovim written in Lua.
	{"L3MON4D3/LuaSnip"},
	{"saadparwaiz1/cmp_luasnip"},

	-- Minimalistic plugin for Go development in Neovim written in Lua.
	{"olexsmir/gopher.nvim"},

	-- A modern go neovim plugin based on treesitter, nvim-lsp and dap debugger.
	{"ray-x/go.nvim"},

	-- This is a simple extension to add TinyGo support to Neovim.
	{"dn-kolesnikov/tinygo-nvim"},

	-- treesitter configurations and abstraction layer
	{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
	-- create your own textobjects using tree-sitter queries
	{"nvim-treesitter/nvim-treesitter-textobjects"},
	-- refactoring using tree-sitter
	{"nvim-treesitter/nvim-treesitter-refactor"},

	-- debug adapter protocol client
	{"mfussenegger/nvim-dap"},
	-- UI plugin for nvim-dap
	{"rcarriga/nvim-dap-ui"},
	-- virtual text plugin for nvim-dap
	{"theHamsta/nvim-dap-virtual-text"},
	-- an extension for lauching Golang (delve) debuger
	{"leoluz/nvim-dap-go"},

	-- highly extendable fuzzy finder
	{"nvim-telescope/telescope.nvim"},
	-- integration for nvim-dap with telescope.nvim
	{"nvim-telescope/telescope-dap.nvim"},
	-- preview images, pdf, epub, video, and fonts
	{"nvim-telescope/telescope-media-files.nvim"},

	-- for file icons
	{"kyazdani42/nvim-web-devicons"},
	-- file explorer
	{"kyazdani42/nvim-tree.lua"},

	-- auto save buffer
	{"pocco81/auto-save.nvim"},

	-- EditorConfig support
	{"editorconfig/editorconfig-vim"},

	-- use Neovim as a language server to inject LSP diagnostics, code actions, and more
	{"jose-elias-alvarez/null-ls.nvim"},

	-- a neovim plugin to persist and toggle multiple terminals during an editing session
	{"akinsho/toggleterm.nvim"},

	-- OneDark color theme
	{"navarasu/onedark.nvim"},

}

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PAQ_BOOTSTRAP then
	paq:sync()
end

