return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	opts = {
		-- Конфигурация адаптеров для Go
		adapters = {
			delve = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			},
		},
		-- Конфигурации для Go
		configurations = {
			go = {
				{
					type = "delve",
					name = "Debug Test",
					request = "launch",
					mode = "test",
					program = "${fileDirname}",
					args = { "-test.v", "-test.run", "${selectedText}" },
				},
				{
					type = "delve",
					name = "Debug Current Test",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
					args = { "-test.v", "-test.run", "^${selectedText}$" },
				},
				{
					type = "delve",
					name = "Debug Package Tests",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
				{
					type = "delve",
					name = "Debug Application",
					request = "launch",
					program = "${fileDirname}",
					args = {},
				},
				{
					type = "delve",
					name = "Debug Application (with args)",
					request = "launch",
					program = "${fileDirname}",
					args = function()
						local args_string = vim.fn.input("Arguments: ")
						return vim.split(args_string, " ")
					end,
				},
				{
					type = "delve",
					name = "Attach to Process",
					request = "attach",
					mode = "local",
					processId = require("dap.utils").pick_process,
				},
			},
		},
	},
	config = function(_, opts)
		local dap, dapui = require("dap"), require("dapui")

		for adapter, config in pairs(opts.adapters or {}) do
			dap.adapters[adapter] = config
		end

		for lang, configs in pairs(opts.configurations or {}) do
			dap.configurations[lang] = configs
		end

		dap.listeners.after.event_initialized.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
	keys = {
		{
			"<localleader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Run/Continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<localleader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "Run Last",
		},
		{
			"<localleader>dr",
			function()
				require("dap").repl.toggle()
			end,
			desc = "Toggle REPL",
		},
		{
			"S-<F4>",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate",
		},
	},
}
