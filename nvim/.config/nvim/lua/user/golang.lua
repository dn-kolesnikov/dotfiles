-- gopher.nvim config
local status_ok, nvim_go = pcall(require, "go")
if not status_ok then
	return
end
nvim_go.setup()

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)