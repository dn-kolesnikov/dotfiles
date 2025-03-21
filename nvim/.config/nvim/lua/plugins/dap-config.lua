return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				-- Настройка nvim-dap-virtual-text
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"nvim-neotest/nvim-nio",
				},
				opts = {},
				keys = {
					{ "<localleader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
					{ "<localleader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
				},
			},
			{
				"leoluz/nvim-dap-go",
				opts = {},
				ft = "go",

			},
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
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
			{ "<localleader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
			{ "<localleader>dc", function() require("dap").continue() end,          desc = "Run/Continue" },
			{ "<localleader>di", function() require("dap").step_into() end,         desc = "Step Into" },
			{ "<localleader>do", function() require("dap").step_over() end,         desc = "Step Over" },
			{ "<localleader>dO", function() require("dap").step_out() end,          desc = "Step Out" },
			{ "<localleader>dj", function() require("dap").down() end,              desc = "Down" },
			{ "<localleader>dk", function() require("dap").up() end,                desc = "Up" },
			{ "<localleader>dl", function() require("dap").run_last() end,          desc = "Run Last" },
			{ "<localleader>dP", function() require("dap").pause() end,             desc = "Pause" },
			{ "<localleader>dr", function() require("dap").repl.toggle() end,       desc = "Toggle REPL" },
			{ "<localleader>ds", function() require("dap").session() end,           desc = "Session" },
			{ "<localleader>dt", function() require("dap").terminate() end,         desc = "Terminate" },
			{ "<localleader>dw", function() require("dap.ui.widgets").hover() end,  desc = "Widgets" },
		},
	},
}
