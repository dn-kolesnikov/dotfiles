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
-- vim.g.loaded_spellfile_plugin = 1
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

-- map space to leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable entire built-in ftplugin mappings to avoid conflicts.
-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
-- Or, disable per filetype (add as you like)
-- vim.g.no_python_maps = true
-- vim.g.no_ruby_maps = true
-- vim.g.no_rust_maps = true
-- vim.g.no_go_maps = true
vim.g.no_plugin_maps = true

vim.g.have_nerd_font = true
