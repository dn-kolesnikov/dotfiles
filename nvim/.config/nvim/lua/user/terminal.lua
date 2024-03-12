local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local bufopts = { noremap = true, silent = true }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], bufopts)
	vim.keymap.set('t', 'kj', [[<C-\><C-n>]], bufopts)
	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], bufopts)
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], bufopts)
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], bufopts)
	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], bufopts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], bufopts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })
function _PYTHON_TOGGLE()
	python:toggle()
end
