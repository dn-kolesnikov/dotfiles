-- local dap_ok, dap = pcall(require, "dap")
-- if not (dap_ok) then
-- 	print("nvim-dap not installed!")
-- 	return
-- end
--
-- dap.set_log_level('INFO')
--
-- dap.configurations = {
-- 	go = {
-- 		{
-- 			type = "go",
-- 			name = "Debug",
-- 			request = "launch",
-- 			program = "${file}",
-- 		},
-- 	},
-- }
--
-- dap.adapters.go = {
-- 	type = "server",
-- 	port = "${port}",
-- 	executable = {
-- 		command = "dlv",
-- 		args = { "dap", "-l", "127.0.0.1:${port}" },
-- 	},
-- }

local status_ok, dap_go = pcall(require, "dap-go")
if not status_ok then
	return
end
dap_go.setup()
