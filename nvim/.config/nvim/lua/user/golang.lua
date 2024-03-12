-- gopher.nvim config
local status_ok, nvim_go = pcall(require, "go")
if not status_ok then
	return
end
nvim_go.setup()

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').goimport()
	end,
	group = format_sync_grp,
})
