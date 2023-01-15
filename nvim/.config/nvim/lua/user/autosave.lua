-- auto-sava.nvim config
local status_ok, auto_save = pcall(require, "auto-save")
if not status_ok then
	return
end
auto_save.setup()
