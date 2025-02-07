return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
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
		},
		config = function()
			-- Настройка адаптеров для Go
			require("dap").adapters.go = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}

			-- Настройка конфигураций для Go
			require("dap").configurations.go = {
				{
					type = "go",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				{
					type = "go",
					name = "Debug Package",
					request = "launch",
					program = "${fileDirname}",
				},
				{
					type = "go",
					name = "Debug Test", -- Для отладки тестов
					request = "launch",
					mode = "test",
					program = "${fileDirname}",
				},
			}

			-- Настройка nvim-dap-ui
			require("dapui").setup()

			-- Настройка nvim-dap-virtual-text
			require("nvim-dap-virtual-text").setup()
		end,
		keys = {
			{ "<localleader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
			{ "<localleader>dc", function() require("dap").continue() end,          desc = "Run/Continue" },
			{ "<localleader>di", function() require("dap").step_into() end,         desc = "Step Into" },
			{ "<localleader>dO", function() require("dap").step_over() end,         desc = "Step Over" },
			{ "<localleader>do", function() require("dap").step_out() end,          desc = "Step Out" },
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
	{
		"leoluz/nvim-dap-go",
		opts = {},
	},
}
