-- plugin manager

local pm_path = string.format('%s/site/pack/paqs/start/paq-nvim', vim.fn.stdpath('data'))

if vim.fn.empty(vim.fn.glob(pm_path)) > 0 then
	vim.fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', pm_path})
end

require('paq') {
    -- Paq plugin manager
	{'savq/paq-nvim'},

	-- collection of common config's for LSP
    {'neovim/nvim-lspconfig'},

    -- a light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
    {'glepnir/lspsaga.nvim'},

    -- library for build-in Lua
	{'nvim-lua/plenary.nvim'},

	-- an implementation of the Popup API from Vim in Nvim
    --{'nvim-lua/popup.nvim'},

    -- Collection of minimal Lua modules to improve Neovim
    --{'echasnovski/mini.nvim'},

    -- a minimal implementation of Golang delevelopment plugin
    {'crispgm/nvim-go'},

    -- Golang development environment for Neovim
    --{'WhoIsSethDaniel/goldsmith.nvim'},

    -- A modern go neovim plugin based on treesitter, nvim-lsp and dap debugger.
    --{'ray-x/go.nvim'},
    -- nvim-go is a Go development plugin for Neovim written in pure Go.
    --{'zchee/nvim-go', run = 'make'},

    -- nvim-cmp source for buffer words
    --{'hrsh7th/cmp-buffer'},
    -- nvim-cmp source for buildin LSP client
    {'hrsh7th/cmp-nvim-lsp'},
    -- nvim-cmp source for neovim Lua API
    {'hrsh7th/cmp-nvim-lua'},
    -- completion engine plugin
    {'hrsh7th/nvim-cmp'},
    -- VSCode(LSP)'s snippet feature in vim
    {'hrsh7th/vim-vsnip'},
    -- this plugin provides some plugin integration
    --{'hrsh7th/vim-vsnip-integ'},

    -- treesitter configurations and abstraction layer
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
    -- create your own textobjects using tree-sitter queries
    {'nvim-treesitter/nvim-treesitter-textobjects'},
    -- refactoring using tree-sitter
    {'nvim-treesitter/nvim-treesitter-refactor'},

	-- debug adapter protocol client
    {'mfussenegger/nvim-dap'},
    -- UI plugin for nvim-dap
    {'rcarriga/nvim-dap-ui'},
    -- virtual text plugin for nvim-dap
    {'theHamsta/nvim-dap-virtual-text'},
    -- an extension for lauching Golang (delve) debuger
    {'leoluz/nvim-dap-go'},

    -- highly extendable fuzzy finder
    {'nvim-telescope/telescope.nvim'},
    -- integration for nvim-dap with telescope.nvim
    {'nvim-telescope/telescope-dap.nvim'},
    -- preview images, pdf, epub, video, and fonts
    {'nvim-telescope/telescope-media-files.nvim'},

    -- for file icons
    {'kyazdani42/nvim-web-devicons'},
    -- file explorer
    {'kyazdani42/nvim-tree.lua'},

	-- a super powerful autopair
    {'windwp/nvim-autopairs'},

    -- auto save buffer
    {'pocco81/autosave.nvim'},

    -- EditorConfig support
    {'editorconfig/editorconfig-vim'},

    -- a light-weight and Super Fast statusline
    {'hoob3rt/lualine.nvim'},

    -- a snazzy buffer line (with minimal tab integration)
    {'akinsho/bufferline.nvim'},

    -- OneDark color theme
    {'navarasu/onedark.nvim'},

    -- a neovim plugin to persist and toggle multiple terminals during an editing session
    {'akinsho/toggleterm.nvim'},
}

