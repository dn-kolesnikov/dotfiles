-- disable buildin plugins
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zipPlugin = 1

-- to disable Python 3 support
vim.g.loaded_python3_provider = 0
-- to disable Python 2 support
vim.g.loaded_python_provider = 0
-- to disable Ruby support
vim.g.loaded_ruby_provider = 0
-- to disable Node JS support
vim.g.loaded_node_provider = 0
-- to disable Perl support
vim.g.loaded_perl_provider = 0

-- global options
local options = {
	backup = false, -- no backup made
	clipboard = "unnamedplus", -- use system wide clipboard
	cmdheight = 2, -- more space in the neovim command line for displaing messages
	colorcolumn = "+1", -- highlight column after 'textwidth'
	completeopt = { "menu", "menuone", "noselect" }, -- completion options
	cursorline = true, -- highlight cursor line
	hlsearch = false, -- no highlight all maches
	laststatus = 3, -- always and ONLY the last window has a status line
	mouse = "a", -- use mouse for VISUAL-mode
	number = true, -- show number line
	relativenumber = true, -- relative line numbers
	smartcase = true, -- no ingore case in search patterns
	spelllang = { "en", "ru" }, -- list languages for spelling
	splitbelow = true, -- put new windows below current
	splitright = true, -- put new windows right of current
	swapfile = false, -- don"t use a swapfile for the buffer
	textwidth = 120, -- maximum width of text
	undofile = true, -- undo/redo enable
	wrap = false, -- disable line wrap
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
