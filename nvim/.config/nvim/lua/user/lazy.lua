local rootpath = vim.fn.stdpath("data") .. "/lazy"
local lazypath = rootpath .. "/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local function load_plugins()
	return {
		-- collection of common config"s for LSP
		{ "neovim/nvim-lspconfig" },
		-- library for build-in Lua
		{ "nvim-lua/plenary.nvim" },
		-- an implementation of the Popup API from Vim in Nvim
		{ "nvim-lua/popup.nvim" },

		-- OneDark color theme
		{ "navarasu/onedark.nvim" },

		-- EditorConfig support
		{ "editorconfig/editorconfig-vim" },

		-- auto save buffer
		{ "pocco81/auto-save.nvim" },

		-- for file icons
		{ "nvim-tree/nvim-web-devicons" },
		-- file explorer
		{ "nvim-tree/nvim-tree.lua" },

		-- a modern go neovim plugin based on treesitter, nvim-lsp and dap debugger.
		{ "ray-x/go.nvim" },
		-- float term, codeaction and codelens gui support
		{ "ray-x/guihua.lua" },

		-- debug adapter protocol client
		{ "mfussenegger/nvim-dap" },
		-- an extension for lauching Golang (delve) debuger
		{ "leoluz/nvim-dap-go" },
		-- UI plugin for nvim-dap
		{ "rcarriga/nvim-dap-ui" },
		-- virtual text plugin for nvim-dap
		{ "theHamsta/nvim-dap-virtual-text" },

		-- highly extendable fuzzy finder
		{ "nvim-telescope/telescope.nvim" },
		-- integration for nvim-dap with telescope.nvim
		{ "nvim-telescope/telescope-dap.nvim" },
		-- preview images, pdf, epub, video, and fonts
		{ "nvim-telescope/telescope-media-files.nvim" },

		-- treesitter configurations and abstraction layer
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		-- create your own textobjects using tree-sitter queries
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		-- refactoring using tree-sitter
		{ "nvim-treesitter/nvim-treesitter-refactor" },
	}
end

local opts = {
	root = rootpath,
	defaults = {
		lazy = true,
	},
	ui = {
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
}

require("lazy").setup(load_plugins(), opts)
