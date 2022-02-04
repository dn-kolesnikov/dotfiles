-- disable buildin plugins
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
vim.g.loaded_tarPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
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

-- aliases and helpers

local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map space to leader
vim.g.mapleader = ' '

-- map 'jk' to ESC
map('i','kj','<esc>')
map('v','kj','<esc>')

-- global options
vim.opt.backup = false										-- don't use backup file
vim.opt.clipboard = 'unnamedplus'							-- use system wide clipboard
vim.opt.colorcolumn = '+1'									-- line lenght marker
vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}	-- completion options
vim.opt.cursorline = true									-- highlight cursor line
vim.opt.encoding = 'utf-8'									-- encoding
vim.opt.hlsearch = false									-- no highlight all maches
vim.opt.mouse = 'a'											-- use mouse for VISUAL-mode
vim.opt.number = true										-- show number line
vim.opt.relativenumber = true								-- relative line numbers
vim.opt.spelllang = {'en', 'ru'}							-- list languages for spelling
vim.opt.splitbelow = true									-- put new windows below current
vim.opt.splitright = true									-- put new windows right of current
vim.opt.swapfile = false									-- don't use a swapfile for the buffer
vim.opt.textwidth = 120										-- maximum width of text
vim.opt.undofile = true; vim.bo.undofile = true				-- undo/redo enable
vim.opt.wildmode = {'list:longest', 'full'}					-- command-line completion mode
vim.opt.wrap = false										-- disable line wrap

-- plugin settings

-- plugin manager started 1st
require('dk.plugin-manager')
--
require('dk.autosave')
require('dk.dap')
require('dk.explorer')
require('dk.golang')
require('dk.lsp')
require('dk.mini')
require('dk.null-ls')
require('dk.telescope')
require('dk.theme')
require('dk.toggleterm')
require('dk.treesitter')

-- hide line numbers, statusline in specific buffers!
vim.cmd(
	[[
		au BufEnter term://* setlocal nonumber
		au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
		au BufEnter term://* set laststatus=0
	]],
	false
)

-- Russian keyboard mappings
local langmap_keys = {
	'ёЁ;`~', '№;#',
	'йЙ;qQ', 'цЦ;wW', 'уУ;eE', 'кК;rR', 'еЕ;tT', 'нН;yY', 'гГ;uU', 'шШ;iI', 'щЩ;oO', 'зЗ;pP', 'хХ;[{', 'ъЪ;]}',
	'фФ;aA', 'ыЫ;sS', 'вВ;dD', 'аА;fF', 'пП;gG', 'рР;hH', 'оО;jJ', 'лЛ;kK', 'дД;lL', [[жЖ;\;:]], [[эЭ;'\"]],
	'яЯ;zZ', 'чЧ;xX', 'сС;cC', 'мМ;vV', 'иИ;bB', 'тТ;nN', 'ьЬ;mM', [[бБ;\,<]], 'юЮ;.>',
}
vim.opt.langmap = table.concat(langmap_keys, ',')
