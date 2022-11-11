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
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"						-- use system wide clipboard
vim.opt.colorcolumn = "+1"
vim.opt.completeopt = {"menu", "menuone", "noselect"}	-- completion options
vim.opt.cursorline = true								-- highlight cursor line
vim.opt.hlsearch = false								-- no highlight all maches
vim.opt.mouse = "a"										-- use mouse for VISUAL-mode
vim.opt.number = true									-- show number line
vim.opt.relativenumber = true							-- relative line numbers
vim.opt.spelllang = {"en", "ru"}						-- list languages for spelling
vim.opt.splitbelow = true								-- put new windows below current
vim.opt.splitright = true								-- put new windows right of current
vim.opt.swapfile = false								-- don"t use a swapfile for the buffer
vim.opt.textwidth = 120									-- maximum width of text
vim.opt.undofile = true; vim.bo.undofile = true			-- undo/redo enable
vim.opt.wrap = false									-- disable line wrap
