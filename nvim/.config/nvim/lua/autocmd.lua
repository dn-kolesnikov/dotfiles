-- hide line numbers, statusline in specific buffers!
-- local term_group = vim.api.nvim_create_augroup("HideStatusForTerminal", {clear = true})
-- vim.api.nvim_create_autocmd({
-- 		"BufEnter",
-- 		"BufWinEnter",
-- 		"CmdWinEnter",
-- 		"WinEnter",
-- 	}, {
-- 		group = term_group,
-- 		pattern = {},
-- 	})

vim.cmd(
	[[
		au BufEnter term://* setlocal nonumber
		au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname("%") == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
		au BufEnter term://* set laststatus=0
	]],
	false
)
