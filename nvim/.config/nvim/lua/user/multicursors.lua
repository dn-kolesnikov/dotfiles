-- multicursor.nvim config
local status_ok, multi_cursor = pcall(require, "multicursors")
if not status_ok then
	return
end
multi_cursor.setup()
